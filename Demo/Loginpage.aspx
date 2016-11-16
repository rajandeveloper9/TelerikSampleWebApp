<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="Demo.Loginpage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contacts Database | Login</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <meta http-equiv="Cache-control" content="no-cache" />
    <meta http-equiv="Cache-control" content="no-store" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="css/reset.css" type="text/css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="css/style-sheet.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/md5.js"></script>
    <telerik:RadCodeBlock runat="server" ID="rcb">
        <script type="text/javascript">
            function login_OnClientClick() {
                var txt_login = document.getElementById('<%= txt_login.ClientID %>');
                var txt_password = document.getElementById('<%= txt_password.ClientID %>');
                var lblInformation = document.getElementById('<%= lblInformation.ClientID %>')
                var Rw_alert = $find("<%=Rw_alert.ClientID %>");
                var count = 0;
                if (txt_login.value.trim() == "") {
                    lblInformation.innerHTML = "Please enter login";
                    count = 1;
                }
                else if (txt_password.value.trim() == "") {
                    lblInformation.innerHTML = "Please enter password";
                    count = 1;
                }
                if (count == 1) {
                    Rw_alert.show();
                    return false;
                }
                else {
                    var pas, simve, tsh;
                    pas = txt_password.value;
                    var stsh = pas;
                    tsh = hex_md5(stsh);
                    txt_password.value = tsh;
                    return true;
                }
            }
            function closeRw_alert() {
                var Rw_alert = $find("<%=Rw_alert.ClientID %>");
                  Rw_alert.close();
                  Rw_alert.set_visibleOnPageLoad(false);
                  return false;
              }

        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btn_login" defaultfocus="btn_login">


        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" Skin="Default"
            EnableSkinTransparency="false" EnableEmbeddedSkins="true" Transparency="30" BackColor="lightgray">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2"
            RenderMode="Block" EnablePageHeadUpdate="true" EnableAriaSupport="false" Height="800px" Width="100%">
            <telerik:RadCodeBlock runat="server">
                <asp:ScriptManager ID="sm1" runat="server" CompositeScript-ScriptMode="Release">
                </asp:ScriptManager>
                <telerik:RadWindow ID="Rw_alert" runat="server" EnableShadow="false" Modal="true" EnableViewState="false"
                    Height="200px" EnableTheming="true" VisibleStatusbar="false" Behaviors="Move" VisibleTitlebar="true"
                    Width="400px">
                    <ContentTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" style="height: 85%" width="100%">
                            <tr style="height: 12%; font-size: 13px">
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" style="padding-left: 10px; padding-top: 10px">
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/IconInfo.png" />
                                                &nbsp;
                                            </td>
                                            <td align="right" style="padding-right: 3px; padding-top: 4px" valign="top">
                                                <telerik:RadButton ID="btn_close" runat="server" Height="12px" Image-ImageUrl="~/images/IconClosePopUp.png"
                                                    OnClientClicked="closeRw_alert" Width="12px" CausesValidation="false">
                                                </telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: 32px; font-size: 13px">
                                <td align="center" valign="top">
                                    <asp:Label ID="lblInformation" runat="server" Text="Label" Font-Size="Small" Font-Bold="false"
                                        CssClass="spancss">Invalid Login & Password</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 42%" valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td align="center" style="padding-right: 14px; width: 50%">
                                                <p class="login button text-center">
                                                    <a href="#">
                                                        <asp:Button ID="btn_ok" Class="btn btn-primary antosubmit" Text="Ok" OnClientClick="return closeRw_alert();"
                                                            runat="server" />
                                                    </a>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </telerik:RadWindow>
                <div class="wrapper">
                    <header class="main-header">
                        <div class="col-xs-12 text-center">
                            <h1>Contacts Database</h1>
                        </div>
                    </header>
                    <div class="clearfix">
                    </div>
                    <div class="content-wrapper">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin-top: 1%; margin-bottom: 1%">
                                    <asp:Image ID="Img" runat="server" CssClass="img-responsive"
                                        ImageUrl="~/images/Img.png" />
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="separator">
                                    </div>
                                    <h1 class="ribbon">
                                        <strong class="ribbon-content">Please Login</strong>
                                    </h1>
                                    <div class="animate form" id="login">
                                        <form autocomplete="on" action="#">
                                            <div class="form-group" style="margin-top: 30%">
                                                <div class="input-group">
                                                    <span class="input-group-addon glyphicon glyphicon-user" id="basic-addon1"></span>
                                                    <asp:TextBox ID="txt_login" CssClass="form-control"
                                                        runat="server" aria-describedby="basic-addon1" autocomplete="off"></asp:TextBox>
                                                    <span class="devtoAsterix">*</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon glyphicon glyphicon-wrench" id="basic-addon1"></span>
                                                    <asp:TextBox ID="txt_password" CssClass="form-control" TextMode="Password" Text="Password"
                                                        autocomplete="off" runat="server" aria-describedby="basic-addon1"></asp:TextBox>
                                                    <span class="devtoAsterix">*</span>
                                                </div>
                                            </div>
                                            <p class="keeplogin">
                                                <asp:CheckBox ID="chkRememberMe" runat="server" />
                                                <label for="loginkeeping">
                                                    Remember me</label>
                                            </p>
                                            <p class="change_link">
                                                <asp:LinkButton runat="server" ID="hyperlink1" CssClass="to_forgot not-active " Text="Forgot Password?"
                                                    target="" />
                                            </p>
                                            <p class="login button text-center">
                                                <a href="#">
                                                    <asp:Button ID="btn_login" Class="btn btn-primary antosubmit" Text="Login" OnClick="btn_login_Click" OnClientClick="return login_OnClientClick();"
                                                        runat="server" />
                                                </a>
                                            </p>
                                        </form>
                                    </div>
                                    <div class="itsupport-content">
                                        <p>
                                            This application is for authorized users only. If you face any difficulty
                                in accessing the application, contact support at:
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer class="main-footer">
                        <div class="col-xs-12 text-center">
                            <p>Copyright © 2016</p>
                        </div>
                    </footer>
                    <div class=" col-xs-12 text-right">
                        <p style="color: #808080">
                            Developed by Ankur
                        </p>
                    </div>
                </div>
            </telerik:RadCodeBlock>
        </telerik:RadAjaxPanel>
    </form>
</body>
</html>
