<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPerformer.aspx.cs" Inherits="TaskAssignmentTool.AdminPerformer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .form-label {
            font-weight: bold;
        }
        .profile-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin: 0 auto;
            padding: 20px;
        }
        .user-profile {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            margin: 10px;
            width: 250px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .user-profile img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ddd;
            margin-bottom: 10px;
        }
        .user-profile h3 {
            margin: 10px 0;
            font-size: 1.2em;
            color: #333;
        }
        .user-profile h5 {
            margin: 5px 0;
            font-size: 1em;
            color: #777;
        }
        .user-profile:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-3">
                <asp:Label ID="lblFromDate" runat="server" Text="From Date:" AssociatedControlID="txtFromDate" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" Placeholder="YYYY-MM-DD" TextMode="DateTimeLocal"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lblToDate" runat="server" Text="To Date:" AssociatedControlID="txtToDate" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
            </div>
            <div class="col-md-3 align-self-end">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
    <h2>Top 3 Users This Week</h2>
    <div class="profile-container">
        <asp:Repeater ID="rptTopUsers" runat="server">
            <ItemTemplate>
                <div class="user-profile">
                    <img src='<%# Eval("ProfilePicture") %>' alt='<%# Eval("UserName") %>' class="img-thumbnail" />
                    <h3><%# Eval("UserName") %></h3>
                    <h5>Score: <%# Eval("TotalScore") %></h5>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-3">
                <asp:Label ID="lblWeekNo" runat="server" Text="Enter Week No:" AssociatedControlID="txtWeekNo" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtWeekNo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3 align-self-end">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
