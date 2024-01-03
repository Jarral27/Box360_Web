<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="Box360_Web.Manager.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center;width:70%">
        <h1>Item Addition</h1>
        <table style="border-style: none; text-align:center; width:100%">
            <tr>
                <td colspan="2">
                    Item ID
                </td>
                <td>
                    <asp:TextBox ID="txtItemID" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Item Name
                </td>
                <td>
                    <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Item Description
                </td>
                <td>
                    <asp:TextBox ID="txtItemDescription" runat="server" Height="84px" TextMode="MultiLine" Width="240px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Selling Price
                </td>
                <td>
                    <asp:TextBox ID="txtSellingPrice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Type
                </td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server" Height="16px" Width="126px">
                        <asp:ListItem>Boxing Glove</asp:ListItem>
                        <asp:ListItem>Free Weight</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Cost Price
                </td>
                <td>
                    <asp:TextBox ID="txtCostPrice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Quantity
                </td>
                <td>
                    <asp:DropDownList ID="ddlQuantity" runat="server" Height="18px" Width="123px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" />
        <asp:SqlDataSource ID="SqlDSInventory" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" InsertCommand="INSERT INTO Inventory(ItemID, ItemName, ItemDescription, SellingPrice, Type, CostPrice, Quantity) VALUES (@itemid, @itemname, @itemdescript, @sellprice, @type, @costprice, @quantity)" SelectCommand="SELECT * FROM [Inventory]">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtItemID" Name="itemid" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtItemName" Name="itemname" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtItemDescription" Name="itemdescript" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtSellingPrice" Name="sellprice" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlType" Name="type" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtCostPrice" Name="costprice" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlQuantity" Name="quantity" PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>

    
    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
    <asp:Button ID="btnHome" runat="server" Text="Home" OnClick="btnHome_Click" />

</asp:Content>