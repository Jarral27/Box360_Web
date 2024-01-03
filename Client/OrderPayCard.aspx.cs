using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web
{
    public partial class OrderPayCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["totalCost"] != null)
                {
                    string totalCost = Request.QueryString["totalCost"];
                    //lblTotalCost.Text = totalCost;
                }
                else
                {
                    // Handle missing total cost query parameter
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if((txtFirstName.Text != "") && (txtLastName.Text != "") && (txtCardNo.Text != "") && (txtExpiryDate.Text != "") && (txtCVV.Text != "") && (txtBillingAddress.Text != ""))
            {
                Response.Write("<script type=\"text/javascript\">alert('Payment verified.');</script>");

                if (SimulatePayment())
                {
                    DataTable dt = (DataTable)Session["ShoppingCart"];
                    InsertSaleAndSaleItems();
                    Session["ShoppingCart"] = null;
                 }

                Response.Redirect("~/Client/Merchandise");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Payment Failed. Information invalid.');</script>");
            }
        }

        private bool SimulatePayment()
        {
            return true;
        }

        private void InsertSaleAndSaleItems()
        {

        }
    }
}