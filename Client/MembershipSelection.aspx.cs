using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Client
{
    public partial class MembershipSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string userEmail = User.Identity.Name;
            SqlDSClient.SelectParameters["email"].DefaultValue = userEmail;
            SqlDSClient.Select(DataSourceSelectArguments.Empty);
            DataView dataView = (DataView)SqlDSClient.Select(DataSourceSelectArguments.Empty);
            
            string clientID = (dataView[0]["ClientID"]).ToString();

           
            SqlDSMS.SelectParameters["ClientID"].DefaultValue = clientID;
            SqlDSMS.Select(DataSourceSelectArguments.Empty);
            DataView dataView1 = (DataView)SqlDSMS.Select(DataSourceSelectArguments.Empty);

            if (dataView1.Count > 0)
            {
                Response.Redirect("CancelMembership");
            }
            else
            {
                txtClientID.Text = "";
                txtStatus.Text = "Ongoing";

                if (ddlMembershipType.Text.Equals("Monthly"))
                {
                    txtStartDate.Text = getStartDate().ToString();
                    txtEndDate.Text = getEndDateM(getStartDate()).ToString();
                    txtTypeFee.Text = "300";
                    txtAmtPaid.Text = "0";
                    txtAmtDue.Text = "300";
                }

                if (ddlMembershipType.Text == "Yearly")
                {
                    txtStartDate.Text = getStartDate().ToString();
                    txtEndDate.Text = getEndDateY(getStartDate()).ToString();
                    txtTypeFee.Text = "2400";
                    txtAmtPaid.Text = "0";
                    txtAmtDue.Text = "2400";
                }
            }
        }



        protected void btnAddMS_Click(object sender, EventArgs e)
        {

        }

        protected void ddlMembershipType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMembershipType.Text.Equals("Monthly"))
            {
                txtStartDate.Text = getStartDate().ToString();
                txtEndDate.Text = getEndDateM(getStartDate()).ToString();
                txtTypeFee.Text = "300";
                txtAmtPaid.Text = "0";
                txtAmtDue.Text = "300";
            }

            if (ddlMembershipType.Text == "Yearly")
            {
                txtStartDate.Text = getStartDate().ToString();
                txtEndDate.Text = getEndDateY(getStartDate()).ToString();
                txtTypeFee.Text = "2400";
                txtAmtPaid.Text = "0";
                txtAmtDue.Text = "2400";
            }
        }

        static DateTime getStartDate()
        {
            DateTime today = DateTime.Now.AddMonths(1);
            DateTime start = new DateTime(today.Year, today.Month, 1);

            return start;
        }

        static DateTime getEndDateM(DateTime start)
        {
            DateTime end1 = start.AddMonths(1);
            return end1;
        }

        static DateTime getEndDateY(DateTime start)
        {
            DateTime end2 = start.AddMonths(12);
            return end2;
        }

        protected void ddlMembershipType_TextChanged(object sender, EventArgs e)
        {
            
           
        }
    }
}