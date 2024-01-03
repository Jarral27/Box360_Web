<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="Box360_Web.Manager.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center">
        <h1>Sales Management</h1>
        
        <asp:GridView ID="gvSales" runat="server" Width-="100%" AutoGenerateColumns="False" DataKeyNames="SaleID" DataSourceID="SqlDSSales" Width="100%" HorizontalAlign="Center">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="SaleID" HeaderText="SaleID" ReadOnly="True" SortExpression="SaleID" />
                <asp:BoundField DataField="SaleTotal_exclVAT" HeaderText="SaleTotal_exclVAT" SortExpression="SaleTotal_exclVAT" />
                <asp:BoundField DataField="SaleDate" HeaderText="SaleDate" SortExpression="SaleDate" />
                <asp:BoundField DataField="SaleTime" HeaderText="SaleTime" SortExpression="SaleTime" />
                <asp:BoundField DataField="SaleTotal_inclVAT" HeaderText="SaleTotal_inclVAT" SortExpression="SaleTotal_inclVAT" />
                <asp:BoundField DataField="SalePaymentType" HeaderText="SalePaymentType" SortExpression="SalePaymentType" />
                <asp:BoundField DataField="SaleAmountTendered" HeaderText="SaleAmountTendered" SortExpression="SaleAmountTendered" />
                <asp:BoundField DataField="SaleChange" HeaderText="SaleChange" SortExpression="SaleChange" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDSSales" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT [SaleID], [SaleTotal_exclVAT], [SaleDate], [SaleTime], [SaleTotal_inclVAT], [SalePaymentType], [SaleAmountTendered], [SaleChange] FROM [Sale]"></asp:SqlDataSource>
        &nbsp
        </div>

    <div>
        <asp:GridView ID="gvFullSale" runat="server" AutoGenerateColumns="False" DataKeyNames="SaleItemID" DataSourceID="SqlDSFullSale" OnSelectedIndexChanged="gvFullSale_SelectedIndexChanged" Width="691px" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="SaleItemID" HeaderText="SaleItemID" ReadOnly="True" SortExpression="SaleItemID" />
                <asp:BoundField DataField="SaleID" HeaderText="SaleID" SortExpression="SaleID" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                <asp:BoundField DataField="PaymentDetails" HeaderText="PaymentDetails" SortExpression="PaymentDetails" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDSFullSale" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT [SaleItemID], [SaleID], [ItemID], [PaymentDetails], [Quantity], [UnitPrice] FROM [SaleItem] WHERE ([SaleID] = @SaleID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvSales" Name="SaleID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
