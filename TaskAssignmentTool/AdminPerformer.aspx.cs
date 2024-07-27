using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssignmentTool
{
    public partial class AdminPerformer : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fromDate = txtFromDate.Text;
            string toDate = txtToDate.Text;
            DateTime fromdate = DateTime.Parse(fromDate),todate =DateTime.Parse(toDate);
            
            BindTopScores(fromdate,todate);
            // Perform your date processing and any required actions here
        }
        private void BindTopScores(DateTime fromdate,DateTime todate)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            string query = $"exec TopThreeUserAdmin '{fromdate.ToString("yyyy-MM-dd HH:mm:ss")}','{todate.ToString("yyyy-MM-dd HH:mm:ss")}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            


            SqlDataReader reader = cmd.ExecuteReader();
            rptTopUsers.DataSource = reader;
            rptTopUsers.DataBind();

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            int weekNo = int.Parse(txtWeekNo.Text);
            string fromdate = txtFromDate.Text,todate=txtToDate.Text;
            DateTime fromDate = DateTime.Parse(fromdate);
            DateTime toDate = DateTime.Parse(todate);
            string query = $"INSERT INTO Performer (WeekNo, FromDate, ToDate) VALUES ('{weekNo}', '{fromDate.ToString("yyyy-MM-dd HH:mm")}', '{toDate.ToString("yyyy-MM-dd HH:mm")}')";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
                
            

            
            txtWeekNo.Text = "";
        }
    }
}