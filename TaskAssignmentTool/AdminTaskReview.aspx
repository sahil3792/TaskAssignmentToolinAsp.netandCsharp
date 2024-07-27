<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminTaskReview.aspx.cs" Inherits="TaskAssignmentTool.AdminTaskReview" EnableViewState="true" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminTaskReview.aspx.cs" Inherits="TaskAssignmentTool.AdminTaskReview" EnableViewState="true" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</asp:Content>
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <h1>Task Review</h1>
    <div class="container mt-4">
    <div class="table-responsive">
        <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="TaskGridView_RowCommand" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="Name" />
                <asp:TemplateField HeaderText="Attachment Submitted">
                    <ItemTemplate>
                        <a href='<%# Eval("AttachmentPath") %>' target="_blank" class="btn btn-info btn-sm">Download</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TaskName" HeaderText="Task Name" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="FinishDate" HeaderText="Finish Date" DataFormatString="{0:MM/dd/yyyy HH:mm:ss}" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="ApproveButton" runat="server" CommandName="Approve" CommandArgument='<%# Eval("TaskStudentID") %>' Text="Approve" CssClass="btn btn-success btn-sm" />
                        <asp:Button ID="RejectButton" runat="server" CommandName="Reject" CommandArgument='<%# Eval("TaskStudentID") %>' Text="Reject" CssClass="btn btn-danger btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>

    <!-- Reject Modal -->
<div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rejectModalLabel">Reject Task</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <asp:TextBox ID="txtRejectReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Enter reason for rejection"></asp:TextBox>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnSubmitReject" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmitReject_Click" />
            </div>
        </div>
    </div>
</div>

    <asp:HiddenField ID="hfTaskStudentID" runat="server" />

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function showRejectModal() {
            $('#rejectModal').modal('show');
        }
</script>
<<<<<<< HEAD
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
=======
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
