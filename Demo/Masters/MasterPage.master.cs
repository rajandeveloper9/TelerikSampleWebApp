# region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using AjaxControlToolkit;
using Telerik.Web.UI;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Threading;
using System.Collections;
using System.Web.Services;
using System.Text;
using System.Security.Cryptography;
# endregion
public partial class MasterPages_MasterPage : System.Web.UI.MasterPage
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

}


