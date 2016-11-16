<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landingpage.aspx.cs" Inherits="Demo.Landingpage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contacts Database | Landing page</title>
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
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
            <asp:ScriptManager ID="sm1" runat="server" CompositeScript-ScriptMode="Release">
            </asp:ScriptManager>

            <div class="wrapper">
                <header class="main-header">
                    <div class="col-xs-12 text-center">
                        <h1>Contacts Database</h1>
                    </div>
                </header>
                <div class="clearfix">
                </div>
                <div class="content-wrapper">
                    <div class="row" style="margin-bottom: 1%; margin-top: 1%">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <telerik:RadGrid ID="gridview" runat="server" AutoGenerateColumns="False" GridLines="None"
                                CellSpacing="0" CommandItemStyle-HorizontalAlign="Left" CommandItemStyle-Height="50px"
                                Width="100%" BorderStyle="None" AllowPaging="True" AllowSorting="True" PageSize="20"
                                Font-Names="Calibri" BorderColor="Black" AllowCustomPaging="true" OnItemCreated="gridview_ItemCreated" OnItemCommand="gridview_ItemCommand"
                                OnNeedDataSource="gridview_NeedDataSource" Skin="Metro" OnSortCommand="gridview_SortCommand"
                                AllowFilteringByColumn="true" OnPreRender="gridview_PreRender">
                                <HeaderStyle BorderStyle="None" BackColor="#ee742c" Font-Overline="False" Font-Underline="False"
                                    ForeColor="white" Wrap="True" Font-Strikeout="False" Height="25px" />
                                <FilterMenu EnableImageSprites="False">
                                </FilterMenu>
                                <FilterItemStyle CssClass="mytable" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Right" Mode="NextPrevNumericAndAdvanced"
                                    PageButtonCount="5" PagerTextFormat="" PageSizeLabelText="View per page:" Position="Bottom" />
                                <ExportSettings IgnorePaging="false" ExportOnlyData="true" OpenInNewWindow="true">
                                    <Excel AutoFitImages="true" FileExtension="xls" />
                                </ExportSettings>
                                <ItemStyle BackColor="White" />
                                <CommandItemStyle HorizontalAlign="Left"></CommandItemStyle>
                                <GroupingSettings CaseSensitive="false" />
                                <MasterTableView ShowHeader="true" DataKeyNames="Id" EnableHeaderContextMenu="true" CommandItemDisplay="Top" 
                                    AllowMultiColumnSorting="false" AllowNaturalSort="false" AllowFilteringByColumn="true" AllowCustomPaging="true">

                                    <CommandItemTemplate>
                                         <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <p class="login button text-left">
                                                        <a href="#">
                                                             <asp:Button ID="btn_addnew" Class="btn btn-primary antosubmit" Text="Add New" Width="150px" CommandName="InitInsert"
                                                                runat="server" />
                                                        </a>
                                                    </p>
                                              
                                          
                                    </div>
                                                         <div class="col-md-6 col-sm-6 col-xs-6">
                                        <p class="login button text-right">
                                                        <a href="#">
                                                            <asp:Button ID="Button1" Class="btn btn-primary antosubmit" Text="Export To Excel" Width="150px" CommandName="ExportToExcel"
                                                                runat="server" />
                                                        </a>
                                                    </p>
                                    </div>

                                </div>
                                        <%--<table border="0" width="100%">
                                            <tr>
                                                <td align="right" width="100%">
                                                    <p class="login button text-right">
                                                        <a href="#">
                                                            <asp:Button ID="btn_export" Class="btn btn-primary antosubmit" Text="Export To Excel" Width="150px" CommandName="ExportToExcel"
                                                                runat="server" />
                                                        </a>
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>--%>
                                    </CommandItemTemplate>
                                    <CommandItemSettings></CommandItemSettings>
                                    <RowIndicatorColumn Visible="false" FilterControlAltText="Filter RowIndicator column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Visible="false" FilterControlAltText="Filter ExpandColumn column">
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column" Visible="false">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <SortExpressions>
                                        <telerik:GridSortExpression FieldName="Name" SortOrder="Ascending" />
                                    </SortExpressions>
                                    <Columns>
                                         <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn"  EditImageUrl="Images/image044.png">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemStyle Width="20px"></ItemStyle>
                                           
                                </telerik:GridEditCommandColumn>
                                        <telerik:GridTemplateColumn SortExpression="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="200px"
                                            CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="true" DataField="Name"
                                            FilterControlToolTip="Filter" FilterControlWidth="150px" ShowFilterIcon="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'> 
                             
                                                </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn SortExpression="Address" HeaderText="Address" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="200px"
                                            CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="true" DataField="Address"
                                            FilterControlToolTip="Filter" FilterControlWidth="150px" ShowFilterIcon="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address")%>'> 
                             
                                                </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn SortExpression="Designation" HeaderText="Designation" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="200px"
                                            CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="true" DataField="Designation"
                                            FilterControlToolTip="Filter" FilterControlWidth="150px" ShowFilterIcon="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("Designation")%>'> 
                             
                                                </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="delete" ItemStyle-Width="15px" AllowFiltering="false">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btndelete" CommandName="Delete" runat="server" ImageUrl="~/images/image043.png" CommandArgument="True" ImageAlign="Left" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                    <EditFormSettings EditFormType="Template">
                                <FormTemplate>
                                    <div class="form-horizontal form-label-left form-consignees container-fluid" style="margin-top: 2%;">
                                        <div class="form-group col-sm-12">
                                            <label for="inputSkills" class="col-sm-2 control-label">
                                                Name: <span style="color: #993300; font-size: 16px; font-weight: bolder;">*</span></label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txt_Name" runat="server" Text='<%# Bind("Name") %>'
                                                    Visible="true" CssClass="form-control"></asp:TextBox>
                                                <asp:HiddenField ID="hdId" runat="server" Value='<%# Bind("Id") %>'
                                                    Visible="false" />
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-12">
                                            <label for="inputSkills" class="col-sm-2 control-label">
                                                Address: <span style="color: #993300; font-size: 16px; font-weight: bolder;">*</span></label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txt_address" runat="server" Text='<%# Bind("Address") %>'
                                                    Visible="true" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group col-sm-12">
                                            <label for="inputSkills" class="col-sm-2 control-label">
                                                Designation: <span style="color: #993300; font-size: 16px; font-weight: bolder;">*</span></label>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txt_Designation" runat="server" Text='<%# Bind("Designation") %>'
                                                    Visible="true" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-12">
                                            <div class="pull-right" style="margin-right: 20px;">
                                                <label>
                                                </label>
                                               <p class="login button text-right">
                                                        <a href="#">
                                                            <asp:Button ID="btnSave" Class="btn btn-primary antosubmit" Width="150px" Text='<%# (Container is GridEditFormInsertItem) ? "Save" : "Update" %>' CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                                                runat="server" />
                                                        </a>
                                                   <a href="#">
                                                            <asp:Button ID="btncancel" Class="btn btn-primary antosubmit" Width="150px" Text="Cancel" CommandName="Cancel"
                                                                runat="server" />
                                                        </a>
                                                    </p>
                                               
                                            </ul>
                                            </div>
                                        </div>
                                    </div>
                                </FormTemplate>
                            </EditFormSettings>
                                    <PagerStyle AlwaysVisible="True" Width="100%"></PagerStyle>
                                </MasterTableView>
                            </telerik:RadGrid>
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
    </form>
</body>
</html>
