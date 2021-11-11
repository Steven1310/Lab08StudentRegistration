using EFControllerUtilities;
using StudentRegistrationCodeFirstFromDB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StudentRegistrationConsoleApp
{
    public partial class AddOrUpdateStudentForm : Form
    {
        public AddOrUpdateStudentForm()
        {
            InitializeComponent();


            // register the event handlers
            this.Load += AddOrUpdateStudentForm_Load;
            buttonStudentAdd.Click += ButtonAdd_Click;
            buttonStudentUpdate.Click += ButtonUpdate_Click;

            // register event handler for when a car is selected

            listBoxStudents.SelectedIndexChanged += (s, e) => GetSelectedStudent();


        }

        private void AddOrUpdateStudentForm_Load(object sender, EventArgs e)
        {
            // bind the listbox of students to the Students table.

            listBoxStudents.DataSource = Controller<StudentRegistrationEntities, Student>.SetBindingList();
            listBoxDepartments.DataSource = Controller<StudentRegistrationEntities, Department>.SetBindingList();

            // no student is selected to start


            listBoxStudents.SelectedIndex = -1;
            listBoxDepartments.SelectedIndex = -1;

            // set all textboxes to blank

            textBoxFirstName.ResetText();
            textBoxLastName.ResetText();
        }

        private void ButtonUpdate_Click(object sender, EventArgs e)
        {
            // make sure a student is selected
            // could use SelectedIndex < 0 here as well

            if (!(listBoxStudents.SelectedItem is Student student))
            {
                MessageBox.Show("You need to select a student to update");
                return;
            }

            if (!(listBoxDepartments.SelectedItem is Department department))
            {
                MessageBox.Show("You need to select a Department to update");
                return;
            }

            student.StudentFirstName = textBoxFirstName.Text;
            student.StudentLastName = textBoxLastName.Text;
            student.DepartmentId = department.DepartmentId;

            if (Controller<StudentRegistrationEntities, Student>.UpdateEntity(student) == false)
            {
                MessageBox.Show("Student update to database failed");
                return;
            }

            this.DialogResult = DialogResult.OK;

            Close(); // this will not dispose the form on hide!

        }

        private void ButtonAdd_Click(object sender, EventArgs e)
        {

            if (!(listBoxDepartments.SelectedItem is Department department))
            {
                MessageBox.Show("You must Select Department");
                return;
            }

            // get the student data from the textboxes and department from listbox

            Student student = new Student()
            {
                StudentFirstName = textBoxFirstName.Text,
                StudentLastName = textBoxLastName.Text,
                DepartmentId = department.DepartmentId,
            };
            // now update the db
            if (Controller<StudentRegistrationEntities, Student>.AddEntity(student) == null)
            {
                MessageBox.Show("Student add to database failed");
                return;
            }

            // if everyting is ok, close the form.

            this.DialogResult = DialogResult.OK;

            Close(); // this will not dispose the form on hide!
        }

        /// <summary>
        /// 
        /// </summary>
        private void GetSelectedStudent()
        {
            if (!(listBoxStudents.SelectedItem is Student student))
                return;
            //updating the textbox according to listbox selection
            textBoxFirstName.Text = student.StudentFirstName;
            textBoxLastName.Text = student.StudentLastName;
            for (int i = 0; i < listBoxDepartments.Items.Count; i++)
            {
                Department department = (Department)listBoxDepartments.Items[i];

                //selecting the department of the selected student
                if (department.DepartmentId == student.DepartmentId)
                {
                    listBoxDepartments.SelectedIndex = i;
                }
            }
        }
    }
}
