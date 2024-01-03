using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Client
{
    public partial class ClientDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dvClient.DataBind();

            if (Context.User.IsInRole("Coach"))
            {
                Response.Redirect("~/Coach/Reports");
            }
            else if (Context.User.IsInRole("Manager"))
            {
                Response.Redirect("~/Manager/Booking");
            }
            else
            {
                string userEmail = User.Identity.Name;
                SqlDSClient.SelectParameters["Email"].DefaultValue = userEmail;
                dvClient.DataBind();
                if (dvClient.Rows.Count == 0)
                {
                    Response.Redirect("~/Client/ClientRegistration");
                }
            }

        }

        protected void dvClient_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void dvClient_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
           
        }

        protected void dvClient_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
           
        }

        protected void dvClient_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            //Label1.Text = dvClient.Rows[3].Cells[1].ToString();
            //Label1.Text = DataBinder.Eval(dvClient.DataItem, "ContactNumber").ToString();
            /*
            SqlDSClient.UpdateParameters["email"].DefaultValue = User.Identity.Name;
            SqlDSClient.UpdateParameters["ContactNumber"].DefaultValue = dvClient.Rows[3].Cells[0].ToString();
            SqlDSClient.Update();
            SqlDSClient.DataBind(); */
        }

        protected void dvClient_DataBound(object sender, EventArgs e)
        {
            
        }
    }
}