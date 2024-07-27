<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserPerformance.aspx.cs" Inherits="TaskAssignmentTool.UserPerformance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Container to display the profile cards in a row */
        .profile-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap; /* Allows cards to wrap to the next line on smaller screens */
            margin: 0 auto; /* Center the container */
            padding: 20px; /* Add padding around the container */
        }

        /* Individual profile card styling */
        .user-profile {
            background-color: #f9f9f9; /* Light background color */
            border: 1px solid #ddd; /* Light border */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for 3D effect */
            text-align: center; /* Center align text */
            padding: 20px; /* Padding inside the card */
            margin: 10px; /* Margin between cards */
            width: 250px; /* Fixed width for profile cards */
            transition: transform 0.3s, box-shadow 0.3s; /* Smooth transition effects */
        }

            /* Profile photo styling */
            .user-profile img {
                width: 120px; /* Fixed width for the photo */
                height: 120px; /* Fixed height for the photo */
                border-radius: 50%; /* Circular photo */
                object-fit: cover; /* Ensures photo fits within the circle */
                border: 2px solid #ddd; /* Border around the photo */
                margin-bottom: 10px; /* Space between photo and name */
            }

            /* User name styling */
            .user-profile h3 {
                margin: 10px 0; /* Margin above and below the name */
                font-size: 1.2em; /* Font size for the name */
                color: #333; /* Dark text color */
            }

            /* User score styling */
            .user-profile h5 {
                margin: 5px 0; /* Margin above and below the score */
                font-size: 1em; /* Font size for the score */
                color: #777; /* Lighter text color */
            }

            /* Add hover effect for profile cards */
            .user-profile:hover {
                transform: scale(1.05); /* Slightly enlarge the card */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Increase shadow on hover */
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h2>Top 3 Users This Week</h2>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>
            </div>
            <div class="col-md-2">
                <asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn btn-primary" OnClick="Button1_Click"  />
            </div>
        </div>


    </div>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserPerformance.aspx.cs" Inherits="TaskAssignmentTool.UserPerformance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
    /* Container to display the profile cards in a row */
    .profile-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap; /* Allows cards to wrap to the next line on smaller screens */
        margin: 0 auto; /* Center the container */
        padding: 20px; /* Add padding around the container */
    }

    /* Individual profile card styling */
    .user-profile {
        background-color: #f9f9f9; /* Light background color */
        border: 1px solid #ddd; /* Light border */
        border-radius: 15px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for 3D effect */
        text-align: center; /* Center align text */
        padding: 20px; /* Padding inside the card */
        margin: 10px; /* Margin between cards */
        width: 250px; /* Fixed width for profile cards */
        transition: transform 0.3s, box-shadow 0.3s; /* Smooth transition effects */
    }

    /* Profile photo styling */
    .user-profile img {
        width: 120px; /* Fixed width for the photo */
        height: 120px; /* Fixed height for the photo */
        border-radius: 50%; /* Circular photo */
        object-fit: cover; /* Ensures photo fits within the circle */
        border: 2px solid #ddd; /* Border around the photo */
        margin-bottom: 10px; /* Space between photo and name */
    }

    /* User name styling */
    .user-profile h3 {
        margin: 10px 0; /* Margin above and below the name */
        font-size: 1.2em; /* Font size for the name */
        color: #333; /* Dark text color */
    }

    /* User score styling */
    .user-profile h5 {
        margin: 5px 0; /* Margin above and below the score */
        font-size: 1em; /* Font size for the score */
        color: #777; /* Lighter text color */
    }

    /* Add hover effect for profile cards */
    .user-profile:hover {
        transform: scale(1.05); /* Slightly enlarge the card */
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Increase shadow on hover */
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h2>Top 3 Users This Week</h2>
    <asp:Repeater ID="rptTopUsers" runat="server">
        <ItemTemplate>
            <div  class="profile-container">
            <div class="user-profile">
                <img src='<%# Eval("ProfilePicture") %>' alt='<%# Eval("UserName") %>' class="img-thumbnail" />
                <h3><%# Eval("UserName") %></h3>
                <h5>Score: <%# Eval("TotalScore") %></h5>
            </div>
                </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
