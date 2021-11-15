using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using EFControllerUtilities;
using StudentRegistrationCodeFirstFromDB;
using StudentRegistrationValidation;

namespace StudentRegistrationConsoleApp
{
    public partial class AddOrUpdateCoursesForm : Form
    {

        public AddOrUpdateCoursesForm()
        {
            InitializeComponent();

            // register the event handlers
            this.Load += AddOrUpdateCourses_Load;
            buttonCoursesAdd.Click += ButtonCoursesAdd_Click;
            buttonCoursesUpdate.Click += ButtonCoursesUpdate_Click;

            // register event handler for when a car is selected

            listBoxCourses.SelectedIndexChanged += (s, e) => GetSelectedCourse();

    }

        private void GetSelectedCourse()
        {
            if (!(listBoxCourses.SelectedItem is Course course))
                return;
            //updating the textbox according to listbox selection
            textBoxCourseNumber.Text = course.CourseNumber.ToString();
            textBoxCourseName.Text = course.CourseName;
            for (int i = 0; i < listBoxDepartments.Items.Count; i++)
            {
                Department department = (Department)listBoxDepartments.Items[i];

                //selecting the department of the selected student
                if (department.DepartmentId == course.DepartmentId)
                {
                    listBoxDepartments.SelectedIndex = i;
                }
            }

        }

        private void ButtonCoursesUpdate_Click(object sender, EventArgs e)
        {
            if (!(listBoxCourses.SelectedItem is Course course))
            {
                MessageBox.Show("You must Select Course");
                return;
            }

            if (!(listBoxDepartments.SelectedItem is Department department))
            {
                MessageBox.Show("You must Select Department");
                return;
            }
            if (String.IsNullOrEmpty(textBoxCourseNumber.Text))
            {
                MessageBox.Show("Enter Course Number");
                return;
            }
            if (String.IsNullOrEmpty(textBoxCourseName.Text))
            {
                MessageBox.Show("Enter Course Name");
                return;
            }
            // get the student data from the textboxes and department from listbox

            course.CourseNumber = Convert.ToInt32(textBoxCourseNumber.Text);
            course.CourseName = textBoxCourseName.Text;
            course.Department = department;

            if (course.CourseInfoIsInvalid())
            {
                MessageBox.Show("Enter proper Course details");
                return;
            }
            if (course.CourseNumberDepartmentIdExists() && course.CourseNameExists())
            {
                MessageBox.Show("Similar already exist");
                return;
            }


            // now update the db
            if (Controller<StudentRegistrationEntities, Course>.UpdateEntity(course) == false)
            {
                MessageBox.Show("Course update to database failed");
                return;
            }

            // if everyting is ok, close the form.

            this.DialogResult = DialogResult.OK;

            Close(); // this will not dispose the form on hide!
        }

        private void ButtonCoursesAdd_Click(object sender, EventArgs e)
        {
            if (!(listBoxDepartments.SelectedItem is Department department))
            {
                MessageBox.Show("You must Select Department");
                return;
            }
            if(String.IsNullOrEmpty(textBoxCourseNumber.Text))
            {
                MessageBox.Show("Enter Course Number");
                return;
            }
            if (String.IsNullOrEmpty(textBoxCourseName.Text))
            {
                MessageBox.Show("Enter Course Name");
                return;
            }
            // get the student data from the textboxes and department from listbox

            Course course = new Course()
            {
               CourseNumber=Convert.ToInt32(textBoxCourseNumber.Text),
               CourseName=textBoxCourseName.Text,
               DepartmentId= department.DepartmentId
            };
            if (course.CourseInfoIsInvalid()) {
                MessageBox.Show("Enter proper Course details");
                return;
            }
            if (course.CourseNumberDepartmentIdExists() )
            {
                MessageBox.Show("Course with this Coures Number and Depatment already exist");
                return;
            }
            // now update the db
            if (Controller<StudentRegistrationEntities, Course>.AddEntity(course) == null)
            {
                MessageBox.Show("Course add to database failed");
                return;
            }

            // if everyting is ok, close the form.

            this.DialogResult = DialogResult.OK;

            Close(); // this will not dispose the form on hide!
        }

        private void AddOrUpdateCourses_Load(object sender, EventArgs e)
        {
            listBoxCourses.DataSource = Controller<StudentRegistrationEntities, Course>.GetEntitiesWithIncluded("Department").ToList();
            listBoxDepartments.DataSource = Controller<StudentRegistrationEntities, Department>.SetBindingList();

            // no student is selected to start


            listBoxCourses.SelectedIndex = -1;
            listBoxDepartments.SelectedIndex = -1;

            // set all textboxes to blank

            textBoxCourseNumber.ResetText();
            textBoxCourseName.ResetText();
        }
    }
}
