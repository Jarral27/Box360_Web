using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Client
{
    public partial class ClientRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = User.Identity.Name;
            txtClientID.Text = generateClientID();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if ((txtClientID.Text != "") && (txtFirstName.Text != "") && (txtLastName.Text != "") && (txtContactNo.Text != "") && (txtEmail.Text != "") && (ddlGenders.Text != "") && (txtPassword.Text != "")){
                SqlDSClient.Insert();
                Response.Redirect("ClientDetails");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill in all required fields and provide valid data.');</script>");
            }
        }

        static string generateClientID()
        {
            string connectionString = "Data Source=146.230.177.46;Initial Catalog=GroupWst13;User ID=GroupWst13;Password=kqf42";

            Random random = new Random();
            int randomNumber = random.Next(10000, 100000);
            string formattedNumber = randomNumber.ToString("D5");

            while (checkPK(connectionString, "MEM" + formattedNumber))
            {
                random = new Random();
                randomNumber = random.Next(10000, 100000);
                formattedNumber = randomNumber.ToString("D5");
            }
            return "MEM" + formattedNumber;
        }

        static bool checkPK(string connectionString, string clientID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM Client WHERE ClientID = @clientID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@clientID", clientID);
                    int count = (int)command.ExecuteScalar();

                    return count > 0; // If count > 0, the primary key exists in the table.
                }
            }
        }

    }
}