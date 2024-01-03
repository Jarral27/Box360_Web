using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Box360_Web.Client
{
    public partial class Merchandise : System.Web.UI.Page
    {
        DataTable dt;
        string orderNum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] {
                            new DataColumn("ItemID", typeof(string)),
                            new DataColumn("ItemName", typeof(string)),
                            new DataColumn("UnitCost", typeof(string)) 
                });

                gvShoppingCart.DataSource = dt;
                gvShoppingCart.DataBind();
                Session["ShoppingCart"] = dt;
            }
            else
            {
                if (Session["ShoppingCart"] != null)
                {
                    dt = (DataTable)Session["ShoppingCart"];
                }
            }

           
        }

        protected void gvInventory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string itemid = gvInventory.SelectedRow.Cells[1].Text;
            string itemname = gvInventory.SelectedRow.Cells[2].Text;
            string unitPrice = gvInventory.SelectedRow.Cells[4].Text;

            DataRow dr = dt.NewRow();
            dr["ItemID"] = itemid;
            dr["ItemName"] = itemname;
            dr["UnitCost"] = unitPrice;

            dt.Rows.Add(dr);

            gvShoppingCart.DataSource = dt;
            gvShoppingCart.DataBind();

            Session["ShoppingCart"] = dt;

            UpdateTotalCost();
        }


        protected void btnPayment_Click(object sender, EventArgs e)
        {
            if (dt.Rows.Count == 0)
            {
                // Show message that the shopping cart is empty
                Response.Write("<script type=\"text/javascript\">alert('Shopping Cart is Empty.');</script>");
            }
            else
            {
                decimal totalCost = Convert.ToDecimal(txtTotal.Text);
                recordSale(totalCost);
            }
            //recordSale();
            /*if (dt.Rows.Count == 0)
            {
                // Show message that shopping cart is empty
                Response.Write("<script type=\"text/javascript\">alert('Shopping Cart is Empty.');</script>");
            }
            else
            {
                //double totalCost = Convert.ToDouble(lblTotalCost.Text);
                //Response.Redirect("OrderPayCard.aspx?totalCost=" + totalCost);
                Response.Redirect("OrderPayCard");
            } */
        }

        protected void UpdateTotalCost()
        {
            double total = 0;
            foreach (DataRow row in dt.Rows)
            {
                total += Convert.ToDouble(row["UnitCost"]);
            }
            txtTotal.Text = total.ToString();
        }

        private void recordSale(decimal totalCost)
        {
            Random random = new Random();
            string saleID = "SI" + (random.Next(10000000, 99999999).ToString());
            orderNum = saleID;
            SqlDSSale.InsertParameters["SaleID"].DefaultValue = saleID;
            SqlDSSale.InsertParameters["SaleTotal_exclVAT"].DefaultValue = totalCost.ToString();
            SqlDSSale.InsertParameters["SaleDate"].DefaultValue = DateTime.Now.ToShortDateString();
            SqlDSSale.InsertParameters["SaleTime"].DefaultValue = DateTime.Now.ToShortTimeString();
            //decimal vat = Convert.ToDecimal(Convert.ToDouble(lblTotalCost.Text) * 0.85);
            SqlDSSale.InsertParameters["SaleTotal_inclVAT"].DefaultValue = totalCost.ToString();
            SqlDSSale.InsertParameters["SalePaymentType"].DefaultValue = "Cash";
            SqlDSSale.InsertParameters["SaleAmountTendered"].DefaultValue = totalCost.ToString();
            SqlDSSale.InsertParameters["SaleChange"].DefaultValue = "0";

            string userEmail = User.Identity.Name;
            SqlDSClient.SelectParameters["email"].DefaultValue = userEmail;
            SqlDSClient.Select(DataSourceSelectArguments.Empty);
            DataView dataView = (DataView)SqlDSClient.Select(DataSourceSelectArguments.Empty);

            string clientID = (dataView[0]["ClientID"]).ToString();

            SqlDSSale.InsertParameters["ClientID"].DefaultValue = clientID;
            SqlDSSale.InsertParameters["ManagerID"].DefaultValue = "MAJD36";
            
            SqlDSSale.Insert();

            recordSaleItem(saleID);

            Response.Write("Sale has been confirmed");
            printPdf();
        }

        private void recordSaleItem(string saleID)
        {
            foreach (DataRow row in dt.Rows)
            {
                Random random = new Random();
                string saleItemID = "SID" + random.Next(10000, 99999).ToString();
                SqlDSSaleItem.InsertParameters["SaleItemID"].DefaultValue = saleItemID;
                SqlDSSaleItem.InsertParameters["SaleID"].DefaultValue = saleID;
                SqlDSSaleItem.InsertParameters["ItemID"].DefaultValue = row["ItemID"].ToString();
                SqlDSSaleItem.InsertParameters["PaymentDetails"].DefaultValue = "Pending";
                SqlDSSaleItem.InsertParameters["Quantity"].DefaultValue = "1";
                SqlDSSaleItem.InsertParameters["UnitPrice"].DefaultValue = row["UnitCost"].ToString();
                SqlDSSaleItem.InsertParameters["Size"].DefaultValue = "Medium";
                SqlDSSaleItem.InsertParameters["Color"].DefaultValue = "Red";

                SqlDSSaleItem.Insert();
            }
        }

        private void printPdf()
        {
            string userName = User.Identity.Name;
            string orderNo = orderNum;

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    StringBuilder sb = new StringBuilder();

                    sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                    sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Invoice</b></td></tr>");
                    sb.Append("<tr><td colspan = '2'></td></tr>");
                    sb.Append("<tr><td><b>Order No: </b>");
                    sb.Append(orderNo);
                    sb.Append("</td><td align = 'right'><b>Date: </b>");
                    sb.Append(DateTime.Now);
                    sb.Append(" </td></tr>");
                    sb.Append("<tr><td colspan = '2'><b>Client Name: </b>");
                    sb.Append(userName);
                    sb.Append("</td></tr>");
                    sb.Append("</table>");
                    sb.Append("<br />");

                    sb.Append("<table border = '1'>");
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<th style = 'background-color: #D20B0C;color:#ffffff'>");
                        sb.Append(column.ColumnName);
                        sb.Append("</th>");
                    }
                    sb.Append("</tr>");
                    foreach (DataRow row in dt.Rows)
                    {
                        sb.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            sb.Append("<td>");
                            sb.Append(row[column]);
                            sb.Append("</td>");
                        }
                        sb.Append("</tr>");
                    }
                    sb.Append("</tr></table>");

                    //Export HTML String as PDF.
                    StringReader sr = new StringReader(sb.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + orderNo + ".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

        protected void btnPayment1_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderPayCard");
        }
    }
}