using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Client
{
    public partial class Booking : System.Web.UI.Page
    {
        private string classType;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnWomen_Click(object sender, EventArgs e)
        {
            classType = btnWomen.Text;
            btnUnisex.Enabled = false;
            btnMen.Enabled = false;
        }

        protected void btnMen_Click(object sender, EventArgs e)
        {
            classType = btnMen.Text;
            btnWomen.Enabled = false;
            btnUnisex.Enabled = false;
        }

        protected void btnUnisex_Click(object sender, EventArgs e)
        {
            classType = btnUnisex.Text;
            btnMen.Enabled = false;
            btnWomen.Enabled = false;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = Calendar1.SelectedDate;
            DateTime currentDate = DateTime.Now;

            // Check if the selected date is in the past
            if (selectedDate < currentDate)
            {
                // Reset the selected date to the current date
                Calendar1.SelectedDate = currentDate;
                Calendar1.VisibleDate = currentDate;

                //Show message that date has passed
            }
        }

        protected void btnMakeBooking_Click(object sender, EventArgs e)
        {
            //Only allow booking if client has membership
            //Response.Redirect("Membership")

            SqlDSBooking.InsertParameters["BookingID"].DefaultValue = "1";
            SqlDSBooking.InsertParameters["ClientID"].DefaultValue = "SHIVASH";
            if (classType == "Men")
            {
                SqlDSBooking.InsertParameters["ClassID"].DefaultValue = "1";
            }
            else if (classType == "Female")
            {
                SqlDSBooking.InsertParameters["ClassID"].DefaultValue = "2";
            }
            else
            {
                SqlDSBooking.InsertParameters["ClassID"].DefaultValue = "3";
            }

            SqlDSBooking.InsertParameters["Status"].DefaultValue = "Ongoing";
            SqlDSBooking.InsertParameters["isArchived"].DefaultValue = "false";
            SqlDSBooking.Insert();
        }


    }
}