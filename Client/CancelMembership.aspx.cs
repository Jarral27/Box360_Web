using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Client
{
    public partial class CancelMembership : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SqlDSMembership.DeleteParameters["Email"].DefaultValue = User.Identity.Name;
            SqlDSMembership.Delete();

            Response.Redirect("ClientDetails");
        }
    }
}