<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserHistory.aspx.cs" Inherits="TaskAssignmentTool.UserHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>History</h1>
    <div class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label for="ddlTimePeriod" class="form-label">Select Time Period</label>
                <asp:DropDownList ID="ddlTimePeriod" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Daily" Value="Daily"></asp:ListItem>
                    <asp:ListItem Text="Weekly" Value="Weekly"></asp:ListItem>
                    <asp:ListItem Text="Monthly" Value="Monthly"></asp:ListItem>
                    <asp:ListItem Text="Yearly" Value="Yearly"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mt-4" OnClick="btnSearch_Click" />
        </div>
    </div>
</div>

    <div class="container mt-4">
    <div class="table-responsive">
        <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="TaskName" HeaderText="Task Name" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:BoundField DataField="SubmissionDate" HeaderText="Assign Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="FinishDate" HeaderText="Finish Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Score" HeaderText="Score" />
            </Columns>
        </asp:GridView>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserHistory.aspx.cs" Inherits="TaskAssignmentTool.UserHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>History</h1>
    <div class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label for="ddlTimePeriod" class="form-label">Select Time Period</label>
                <asp:DropDownList ID="ddlTimePeriod" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Daily" Value="Daily"></asp:ListItem>
                    <asp:ListItem Text="Weekly" Value="Weekly"></asp:ListItem>
                    <asp:ListItem Text="Monthly" Value="Monthly"></asp:ListItem>
                    <asp:ListItem Text="Yearly" Value="Yearly"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mt-4" OnClick="btnSearch_Click" />
        </div>
    </div>
</div>

    <div class="container mt-4">
    <div class="table-responsive">
        <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="TaskName" HeaderText="Task Name" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:BoundField DataField="SubmissionDate" HeaderText="Assign Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="FinishDate" HeaderText="Finish Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Score" HeaderText="Score" />
            </Columns>
        </asp:GridView>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
