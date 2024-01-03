<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderPayCard.aspx.cs" Inherits="Box360_Web.OrderPayCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <div style="border-style: solid; border-width: thin; text-align:center; width:50%">
        <h1>Card Details</h1>
        <table style="text-align:center;width:100%">
            <tr>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server">First Name</asp:TextBox>
                    &nbsp
                    &nbsp
                    &nbsp
                    <asp:TextBox ID="txtLastName" runat="server">Last Name</asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Image ID="imgCardServices" runat="server" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblCardNo" runat="server" Text="Card Number"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCardNo" runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Date"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtExpiryDate" runat="server" TextMode="DateTime"></asp:TextBox>  
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lblCVV" runat="server" Text="CVV"></asp:Label> 
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCVV" runat="server" MaxLength="3" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtBillingAddress" runat="server" Height="95px" TextMode="MultiLine" Width="250px">Billing Address</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
