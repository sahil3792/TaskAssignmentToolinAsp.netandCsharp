<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAssignTask.aspx.cs" Inherits="TaskAssignmentTool.AdminAssignTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Assign Task</h1>

    <div class="form-group">
        <label for="exampleFormControlInput1">Task Name </label>
        <asp:TextBox ID="TxtTaskName" runat="server" class="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect1">Attachments</label>
        <asp:FileUpload ID="FileUploadTaskDocument" runat="server" class="form-control" />
       
        
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect2">Select Batch</label>
        <asp:DropDownList ID="DisplayBatchList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DisplayBatchList_SelectedIndexChanged" class="form-control">
        </asp:DropDownList>

    </div>
    <div class="form-group">
        <label for="exampleFormControlTextarea1">select student</label>
        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text="Select All" AutoPostBack="true" OnCheckedChanged="SelectAllCheckBox_CheckedChanged" />
        <asp:CheckBoxList ID="DisplayStudentsList" runat="server" class="form-control">
        </asp:CheckBoxList>

    </div>
    <div class="form-group">
        <asp:Button ID="AddTask" runat="server" Text="Button" OnClick="AddTask_Click" />

    </div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAssignTask.aspx.cs" Inherits="TaskAssignmentTool.AdminAssignTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Assign Task</h1>

    <div class="form-group">
        <label for="exampleFormControlInput1">Task Name </label>
        <asp:TextBox ID="TxtTaskName" runat="server" class="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect1">Attachments</label>
        <asp:FileUpload ID="FileUploadTaskDocument" runat="server" class="form-control" />
       
        
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect2">Select Batch</label>
        <asp:DropDownList ID="DisplayBatchList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DisplayBatchList_SelectedIndexChanged" class="form-control">
        </asp:DropDownList>

    </div>
    <div class="form-group">
        <label for="exampleFormControlTextarea1">select student</label>
        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text="Select All" AutoPostBack="true" OnCheckedChanged="SelectAllCheckBox_CheckedChanged" />
        <asp:CheckBoxList ID="DisplayStudentsList" runat="server" class="form-control">
        </asp:CheckBoxList>

    </div>
    <div class="form-group">
        <asp:Button ID="AddTask" runat="server" Text="Button" OnClick="AddTask_Click" />

    </div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
