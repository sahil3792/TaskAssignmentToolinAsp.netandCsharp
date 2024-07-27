<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminRejectedTask.aspx.cs" Inherits="TaskAssignmentTool.AdminRejectedTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="scripts/script.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Rejected Task</h1>
   <div class="container mt-4">
    <div class="table-responsive">
        <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="TaskGridView_RowCommand" DataKeyNames="UserID, BatchNo" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="ID" Visible="False" />
                <asp:BoundField DataField="BatchNo" HeaderText="Batch No" Visible="False" />
                <asp:BoundField DataField="UserName" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="FinishDate" HeaderText="Finish Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="AssignNewTaskButton" runat="server" CommandName="AssignNewTask" CommandArgument='<%# Container.DataItemIndex %>' Text="Assign New Task" CssClass="btn btn-primary btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>



    <!-- Modal -->
    <div class="modal fade" id="assignTaskModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Assign New Task</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:TextBox ID="txtTaskName" runat="server" CssClass="form-control" Placeholder="Enter Task Name" />
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control mt-2" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
