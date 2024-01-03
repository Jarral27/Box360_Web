using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Manager
{
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtItemID.Text = generateClientID();
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if((txtItemID.Text != "") && (txtItemName.Text != "") && (txtItemDescription.Text != "") && (txtSellingPrice.Text != "") && (ddlType.Text != "") && (txtCostPrice.Text != "") && (ddlQuantity.Text != ""))
            {
                SqlDSInventory.Insert();
                
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inventory");
        }

        static string generateClientID()
        {
            string connectionString = "Data Source=146.230.177.46;Initial Catalog=GroupWst13;User ID=GroupWst13;Password=kqf42";

            Random random = new Random();
            int randomNumber = random.Next(1000000, 9999999);
            string formattedNumber = randomNumber.ToString("D5");

            while (checkPK(connectionString, "ID" + formattedNumber))
            {
                random = new Random();
                randomNumber = random.Next(10000, 100000);
                formattedNumber = randomNumber.ToString("D5");
            }
            return "ID" + formattedNumber;
        }

        static bool checkPK(string connectionString, string itemID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM Inventory WHERE ItemID = @itemID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@itemID", itemID);
                    int count = (int)command.ExecuteScalar();

                    return count > 0; // If count > 0, the primary key exists in the table.
                }
            }
        }
    }
}