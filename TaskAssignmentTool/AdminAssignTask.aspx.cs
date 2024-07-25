using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssignmentTool
{
    public partial class AdminAssignTask : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                LoadBatches();
            }
        }
        private void LoadBatches()
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT BatchNo, BatchName FROM batches", conn);
            DataTable batchesTable = new DataTable();
            adapter.Fill(batchesTable);

            DisplayBatchList.DataSource = batchesTable;
            DisplayBatchList.DataTextField = "BatchName";
            DisplayBatchList.DataValueField = "BatchNo";
            DisplayBatchList.DataBind();

            DisplayBatchList.Items.Insert(0, new ListItem("Select Batch", ""));

        }
        protected void DisplayBatchList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedBatchId = DisplayBatchList.SelectedValue;
            if (!string.IsNullOrEmpty(selectedBatchId))
            {
                LoadStudents(selectedBatchId);
            }
            else
            {
                DisplayStudentsList.Items.Clear();
            }
        }
        private void LoadStudents(string batchId)
        {
            string query = $"exec LoadStudents '{batchId}'";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
            adapter.SelectCommand.Parameters.AddWithValue("@BatchNo", batchId);

            DataTable studentsTable = new DataTable();
            adapter.Fill(studentsTable);

            DisplayStudentsList.DataSource = studentsTable;
            DisplayStudentsList.DataTextField = "Username";
            DisplayStudentsList.DataValueField = "UserID";
            DisplayStudentsList.DataBind();
            
        }
        protected void SelectAllCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in DisplayStudentsList.Items)
            {
                item.Selected = SelectAllCheckBox.Checked;
            }
        }

        protected void AddTask_Click(object sender, EventArgs e)
        {
            string[] selectedStudentIds = GetSelectedStudentIds();
            string Attachment_path = "";
            string taskname = TxtTaskName.Text;
            
            Attachment_path = "Attachment/" + Path.GetFileName(FileUploadTaskDocument.FileName);
            //FileUploadTaskDocument.SaveAs(Server.MapPath("Attachment/") + Path.GetFileName(FileUploadTaskDocument.FileName));
            
                 

            
            
            int batchno = int.Parse(DisplayBatchList.SelectedValue);
            DateTime createddate = DateTime.Now;
            string formattedDate = createddate.ToString("yyyy-MM-dd HH:mm:ss.fff");
            string query = $"exec AddTask '{taskname}','{Attachment_path}','{batchno}','{formattedDate}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            


            int taskId = Convert.ToInt32(cmd.ExecuteScalar());
            foreach (string studentId in selectedStudentIds)
            {
                string studentquery = $"exec AddinTaskStudent '{taskId}','{studentId}'";
                SqlCommand stucmd = new SqlCommand(studentquery, conn);
                stucmd.ExecuteNonQuery();
            }

        }
        private string[] GetSelectedStudentIds()
        {
            var selectedStudentIds = new System.Collections.Generic.List<string>();
            foreach (ListItem item in DisplayStudentsList.Items)
            {
                if (item.Selected)
                {
                    selectedStudentIds.Add(item.Value);
                }
            }
            return selectedStudentIds.ToArray();
        }
    }
}