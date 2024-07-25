using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssignmentTool
{
    public partial class AdminTaskReview : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindTaskData();
            }
        }

        private void BindTaskData()
        {
            string query = "exec FetchTask";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dt.Columns.Add("Status", typeof(string));

            foreach (DataRow row in dt.Rows)
            {
                DateTime submissionTime = (DateTime)row["FinishDate"];
                DateTime submissionDeadline = (DateTime)row["SubmissionDate"];

                row["Status"] = submissionTime <= submissionDeadline ? "OnTime" : "Late";
            }

            TaskGridView.DataSource = dt;
            TaskGridView.DataBind();
            
        }

        protected void TaskGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                int taskStudentID = Convert.ToInt32(e.CommandArgument);
                UpdateTaskStatus(taskStudentID, "Approved", null);
                BindTaskData();
            }
            else if (e.CommandName == "Reject")
            {
                int taskStudentID = Convert.ToInt32(e.CommandArgument);
                ViewState["TaskStudentID"] = taskStudentID; 

                ScriptManager.RegisterStartupScript(this, GetType(), "showRejectModal", "showRejectModal();", true);
            }
        }

        protected void btnSubmitReject_Click(object sender, EventArgs e)
        {
            if (ViewState["TaskStudentID"] != null)
            {
                int taskStudentID = Convert.ToInt32(ViewState["TaskStudentID"]);
                string rejectReason = txtRejectReason.Text.Trim();
                UpdateTaskStatus(taskStudentID, "Rejected", rejectReason);
                ViewState["TaskStudentID"] = null;
                BindTaskData();
            }
        }

        private void UpdateTaskStatus(int taskStudentID, string status, string reason)
        {
            string query = "UPDATE task_students SET Status = @Status, Reason = @RejectReason WHERE TaskStudentID = @TaskStudentID";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@RejectReason", reason ?? (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@TaskStudentID", taskStudentID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}