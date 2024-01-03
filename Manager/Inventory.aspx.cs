using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Manager
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddItem");
        }

        protected void imgbtnSearch_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}