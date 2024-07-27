<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserReTask.aspx.cs" Inherits="TaskAssignmentTool.UserReTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

      <div class="container mt-4">
        <h2>Rejected Tasks</h2>
        <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnRowCommand="TaskGridView_RowCommand">
            <Columns>
                <asp:BoundField DataField="TaskName" HeaderText="Task Name" />
                <asp:BoundField DataField="TaskStatus" HeaderText="Task Status" />
                <asp:BoundField DataField="Reason" HeaderText="Reason" />
                <asp:TemplateField HeaderText="Resolution">
                    <ItemTemplate>
                        <asp:Button ID="btnUploadSolution" runat="server" CommandName="UploadSolution" CommandArgument='<%# Eval("TaskStudentID") %>' Text="Upload Solution" CssClass="btn btn-primary btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadModalLabel">Upload Solution</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:FileUpload ID="fileUploadSolution" runat="server" CssClass="form-control" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnUploadSolution" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="btnUploadSolution_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

     <script type="text/javascript">
         function showUploadModal() {
             $('#uploadModal').modal('show');
         }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserReTask.aspx.cs" Inherits="TaskAssignmentTool.UserReTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

      <div class="container mt-4">
        <h2>Rejected Tasks</h2>
        <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnRowCommand="TaskGridView_RowCommand">
            <Columns>
                <asp:BoundField DataField="TaskName" HeaderText="Task Name" />
                <asp:BoundField DataField="TaskStatus" HeaderText="Task Status" />
                <asp:BoundField DataField="Reason" HeaderText="Reason" />
                <asp:TemplateField HeaderText="Resolution">
                    <ItemTemplate>
                        <asp:Button ID="btnUploadSolution" runat="server" CommandName="UploadSolution" CommandArgument='<%# Eval("TaskStudentID") %>' Text="Upload Solution" CssClass="btn btn-primary btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="uploadModalLabel">Upload Solution</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:FileUpload ID="fileUploadSolution" runat="server" CssClass="form-control" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnUploadSolution" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="btnUploadSolution_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

     <script type="text/javascript">
         function showUploadModal() {
             $('#uploadModal').modal('show');
         }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
