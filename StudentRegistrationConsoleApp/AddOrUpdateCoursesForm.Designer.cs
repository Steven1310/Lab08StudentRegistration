namespace StudentRegistrationConsoleApp
{
    partial class AddOrUpdateCoursesForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.buttonCoursesUpdate = new System.Windows.Forms.Button();
            this.buttonCoursesAdd = new System.Windows.Forms.Button();
            this.listBoxDepartments = new System.Windows.Forms.ListBox();
            this.listBoxCourses = new System.Windows.Forms.ListBox();
            this.labelDepartment = new System.Windows.Forms.Label();
            this.labelCourses = new System.Windows.Forms.Label();
            this.textBoxCourseName = new System.Windows.Forms.TextBox();
            this.textBoxCourseNumber = new System.Windows.Forms.TextBox();
            this.labelCourseName = new System.Windows.Forms.Label();
            this.labelCourseNumber = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // buttonCoursesUpdate
            // 
            this.buttonCoursesUpdate.Location = new System.Drawing.Point(270, 560);
            this.buttonCoursesUpdate.Name = "buttonCoursesUpdate";
            this.buttonCoursesUpdate.Size = new System.Drawing.Size(75, 23);
            this.buttonCoursesUpdate.TabIndex = 19;
            this.buttonCoursesUpdate.Text = "Update";
            this.buttonCoursesUpdate.UseVisualStyleBackColor = true;
            // 
            // buttonCoursesAdd
            // 
            this.buttonCoursesAdd.Location = new System.Drawing.Point(148, 560);
            this.buttonCoursesAdd.Name = "buttonCoursesAdd";
            this.buttonCoursesAdd.Size = new System.Drawing.Size(75, 23);
            this.buttonCoursesAdd.TabIndex = 18;
            this.buttonCoursesAdd.Text = "Add";
            this.buttonCoursesAdd.UseVisualStyleBackColor = true;
            // 
            // listBoxDepartments
            // 
            this.listBoxDepartments.FormattingEnabled = true;
            this.listBoxDepartments.Location = new System.Drawing.Point(188, 270);
            this.listBoxDepartments.Name = "listBoxDepartments";
            this.listBoxDepartments.Size = new System.Drawing.Size(145, 121);
            this.listBoxDepartments.TabIndex = 15;
            // 
            // listBoxCourses
            // 
            this.listBoxCourses.FormattingEnabled = true;
            this.listBoxCourses.Location = new System.Drawing.Point(188, 28);
            this.listBoxCourses.Name = "listBoxCourses";
            this.listBoxCourses.Size = new System.Drawing.Size(208, 212);
            this.listBoxCourses.TabIndex = 14;
            // 
            // labelDepartment
            // 
            this.labelDepartment.AutoSize = true;
            this.labelDepartment.Location = new System.Drawing.Point(79, 270);
            this.labelDepartment.Name = "labelDepartment";
            this.labelDepartment.Size = new System.Drawing.Size(62, 13);
            this.labelDepartment.TabIndex = 13;
            this.labelDepartment.Text = "Department";
            // 
            // labelCourses
            // 
            this.labelCourses.AutoSize = true;
            this.labelCourses.Location = new System.Drawing.Point(79, 28);
            this.labelCourses.Name = "labelCourses";
            this.labelCourses.Size = new System.Drawing.Size(45, 13);
            this.labelCourses.TabIndex = 10;
            this.labelCourses.Text = "Courses";
            // 
            // textBoxCourseName
            // 
            this.textBoxCourseName.Location = new System.Drawing.Point(188, 472);
            this.textBoxCourseName.Name = "textBoxCourseName";
            this.textBoxCourseName.Size = new System.Drawing.Size(145, 20);
            this.textBoxCourseName.TabIndex = 23;
            // 
            // textBoxCourseNumber
            // 
            this.textBoxCourseNumber.Location = new System.Drawing.Point(188, 424);
            this.textBoxCourseNumber.Name = "textBoxCourseNumber";
            this.textBoxCourseNumber.Size = new System.Drawing.Size(145, 20);
            this.textBoxCourseNumber.TabIndex = 22;
            // 
            // labelCourseName
            // 
            this.labelCourseName.AutoSize = true;
            this.labelCourseName.Location = new System.Drawing.Point(79, 472);
            this.labelCourseName.Name = "labelCourseName";
            this.labelCourseName.Size = new System.Drawing.Size(71, 13);
            this.labelCourseName.TabIndex = 21;
            this.labelCourseName.Text = "Course Name";
            // 
            // labelCourseNumber
            // 
            this.labelCourseNumber.AutoSize = true;
            this.labelCourseNumber.Location = new System.Drawing.Point(79, 424);
            this.labelCourseNumber.Name = "labelCourseNumber";
            this.labelCourseNumber.Size = new System.Drawing.Size(80, 13);
            this.labelCourseNumber.TabIndex = 20;
            this.labelCourseNumber.Text = "Course Number";
            // 
            // AddOrUpdateCourses
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(522, 607);
            this.Controls.Add(this.textBoxCourseName);
            this.Controls.Add(this.textBoxCourseNumber);
            this.Controls.Add(this.labelCourseName);
            this.Controls.Add(this.labelCourseNumber);
            this.Controls.Add(this.buttonCoursesUpdate);
            this.Controls.Add(this.buttonCoursesAdd);
            this.Controls.Add(this.listBoxDepartments);
            this.Controls.Add(this.listBoxCourses);
            this.Controls.Add(this.labelDepartment);
            this.Controls.Add(this.labelCourses);
            this.Name = "AddOrUpdateCourses";
            this.Text = "AddOrUpdateCourses";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonCoursesUpdate;
        private System.Windows.Forms.Button buttonCoursesAdd;
        private System.Windows.Forms.ListBox listBoxDepartments;
        private System.Windows.Forms.ListBox listBoxCourses;
        private System.Windows.Forms.Label labelDepartment;
        private System.Windows.Forms.Label labelCourses;
        private System.Windows.Forms.TextBox textBoxCourseName;
        private System.Windows.Forms.TextBox textBoxCourseNumber;
        private System.Windows.Forms.Label labelCourseName;
        private System.Windows.Forms.Label labelCourseNumber;
    }
}