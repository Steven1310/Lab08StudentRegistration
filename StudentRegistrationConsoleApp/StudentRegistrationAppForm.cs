using EFControllerUtilities;
using SeedDatabaseExtensions;
using StudentRegistrationCodeFirstFromDB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StudentRegistrationConsoleApp
{
    public partial class StudentRegistrationAppForm : Form
    {
        public StudentRegistrationAppForm()
        {
            InitializeComponent();
            this.Text = "Student Registration Application";
            this.Load += (s, e) => StudentRegistrationAppMainForm_Load();

            AddOrUpdateStudentForm addUpdateStudentForm = new AddOrUpdateStudentForm();
            buttonAddUpdateStudent.Click += (s, ee) => AddOrUpdateForm<Student>(dataGridViewStudents, addUpdateStudentForm);
        }

        private void StudentRegistrationAppMainForm_Load()
        {

            //Use seed database here


            InitializeDataGridView<Student>(dataGridViewStudents, "Department", "Courses");


            StudentRegistrationEntities context = new StudentRegistrationEntities();


        }

        private void AddOrUpdateForm<T>(DataGridView dataGridViewStudents, AddOrUpdateStudentForm addUpdateStudentForm) where T : class
        {
            var output = addUpdateStudentForm.ShowDialog();

            // form has closed

            if (output == DialogResult.OK)
            {
                // reload the db and update the gridview

                dataGridViewStudents.DataSource = Controller<StudentRegistrationEntities, T>.SetBindingList();

                // update Registration gridview

            }

            // do not close, as the form object will be disposed, 
            // just hide the form (make it invisible). 
            // 
            // when the inputForm is opened again (ShowDialog()), the Load event will fire
            //  and the form will be reinitialized

            addUpdateStudentForm.Hide();
        }
        private void InitializeDataGridView<T>(DataGridView gridView, params string[] columnsToHide) where T : class
        {
            // Allow users to add/delete rows, and fill out columns to the entire width of the control

            gridView.AllowUserToAddRows = false;

            gridView.AllowUserToDeleteRows = true;
            gridView.ReadOnly = true;
            gridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

            // set the handler used to delete an item. Note use of generics.

            gridView.UserDeletingRow += (s, e) => DeletingRow<T>(s as DataGridView, e);

            // probably not needed, but just in case we have some issues

            gridView.DataError += (s, e) => HandleDataError<T>(s as DataGridView, e);

            gridView.DataSource = Controller<StudentRegistrationEntities, T>.SetBindingList();


            foreach (string column in columnsToHide)
                gridView.Columns[column].Visible = false;
        }
        /// <summary>
        /// Catch any gridview data error, log to debug and cancel any event.
        /// Should not happen, as all of our gridviews are readonly. Might show up when items
        /// are deleted.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="dataGridView"></param>
        /// <param name="e"></param>
        private void HandleDataError<T>(DataGridView dataGridView, DataGridViewDataErrorEventArgs e) where T : class
        {
            Debug.WriteLine("DataError " + typeof(T) + " " + dataGridView.Name + " row " + e.RowIndex + " col " + e.ColumnIndex + " Context: " + e.Context.ToString());
            e.Cancel = true;
        }
        /// <summary>
        /// Handler to delete the selected row (item) from a gridview and update the DB.
        /// Update the gridview with the revised data from the DB, as well
        /// as the customer orders report gridview.
        /// </summary>
        /// <typeparam name="T">Data type associated with the gridview</typeparam>
        /// <param name="dataGridView">DataGridView used to delete the row</param>
        /// <param name="e"></param>
        private void DeletingRow<T>(DataGridView dataGridView, DataGridViewRowCancelEventArgs e) where T : class
        {
            // get the item

            T item = e.Row.DataBoundItem as T;

            Debug.WriteLine("DeletingRow " + e.Row.Index + " entity " + typeof(T) + " " + item);

            // Delete the item in the DB. No need to worry about dependencies, as there is no context!
            // Just let cascade delete take care of it.

            Controller<StudentRegistrationEntities, T>.DeleteEntity(item);
            dataGridView.Refresh();

            // The Orders table always gets updated, this forces the update from the DB.
            // It will show the effect of cascade delete in the DB.

        }
    }
}
