using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace TaskAssignmentTool
{
    public partial class UserMyTask : System.Web.UI.Page
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
            int userId = int.Parse(Session["UserID"].ToString());
            string query = $"exec UserTask '{userId}'";

            SqlCommand cmd = new SqlCommand(query, conn);
            

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            TaskGridView.DataSource = dt;
            TaskGridView.DataBind();
            
        }
        protected void TaskGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                string filePath = e.CommandArgument.ToString();
                string fullPath = Server.MapPath(filePath);

                if (File.Exists(fullPath))
                {
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", $"attachment; filename={Path.GetFileName(fullPath)}");
                    Response.TransmitFile(fullPath);
                    Response.End();
                }
            }
            else if (e.CommandName == "Solution")
            {
                string taskStudentID = e.CommandArgument.ToString();
                TaskStudentIDHiddenField.Value = taskStudentID;
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "$('#SolutionModal').modal('show');", true);
            }
        }

        protected void UploadSolutionButton_Click(object sender, EventArgs e)
        {
            if (SolutionFileUpload.HasFile)
            {
                SolutionFileUpload.SaveAs(Server.MapPath("Solutions/")+Path.GetFileName(SolutionFileUpload.FileName));
                string Solutionfile = "Solutions/"+Path.GetFileName(SolutionFileUpload.FileName);
                //SqlConnection conn = new SqlConnection(cs);
                int taskStudentID = int.Parse(TaskStudentIDHiddenField.Value);
                string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
                
                
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = @"exec AddSolutionToTaskStudent @Solution,@SubmissionTime,@TaskStudentID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.Add("@Solution", SqlDbType.VarChar).Value = Solutionfile;
                        cmd.Parameters.Add("@SubmissionTime", SqlDbType.DateTime).Value = DateTime.Now;
                        cmd.Parameters.Add("@TaskStudentID", SqlDbType.Int).Value = taskStudentID;

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                BindTaskData();


                ScriptManager.RegisterStartupScript(this, GetType(), "CloseModal", "$('#SolutionModal').modal('hide');", true);
            }
        }

        protected string GetActionText(DateTime submissionDate)
        {
            if (DateTime.Now <= submissionDate)
            {
                return "On Time";
            }
            else
            {
                return "Late";
            }
        }
    }
}