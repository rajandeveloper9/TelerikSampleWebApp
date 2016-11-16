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
    public partial class Loginpage : System.Web.UI.Page
    {

        # region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                }
            }
            catch (Exception ex)
            {
            }
        }
        # endregion

        # region Events
        protected void btn_login_Click(object sender, EventArgs e)
        {
            SqlConnection con = ConnectionUtil.getConnection();
            try
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_getuser", con);
                cmd.Parameters.Add(new SqlParameter("@Login", txt_login.Text));
                cmd.Parameters.Add(new SqlParameter("@Password", txt_password.Text));
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adap.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["UserName"] = dt.Rows[0]["UserName"];
                    Session["UserId"] = dt.Rows[0]["UserId"];
                    HttpContext.Current.Response.AddHeader("p3p", "CP=\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\"");
                    Response.Redirect("Landingpage.aspx");
                }
                else
                {
                    lblInformation.Text = "Invalid Login & Password";
                    Rw_alert.VisibleOnPageLoad = true;
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
        }
        # endregion
    }

}