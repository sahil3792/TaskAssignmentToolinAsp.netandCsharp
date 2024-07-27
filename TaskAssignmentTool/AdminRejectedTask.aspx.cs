using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Collections;

namespace TaskAssignmentTool
{
    public partial class AdminRejectedTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn;
            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
                conn = new SqlConnection(cs);
                BindRejectedTasks();
            }
        }

        private void BindRejectedTasks()
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            string query = "exec FetchRejectedTask"; // Fetch only rejected tasks
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dt.Columns.Add("Status", typeof(string));

            foreach (DataRow row in dt.Rows)
            {
                DateTime submissionTime = Convert.ToDateTime(row["FinishDate"]);
                DateTime submissionDate = GetTaskSubmissionDate(Convert.ToInt32(row["TaskID"]));
                row["Status"] = submissionTime <= submissionDate ? "OnTime" : "Late";
            }

            TaskGridView.DataSource = dt;
            TaskGridView.DataBind();
            
        }

        private DateTime GetTaskSubmissionDate(int taskID)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            string query = $"exec FetchTaskSubmissionDate '{taskID}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            return Convert.ToDateTime(cmd.ExecuteScalar());
            
        }

        protected void TaskGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AssignNewTask")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                if (rowIndex >= 0 && rowIndex < TaskGridView.Rows.Count)
                {
                    int userID = Convert.ToInt32(TaskGridView.DataKeys[rowIndex].Values["UserID"]);
                    int batchNo = Convert.ToInt32(TaskGridView.DataKeys[rowIndex].Values["BatchNo"]);

                    ViewState["SelectedUserID"] = userID;
                    ViewState["SelectedBatchNo"] = batchNo;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "$('#assignTaskModal').modal('show');", true);
                }
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            
            if (ViewState["SelectedUserID"] != null)
            {
                int userID = (int)ViewState["SelectedUserID"];
                int batchNo = (int)ViewState["SelectedBatchNo"];
                string taskName = txtTaskName.Text.Trim();
                string filePath = "";

                if (fileUpload.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(fileUpload.PostedFile.FileName);
                    filePath = Server.MapPath("~/Uploads/") + fileName;
                    fileUpload.SaveAs(filePath);
                }
                string Currentdate = DateTime.Now.ToString("yyyy-MM-dd");
                DateTime NewDate = DateTime.Parse(Currentdate);
                string taskQuery = $"exec InsertNewTask '{taskName}','{filePath}','{batchNo}','{Currentdate}' ";
                int newTaskID;
                SqlCommand cmd = new SqlCommand(taskQuery, conn);
                conn.Open();
                newTaskID = Convert.ToInt32(cmd.ExecuteScalar());
                string taskStudentQuery = $"exec InsertTaskStudentRejection '{newTaskID}','{userID}' ";
                SqlCommand cmd1 = new SqlCommand(taskStudentQuery, conn);

                cmd1.ExecuteNonQuery();
                BindRejectedTasks();
            }
        }
    }
}