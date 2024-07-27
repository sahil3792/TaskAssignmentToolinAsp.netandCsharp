<<<<<<< HEAD
﻿using System;
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
    public partial class AdminAssignScore : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            if (!IsPostBack)
            {
                BindTaskData();
            }
        }

        private void BindTaskData()
        {
            string query = "exec fetchOnlyApprovedTask;"; 

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dt.Columns.Add("Status", typeof(string));

            foreach (DataRow row in dt.Rows)
            {
                DateTime submissionTime = (DateTime)row["FinishDate"];
                DateTime submissionDeadline = (DateTime)row["SubmissionDate"];

                if (submissionTime <= submissionDeadline)
                {
                    row["Status"] = "OnTime";
                }
                else
                {
                    row["Status"] = "Late";
                }
            }

            TaskGridView.DataSource = dt;
            TaskGridView.DataBind();
            
        }

        protected void TaskGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtScore = (TextBox)e.Row.FindControl("txtScore");
                HiddenField hfTaskStudentID = (HiddenField)e.Row.FindControl("hfTaskStudentID");
            }
        }

        protected void TaskGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SubmitScore")
            {
                
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                TextBox txtScore = (TextBox)row.FindControl("txtScore");
                int taskStudentID = Convert.ToInt32(e.CommandArgument);
                string score = txtScore.Text;
                UpdateTaskScore(taskStudentID, score);
            }
        }

        private void UpdateTaskScore(int taskStudentID, string score)
        {
            string query = $"exec UpdateTaskScore '{score}','{taskStudentID}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            BindTaskData();
        }
    }
}
    
=======
﻿using System;
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
    public partial class AdminAssignScore : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            if (!IsPostBack)
            {
                BindTaskData();
            }
        }

        private void BindTaskData()
        {
            string query = "exec fetchOnlyApprovedTask;"; 

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dt.Columns.Add("Status", typeof(string));

            foreach (DataRow row in dt.Rows)
            {
                DateTime submissionTime = (DateTime)row["FinishDate"];
                DateTime submissionDeadline = (DateTime)row["SubmissionDate"];

                if (submissionTime <= submissionDeadline)
                {
                    row["Status"] = "OnTime";
                }
                else
                {
                    row["Status"] = "Late";
                }
            }

            TaskGridView.DataSource = dt;
            TaskGridView.DataBind();
            
        }

        protected void TaskGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtScore = (TextBox)e.Row.FindControl("txtScore");
                HiddenField hfTaskStudentID = (HiddenField)e.Row.FindControl("hfTaskStudentID");
            }
        }

        protected void TaskGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SubmitScore")
            {
                
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                TextBox txtScore = (TextBox)row.FindControl("txtScore");
                int taskStudentID = Convert.ToInt32(e.CommandArgument);
                string score = txtScore.Text;
                UpdateTaskScore(taskStudentID, score);
            }
        }

        private void UpdateTaskScore(int taskStudentID, string score)
        {
            string query = $"exec UpdateTaskScore '{score}','{taskStudentID}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            BindTaskData();
        }
    }
}
    
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
