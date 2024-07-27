<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssignmentTool
{
    public partial class UserPerformance : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindWeek();
            }
        }
        private void BindWeek()
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT ID,WeekNo,fromdate, toDate FROM performer", conn);
            DataTable batchesTable = new DataTable();
            adapter.Fill(batchesTable);

            DropDownList1.DataSource = batchesTable;
            DropDownList1.DataTextField = "WeekNo";
            DropDownList1.DataValueField = "ID";
            DropDownList1.DataBind();

            DropDownList1.Items.Insert(0, new ListItem("Select Week", ""));
        }
        private void BindTopScores()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            int id = int.Parse(DropDownList1.SelectedValue);
            string fetchdatequery = $"select fromDate,toDate from performer where id = '{id}'";
            SqlCommand ftch = new SqlCommand(fetchdatequery, conn);
            SqlDataReader rdr =  ftch.ExecuteReader();
            rdr.Read();
            DateTime fromdate = DateTime.Parse(rdr["fromDate"].ToString());
            DateTime todate = DateTime.Parse(rdr["toDate"].ToString());
            
            string query = $"exec TopThreeUserAdmin '{fromdate.ToString("yyyy-MM-dd HH:mm")}','{todate.ToString("yyyy-MM-dd HH:mm")}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            
            

            SqlDataReader reader = cmd.ExecuteReader();
            rptTopUsers.DataSource = reader;
            rptTopUsers.DataBind();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BindTopScores();
        }
    }
=======
﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssignmentTool
{
    public partial class UserPerformance : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindTopScores();
            }
        }

        private void BindTopScores()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            string query = "exec TopThreeUser";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            rptTopUsers.DataSource = reader;
            rptTopUsers.DataBind();
            
        }
    }
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
}