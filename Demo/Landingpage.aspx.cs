# region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Data.SqlClient;
# endregion

namespace Demo
{
    public partial class Landingpage : System.Web.UI.Page
    {

        bool isexcelExport = false;
        # region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["UserName"] == null)
                    {
                        //Response.Redirect("Loginpage.aspx", false);
                    }
                    else
                    {
                    }

                }
            }
            catch (Exception ex)
            {
            }
        }
        # endregion

        # region Events
        protected void gridview_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Session["dt"] != null)
            {
                DataTable dt = (DataTable)Session["dt"];
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("Id");
                dt1.Columns.Add("Name");
                dt1.Columns.Add("Address");
                dt1.Columns.Add("Designation");
                if (Session["Name"] != null && Session["Address"] != null && Session["Designation"] != null)
                {
                    int _id = 0;
                    int.TryParse(Convert.ToString(Session["Id"]), out _id);
                    if (_id == 0)
                        dt1.Rows.Add(new object[] { (dt.Rows.Count + 1).ToString(), Session["Name"].ToString(), Session["Address"].ToString(), Session["Designation"].ToString() });
                    else
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            if (dr["Id"].ToString() == _id.ToString())
                            {
                                dr["Name"] = Convert.ToString(Session["Name"]);
                                dr["Address"] = Convert.ToString(Session["Address"]);
                                dr["Designation"] = Convert.ToString(Session["Designation"]);
                            }
                        }
                    }
                }

                dt.Merge(dt1);
                gridview.DataSource = dt;
                Session["dt"] = dt;
                Session["Name"] = null;
                Session["Address"] = null;
                Session["Designation"] = null;
                Session["Id"] = null;
            }
            else
            {
                Bind_Grid();
            }
        }
        protected void gridview_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
        {

            GridSortExpression sortExpr = new GridSortExpression();
            switch (e.OldSortOrder)
            {
                case GridSortOrder.None:
                    sortExpr.FieldName = e.SortExpression;
                    sortExpr.SortOrder = GridSortOrder.Descending;

                    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
                    break;
                case GridSortOrder.Ascending:
                    sortExpr.FieldName = e.SortExpression;
                    sortExpr.SortOrder = gridview.MasterTableView.AllowNaturalSort ? GridSortOrder.None : GridSortOrder.Descending;
                    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
                    break;
                case GridSortOrder.Descending:
                    sortExpr.FieldName = e.SortExpression;
                    sortExpr.SortOrder = GridSortOrder.Ascending;

                    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
                    break;
            }

            e.Canceled = true;
            gridview.Rebind();


        }
        protected void gridview_PreRender(object sender, EventArgs e)
        {
            gridview.MasterTableView.AllowPaging = false;
            gridview.Rebind();
            gridview.VirtualItemCount = gridview.MasterTableView.Items.Count;
            gridview.MasterTableView.AllowPaging = true;
            gridview.Rebind();
        }
        protected void gridview_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.UpdateCommandName
             || e.CommandName == RadGrid.PerformInsertCommandName)
            {

                GridEditFormItem insertedItem = (GridEditFormItem)e.Item;
                HiddenField hdId = (HiddenField)insertedItem.FindControl("hdId");
                TextBox txt_Name = (TextBox)insertedItem.FindControl("txt_Name");
                TextBox txt_address = (TextBox)insertedItem.FindControl("txt_address");
                TextBox txt_Designation = (TextBox)insertedItem.FindControl("txt_Designation");
                if (e.CommandName == RadGrid.PerformInsertCommandName)
                    ViewState["Id"] = "0";
                else
                    ViewState["Id"] = hdId.Value;
                Session["Id"] = ViewState["Id"];
                Session["Name"] = txt_Name.Text.Trim();
                Session["Address"] = txt_address.Text.Trim();
                Session["Designation"] = txt_Designation.Text.Trim();
                gridview.Rebind();
            }
            if (e.CommandName == "ExportToExcel")
            {

                isexcelExport = true;
                gridview.ExportSettings.FileName = "User_data" + "_" + DateTime.Now.ToString("dd/MM/yyyy");
            }
            if (e.CommandName == RadGrid.DeleteCommandName)
            {
                string _id = (e.Item as GridDataItem).GetDataKeyValue("Id").ToString();
                DataTable dt = (DataTable)Session["dt"];
                if (dt != null)
                {
                    int index = -1;
                    foreach (DataRow dr in dt.Rows)
                    {
                        index++;
                        if (dr["Id"].ToString() == _id)
                        {
                            break;
                        }
                    }
                    dt.Rows.RemoveAt(index);
                    Session["dt"] = dt;
                }

            }

        }
        protected void gridview_ItemCreated(object source, GridItemEventArgs e)
        {
            if (isexcelExport)
            {
                if (e.Item is GridHeaderItem)
                {
                    e.Item.Style["text-align"] = "left";
                    e.Item.ForeColor = System.Drawing.Color.Black;
                    e.Item.Font.Name = "Calibri";
                    e.Item.Height = Unit.Pixel(25);
                    e.Item.HorizontalAlign = HorizontalAlign.Left;
                    e.Item.VerticalAlign = VerticalAlign.Top;
                    e.Item.Cells[0].Visible = false;
                    e.Item.Cells[1].Width = Unit.Pixel(300);
                    e.Item.BackColor = System.Drawing.Color.FromArgb(156, 198, 240);
                    e.Item.BorderColor = System.Drawing.Color.FromArgb(226, 226, 226);
                    e.Item.BorderWidth = Unit.Pixel(1);

                }
                if (e.Item.ItemType == GridItemType.AlternatingItem || e.Item.ItemType == GridItemType.Item)
                {
                    e.Item.Style["text-align"] = "left";
                    if (e.Item.ItemType == GridItemType.AlternatingItem)
                    {
                        e.Item.BackColor = System.Drawing.Color.FromArgb(229, 237, 251);
                        e.Item.BorderColor = System.Drawing.Color.FromArgb(226, 226, 226);
                        e.Item.ForeColor = System.Drawing.Color.Black;
                    }
                    else
                    {
                        e.Item.ForeColor = System.Drawing.Color.Black;
                    }
                    e.Item.Cells[1].Width = Unit.Pixel(500);
                    e.Item.Cells[0].Visible = false;
                    e.Item.Font.Name = "Calibri";
                    e.Item.ForeColor = System.Drawing.Color.Black;
                    e.Item.Height = Unit.Pixel(25);
                    e.Item.HorizontalAlign = HorizontalAlign.Left;
                    e.Item.VerticalAlign = VerticalAlign.Middle;
                    e.Item.Width = Unit.Pixel(200);
                    e.Item.BorderColor = System.Drawing.Color.FromArgb(226, 226, 226);
                    e.Item.BorderStyle = BorderStyle.Solid;
                    e.Item.BorderWidth = Unit.Pixel(1);
                    e.Item.OwnerTableView.Columns[0].Visible = false;
                    e.Item.OwnerTableView.Columns[2].Visible = false;
                    e.Item.OwnerTableView.Columns[1].Visible = true;
                }
                if (e.Item is GridFilteringItem)
                {
                    e.Item.Visible = false;
                }
            }

            if (e.Item is GridPagerItem)
            {
                var dropDown = (RadComboBox)e.Item.FindControl("PageSizeComboBox");
                var totalCount = ((GridPagerItem)e.Item).Paging.DataSourceCount;
                var sizes = new Dictionary<string, string>() {
            {"10", "10"},
            {"20", "20"},
            {"50", "50"}
        };

                sizes.Add("All", totalCount.ToString());
                dropDown.Items.Clear();
                foreach (var size in sizes)
                {
                    var cboItem = new RadComboBoxItem() { Text = size.Key, Value = size.Value };
                    cboItem.Attributes.Add("ownerTableViewId", e.Item.OwnerTableView.ClientID);
                    dropDown.Items.Add(cboItem);
                }
                dropDown.FindItemByValue(e.Item.OwnerTableView.PageSize.ToString()).Selected = true;
            }



            if (e.Item is GridDataItem)
            {
                GridDataItem gridItem = e.Item as GridDataItem;
                foreach (Telerik.Web.UI.GridColumn column in gridview.MasterTableView.RenderColumns)
                {
                    if (column is GridTemplateColumn)
                    {
                        //this line will show a tooltip based on the CustomerID data field
                        if (column.UniqueName == "edit")
                        {
                            gridItem[column.UniqueName].ToolTip = "Edit" +
                                Convert.ToString(gridItem.OwnerTableView.DataKeyValues[gridItem.ItemIndex]["Edit"]);
                        }

                    }
                }
            }

            if (e.Item is GridDataItem)
            {
                GridDataItem gridItem = e.Item as GridDataItem;
                foreach (Telerik.Web.UI.GridColumn column in gridview.MasterTableView.RenderColumns)
                {
                    if (column is GridTemplateColumn)
                    {
                        if (column.UniqueName == "delete")
                        {
                            gridItem[column.UniqueName].ToolTip = "Delete" +
                                Convert.ToString(gridItem.OwnerTableView.DataKeyValues[gridItem.ItemIndex]["Delete"]);
                        }

                    }
                }
            }

        }
        # endregion

        # region Functions
        public void Bind_Grid()
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Name");
                dt.Columns.Add("Address");
                dt.Columns.Add("Designation");
                dt.Rows.Add(new object[] { "1", "John", "Austin", "Team Lead" });
                dt.Rows.Add(new object[] { "2", "James", "Virginia", "Team Lead" });

                ds.Tables.Add(dt);
                Session["dt"] = dt;
                gridview.DataSourceID = null;
                gridview.DataSource = ds.Tables[0].DefaultView;
            }
            catch (Exception ex)
            {
            }
        }
        # endregion
    }

}