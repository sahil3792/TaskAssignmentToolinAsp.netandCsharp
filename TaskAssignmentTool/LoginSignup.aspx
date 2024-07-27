<<<<<<< HEAD
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginSignup.aspx.cs" Inherits="TaskAssignmentTool.LoginSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/app.js"></script>
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link href="Style/LoginSignup.css" rel="stylesheet" />
    <title></title>
    <script>
        // Ensure showSignin function executes as soon as the page loads
        window.onload = function () {
            showSignin();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="forms-container">
                    <div class="signin-signup">
                        <div class="form sign-in-form">
                            <h2 class="title">Sign in</h2>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn solid" OnClick="btnLogin_Click" />
                            <p class="social-text">Or Sign in with social platforms</p>
                            <div class="social-media">
                                <!-- Social media icons -->
                                <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
                            </div>
                        </div>
                        <div class="form sign-up-form">
                            <h2 class="title">Sign up</h2>
                            <div class="input-field">
                                <i class="fa fa-picture-o"></i>
                                <asp:FileUpload ID="FileUploadUserProfile" runat="server" style="align-items:center" />
                                
                            </div>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <asp:TextBox ID="txtNewUsername" runat="server" placeholder="Username"></asp:TextBox>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-envelope"></i>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            </div>
                            <div class="input-field">
    <i class="fas fa-users"></i>
                                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
</div>
                            <asp:Button ID="btnSignup" runat="server" Text="Sign up" CssClass="btn" OnClick="btnSignup_Click" />
                            <p class="social-text">Or Sign up with social platforms</p>
                            <div class="social-media">
                                <!-- Social media icons -->
                                <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panels-container">
                    <div class="panel left-panel">
                        <div class="content">
                            <h3>New here ?</h3>
                            <p>
                                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                     ex ratione. Aliquid!
                            </p>
                            <asp:Button ID="btnShowSignup" runat="server" Text="Sign up" CssClass="btn transparent" OnClientClick="showSignup(); return false;" />
                        </div>
                        <img src="img/log.svg" class="image" alt="" />
                    </div>
                    <div class="panel right-panel">
                        <div class="content">
                            <h3>One of us ?</h3>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                     laboriosam ad deleniti.
                            </p>
                            <asp:Button ID="btnShowSignin" runat="server" Text="Sign in" CssClass="btn transparent" OnClientClick="showSignin(); return false;" />
                        </div>
                        <img src="img/register.svg" class="image" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
=======
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginSignup.aspx.cs" Inherits="TaskAssignmentTool.LoginSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/app.js"></script>
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link href="Style/LoginSignup.css" rel="stylesheet" />
    <title></title>
    <script>
        // Ensure showSignin function executes as soon as the page loads
        window.onload = function () {
            showSignin();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="forms-container">
                    <div class="signin-signup">
                        <div class="form sign-in-form">
                            <h2 class="title">Sign in</h2>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn solid" OnClick="btnLogin_Click" />
                            <p class="social-text">Or Sign in with social platforms</p>
                            <div class="social-media">
                                <!-- Social media icons -->
                                <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
                            </div>
                        </div>
                        <div class="form sign-up-form">
                            <h2 class="title">Sign up</h2>
                            <div class="input-field">
                                <i class="fa fa-picture-o"></i>
                                <asp:FileUpload ID="FileUploadUserProfile" runat="server" style="align-items:center" />
                                
                            </div>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <asp:TextBox ID="txtNewUsername" runat="server" placeholder="Username"></asp:TextBox>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-envelope"></i>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            </div>
                            <div class="input-field">
    <i class="fas fa-users"></i>
                                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
</div>
                            <asp:Button ID="btnSignup" runat="server" Text="Sign up" CssClass="btn" OnClick="btnSignup_Click" />
                            <p class="social-text">Or Sign up with social platforms</p>
                            <div class="social-media">
                                <!-- Social media icons -->
                                <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panels-container">
                    <div class="panel left-panel">
                        <div class="content">
                            <h3>New here ?</h3>
                            <p>
                                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                     ex ratione. Aliquid!
                            </p>
                            <asp:Button ID="btnShowSignup" runat="server" Text="Sign up" CssClass="btn transparent" OnClientClick="showSignup(); return false;" />
                        </div>
                        <img src="img/log.svg" class="image" alt="" />
                    </div>
                    <div class="panel right-panel">
                        <div class="content">
                            <h3>One of us ?</h3>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                     laboriosam ad deleniti.
                            </p>
                            <asp:Button ID="btnShowSignin" runat="server" Text="Sign in" CssClass="btn transparent" OnClientClick="showSignin(); return false;" />
                        </div>
                        <img src="img/register.svg" class="image" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
>>>>>>> e4a109c2acd044ad26d79ca64c7fb402b2fc5836
