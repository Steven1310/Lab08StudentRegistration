using StudentRegistrationCodeFirstFromDB;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentRegistrationValidation
{
    public static class CourseValidation
    {
        /// <summary>
        /// See if a course already exist
        /// </summary>
        /// <param name="CourseNumber & DepartmentId"></param>
        /// <returns>Boolean</returns>
        public static bool CourseNumberDepartmentIdExists(this Course course)
        {
            using (StudentRegistrationEntities context = new StudentRegistrationEntities())
            {
                context.Database.Log = (s => Debug.Write(s));
                return context.Courses
                     .Where(c => c.CourseNumber == course.CourseNumber)
                     .Where(c => c.DepartmentId == course.DepartmentId)
                     .Any();
            }
        }

        /// <summary>
        /// Make sure all course info exists and is not blank
        /// </summary>
        /// <param name="course"></param>
        /// <returns></returns>
        public static bool CourseInfoIsInvalid(this Course course)
        {
            return (course == null ||
                    course.CourseName == null || course.CourseName.Trim().Length == 0 ||
                    course.DepartmentId == null);
        }


        /// <summary>
        /// Checks if there is the course name already exists
        /// </summary>
        /// <param name="course"></param>
        /// <returns></returns>
        public static bool CourseNameExists(this Course course)
        {
            using (StudentRegistrationEntities context = new StudentRegistrationEntities())
            {
                context.Database.Log = (s => Debug.Write(s));
                return context.Courses.Any(c => c.CourseName == course.CourseName);
            }
        }

    }

}
