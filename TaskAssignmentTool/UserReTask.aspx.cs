using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace TaskAssignmentTool
{
    public partial class UserReTask : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindTasks();
            }
        }

        private void BindTasks()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString; 
            string userId = Session["UserID"].ToString();

            string query = $"exec DisplayRetask '{userId}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            TaskGridView.DataSource = dt;
            TaskGridView.DataBind();
        }

        protected void TaskGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UploadSolution")
            {
                ViewState["TaskStudentID"] = e.CommandArgument;
                ScriptManager.RegisterStartupScript(this, GetType(), "showUploadModal", "showUploadModal();", true);
            }
        }

        protected void btnUploadSolution_Click(object sender, EventArgs e)
        {
            int taskStudentID = Convert.ToInt32(ViewState["TaskStudentID"]);
            if (fileUploadSolution.HasFile)
            {
                string filePath = Server.MapPath("~/Uploads/") + fileUploadSolution.FileName;
                fileUploadSolution.SaveAs(filePath);

                string connectionString = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString; 
                string query = @"
    UPDATE Task_Students 
    SET 
        Solution = @SolutionPath, 
        SubmissionTime = @SubmissionDate, 
        Status = NULL, 
        Reason = NULL 
    WHERE TaskStudentID = @TaskStudentID";

                using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    string currentdate = DateTime.Now.ToString("yyyy-MM-dd");
                    cmd.Parameters.AddWithValue("@SolutionPath", "~/Uploads/" + fileUploadSolution.FileName);
                    cmd.Parameters.AddWithValue("@SubmissionDate", currentdate);
                    cmd.Parameters.AddWithValue("@TaskStudentID", taskStudentID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                BindTasks();
            }
        }
    }
}