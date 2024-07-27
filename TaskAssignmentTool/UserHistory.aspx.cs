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
    public partial class UserHistory : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindTaskGrid();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindTaskGrid();
        }

        private void BindTaskGrid()
        {
            string timePeriod = ddlTimePeriod.SelectedValue;
            string query = @"
        SELECT 
            t.TaskName,
            t.SubmissionDate,
            ts.SubmissionTime,
            ts.Status,
            ts.Score
        FROM task_students ts
        INNER JOIN task t ON ts.TaskID = t.TaskID
        WHERE ts.UserID = @UserID";

            switch (timePeriod)
            {
                case "Daily":
                    query += " AND CAST(t.SubmissionDate AS DATE) = CAST(GETDATE() AS DATE)";
                    break;
                case "Weekly":
                    query += " AND DATEPART(week, t.SubmissionDate) = DATEPART(week, GETDATE())";
                    break;
                case "Monthly":
                    query += " AND DATEPART(month, t.SubmissionDate) = DATEPART(month, GETDATE())";
                    break;
                case "Yearly":
                    query += " AND DATEPART(year, t.SubmissionDate) = DATEPART(year, GETDATE())";
                    break;
            }

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]); // Assuming the UserID is stored in the session
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataTable processedData = new DataTable();
            processedData.Columns.Add("TaskName");
            processedData.Columns.Add("Status");
            processedData.Columns.Add("Message");
            processedData.Columns.Add("SubmissionDate");
            processedData.Columns.Add("FinishDate");
            processedData.Columns.Add("Score");

            foreach (DataRow row in dt.Rows)
            {
                if (row["Status"].ToString() == "Approved") 
                {
                    DataRow newRow = processedData.NewRow();
                    newRow["TaskName"] = row["TaskName"];
                    newRow["SubmissionDate"] = row["SubmissionDate"];
                    newRow["FinishDate"] = row["SubmissionTime"];
                    newRow["Score"] = row["Score"];

                    DateTime assignDate = Convert.ToDateTime(row["SubmissionDate"]);
                    DateTime finishDate = Convert.ToDateTime(row["SubmissionTime"]);
                    if (finishDate <= assignDate)
                    {
                        newRow["Status"] = "On Time";
                    }
                    else
                    {
                        newRow["Status"] = "Late";
                    }

                    newRow["Message"] = "Approved";

                    processedData.Rows.Add(newRow);
                }
            }

            TaskGridView.DataSource = processedData;
            TaskGridView.DataBind();
            
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
    public partial class UserHistory : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindTaskGrid();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindTaskGrid();
        }

        private void BindTaskGrid()
        {
            string timePeriod = ddlTimePeriod.SelectedValue;
            string query = @"
        SELECT 
            t.TaskName,
            t.SubmissionDate,
            ts.SubmissionTime,
            ts.Status,
            ts.Score
        FROM task_students ts
        INNER JOIN task t ON ts.TaskID = t.TaskID
        WHERE ts.UserID = @UserID";

            switch (timePeriod)
            {
                case "Daily":
                    query += " AND CAST(t.SubmissionDate AS DATE) = CAST(GETDATE() AS DATE)";
                    break;
                case "Weekly":
                    query += " AND DATEPART(week, t.SubmissionDate) = DATEPART(week, GETDATE())";
                    break;
                case "Monthly":
                    query += " AND DATEPART(month, t.SubmissionDate) = DATEPART(month, GETDATE())";
                    break;
                case "Yearly":
                    query += " AND DATEPART(year, t.SubmissionDate) = DATEPART(year, GETDATE())";
                    break;
            }

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]); // Assuming the UserID is stored in the session
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataTable processedData = new DataTable();
            processedData.Columns.Add("TaskName");
            processedData.Columns.Add("Status");
            processedData.Columns.Add("Message");
            processedData.Columns.Add("SubmissionDate");
            processedData.Columns.Add("FinishDate");
            processedData.Columns.Add("Score");

            foreach (DataRow row in dt.Rows)
            {
                if (row["Status"].ToString() == "Approved") 
                {
                    DataRow newRow = processedData.NewRow();
                    newRow["TaskName"] = row["TaskName"];
                    newRow["SubmissionDate"] = row["SubmissionDate"];
                    newRow["FinishDate"] = row["SubmissionTime"];
                    newRow["Score"] = row["Score"];

                    DateTime assignDate = Convert.ToDateTime(row["SubmissionDate"]);
                    DateTime finishDate = Convert.ToDateTime(row["SubmissionTime"]);
                    if (finishDate <= assignDate)
                    {
                        newRow["Status"] = "On Time";
                    }
                    else
                    {
                        newRow["Status"] = "Late";
                    }

                    newRow["Message"] = "Approved";

                    processedData.Rows.Add(newRow);
                }
            }

            TaskGridView.DataSource = processedData;
            TaskGridView.DataBind();
            
        }
    }
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
}