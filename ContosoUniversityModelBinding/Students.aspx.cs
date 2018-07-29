using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ContosoUniversityModelBinding.Models;
using System.Data.Entity;

namespace ContosoUniversityModelBinding
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<ContosoUniversityModelBinding.Models.Student> studentsGrid_GetData()
        {
            SchoolContext db = new SchoolContext();
            var query = db.Students.Include(s => s.Enrollments.Select(e => e.Course));
            return query;
        }
    }
}