<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAssignScore.aspx.cs" Inherits="TaskAssignmentTool.AdminAssignScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Assign Score</h1>
    <div class="container mt-4">
    <div class="table-responsive">
        <asp:GridView ID="TaskGridView" runat="server" AutoGenerateColumns="False" OnRowDataBound="TaskGridView_RowDataBound" OnRowCommand="TaskGridView_RowCommand" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="FinishDate" HeaderText="Finish Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Score">
                    <ItemTemplate>
                        <div class="input-group">
                            <asp:TextBox ID="txtScore" runat="server" CssClass="form-control" Text='<%# Eval("Score") %>' />
                            <div class="input-group-append">
                                <asp:Button ID="btnSubmitScore" runat="server" Text="Submit" CommandName="SubmitScore" CommandArgument='<%# Eval("TaskStudentID") %>' CssClass="btn btn-primary" />
                            </div>
                        </div>
                        <asp:HiddenField ID="hfTaskStudentID" runat="server" Value='<%# Eval("TaskStudentID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
