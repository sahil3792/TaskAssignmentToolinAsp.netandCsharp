<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserMyTask.aspx.cs" Inherits="TaskAssignmentTool.UserMyTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>My Task</h1>
    <asp:HiddenField ID="TaskStudentIDHiddenField" runat="server" />
   <div class="container mt-4">
    <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="TaskGridView_RowCommand" CssClass="table table-striped table-bordered">
        <Columns>
            <asp:BoundField DataField="TaskName" HeaderText="Task Name" />
            <asp:BoundField DataField="AssignedDate" HeaderText="Assigned Date" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:TemplateField HeaderText="Download">
                <ItemTemplate>
                    <asp:Button ID="DownloadButton" runat="server" CommandName="Download" CommandArgument='<%# Eval("AttachmentPath") %>' Text="Download" CssClass="btn btn-info btn-sm" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Solution">
                <ItemTemplate>
                    <asp:Button ID="SolutionButton" runat="server" CommandName="Solution" CommandArgument='<%# Eval("TaskStudentID") %>' Text="Submit Solution" CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Label ID="ActionLabel" runat="server" CssClass="text-muted" Text='<%# GetActionText(Convert.ToDateTime(Eval("SubmissionDate"))) %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <!-- Optional: Include Bootstrap CSS (if not already included) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</div>

    <!-- Solution Modal -->
    <div class="modal fade" id="SolutionModal" tabindex="-1" role="dialog" aria-labelledby="SolutionModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="SolutionModalLabel">Upload Solution</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:FileUpload ID="SolutionFileUpload" runat="server" CssClass="form-control" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="UploadSolutionButton" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="UploadSolutionButton_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
