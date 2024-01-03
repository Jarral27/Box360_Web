<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Box360_Web.Manager.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center">
        <h1>Inventory Management</h1>
        <div style="text-align: right">
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:ImageButton ID="imgbtnSearch" runat="server" ImageUrl="~/Images/search.jpg" Height="22px" Width="22px" OnClick="imgbtnSearch_Click" />
            <asp:Button ID="btnAddRecord" runat="server" Text="Add New Record" OnClick="btnAddRecord_Click" />
        </div>
        <asp:GridView ID="gvInventory" runat="server" Width-="100%" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDSInventory" Width="100%">
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
                <asp:BoundField DataField="SellingPrice" HeaderText="SellingPrice" SortExpression="SellingPrice" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="CostPrice" HeaderText="CostPrice" SortExpression="CostPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDSInventory" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Inventory]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDSSearch" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT * FROM [Inventory] WHERE ([ItemName] LIKE '%' + @ItemName + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="ItemName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
