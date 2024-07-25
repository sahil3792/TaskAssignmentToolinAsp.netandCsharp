using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssignmentTool
{
    public partial class LoginSignup : System.Web.UI.Page
    {
        static SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindBatchNames();
            }
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        private void BindBatchNames()
        {
            string cs = ConfigurationManager.ConnectionStrings["Dbconn"].ConnectionString;
            SqlConnection conn = new SqlConnection(cs);
            string query = "exec showbatches";
            SqlCommand cmd = new SqlCommand(query,conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList1.DataSource = reader;
            DropDownList1.DataTextField = "BatchName";
            DropDownList1.DataValueField = "BatchNo";
            DropDownList1.DataBind();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text, password = txtPassword.Text,urole="User";
            string query = $"exec AuthenticateUser '{username}','{password}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    if(username.Equals(reader["Username"]) && password.Equals(reader["Password"]) )
                    {
                        if (urole.Equals(reader["UserRole"]))
                        {
                            Session["UserID"] = reader["UserID"];
                            Response.Redirect("UserHome.aspx");
                        }
                        else
                        {
                            Session["UserID"] = reader["UserID"];
                            Response.Redirect("AdminHome.aspx");
                        }
                    }
                }
            }

        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string username = txtNewUsername.Text, email = txtEmail.Text, password = txtNewPassword.Text, UserRole = "User";
            FileUploadUserProfile.SaveAs(Server.MapPath("Attachment")+Path.GetFileName(FileUploadUserProfile.FileName));
            string Image_path = "Attachment/" + Path.GetFileName(FileUploadUserProfile.FileName);
            int batchno = int.Parse(DropDownList1.SelectedValue);

            string query = $"exec AddUser '{username}','{email}','{password}','{UserRole}','{Image_path}','{batchno}'";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();



        }
    }
}