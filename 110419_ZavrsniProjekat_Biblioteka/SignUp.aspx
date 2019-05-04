﻿<%@ Page Title="Sign Up" Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="_110419_ZavrsniProjekat_Biblioteka.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom cascade style -->
    <link href="Content/CustomCS.css" rel="stylesheet" />
    <title><%: Page.Title %></title>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-sm navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="Default.aspx">Logo</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navb">
            <!-- Left nav menu -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Default.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="javascript:void(0)">Disabled</a>
                </li>
            </ul>
            <!-- Right nav menu -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Login.aspx">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="SignUp.aspx">Sign Up</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Jumbotron -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-4"><%: Title %></h1>
            <p><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder></p>            
        </div>
    </div>

    <!-- Sign Up Form -->
    <div class="container">
        <form id="form1" runat="server" class="width400">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="memId">Membership Card ID</asp:Label>
                <asp:TextBox ID="memId" runat="server" CssClass="form-control" placeholder="Enter Membership Card ID" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="memId" CssClass="text-danger font90" 
                    Display="Dynamic" ErrorMessage="Membership Card number is required." />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="username">Username</asp:Label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="username" CssClass="text-danger font90" 
                    Display="Dynamic" ErrorMessage="Username field is required." />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="psw">Password</asp:Label>
                <asp:TextBox ID="psw" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="psw" CssClass="text-danger font90" 
                    Display="Dynamic" ErrorMessage="Password field is required." />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="psw2">Confirm Password</asp:Label>
                <asp:TextBox ID="psw2" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="psw2" CssClass="text-danger font90" 
                    Display="Dynamic" ErrorMessage="Confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="psw" ControlToValidate="psw2" CssClass="text-danger font90" 
                    Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="email">Email</asp:Label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter Email"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="email" CssClass="text-danger font90" 
                    Display="Dynamic" ErrorMessage="Email field is required." />
            </div>
            <div class="form-group">
                <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary" Text="Sign Up" OnClick="btnSignUp_Click" />
            </div>
        </form>
    </div>

    <!-- Footer -->
    <footer class="container">
        <hr />
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy;<%: DateTime.Now.Year.ToString() %> TatKovace &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> </p>
    </footer>

	<script src="Scripts/jquery-3.0.0.slim.min.js"></script>
	<script src="Scripts/popper.min.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>
    <!-- Response.Write(DateTime.Now.Year.ToString()); -->

    <script type="text/javascript">

        $(document).ready(function () {

            $(document)[0].oncontextmenu = function () { return false; }

            $(document).mousedown(function (e) {
                if (e.button == 2) {
                    alert('Sorry, this functionality is disabled!');
                    return false;
                } else {
                    return true;
                }

            });
        });
    
    </script>

</body>
</html>
