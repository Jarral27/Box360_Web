<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Merchandise.aspx.cs" Inherits="Box360_Web.Client.Merchandise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gvInventory" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDSItems" Width="100%" OnSelectedIndexChanged="gvInventory_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
            <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
            <asp:BoundField DataField="SellingPrice" HeaderText="SellingPrice" SortExpression="SellingPrice" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="CostPrice" HeaderText="CostPrice" SortExpression="CostPrice" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDSItems" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT * FROM [Inventory]"></asp:SqlDataSource>
    <hr />
    <asp:Button ID="btnPayment1" runat="server" Text="Payment" OnClick="btnPayment1_Click" />
    <div>
        <div style="float:left;width:50%">
            <h3>Shopping Cart</h3>
            <asp:GridView ID="gvShoppingCart" runat="server" Width="400px">
            </asp:GridView>
        </div>
        <div style="float:left;width:30%">
            <h3>Cart Summary</h3>
            
            <div style="text-align:center">Total Cost: <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox></div>
        </div>
    </div>

    <asp:Button ID="btnPayment" runat="server" Text="Proceed to Checkout" OnClick="btnPayment_Click" />

    <asp:SqlDataSource ID="SqlDSSale" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" DeleteCommand="DELETE FROM [Sale] WHERE [SaleID] = @original_SaleID AND [SaleTotal_exclVAT] = @original_SaleTotal_exclVAT AND [SaleDate] = @original_SaleDate AND [SaleTime] = @original_SaleTime AND [SaleTotal_inclVAT] = @original_SaleTotal_inclVAT AND [SalePaymentType] = @original_SalePaymentType AND [SaleAmountTendered] = @original_SaleAmountTendered AND [SaleChange] = @original_SaleChange AND [ClientID] = @original_ClientID AND [ManagerID] = @original_ManagerID" InsertCommand="INSERT INTO [Sale] ([SaleID], [SaleTotal_exclVAT], [SaleDate], [SaleTime], [SaleTotal_inclVAT], [SalePaymentType], [SaleAmountTendered], [SaleChange], [ClientID], [ManagerID]) VALUES (@SaleID, @SaleTotal_exclVAT, @SaleDate, @SaleTime, @SaleTotal_inclVAT, @SalePaymentType, @SaleAmountTendered, @SaleChange, @ClientID, @ManagerID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Sale]" UpdateCommand="UPDATE [Sale] SET [SaleTotal_exclVAT] = @SaleTotal_exclVAT, [SaleDate] = @SaleDate, [SaleTime] = @SaleTime, [SaleTotal_inclVAT] = @SaleTotal_inclVAT, [SalePaymentType] = @SalePaymentType, [SaleAmountTendered] = @SaleAmountTendered, [SaleChange] = @SaleChange, [ClientID] = @ClientID, [ManagerID] = @ManagerID WHERE [SaleID] = @original_SaleID AND [SaleTotal_exclVAT] = @original_SaleTotal_exclVAT AND [SaleDate] = @original_SaleDate AND [SaleTime] = @original_SaleTime AND [SaleTotal_inclVAT] = @original_SaleTotal_inclVAT AND [SalePaymentType] = @original_SalePaymentType AND [SaleAmountTendered] = @original_SaleAmountTendered AND [SaleChange] = @original_SaleChange AND [ClientID] = @original_ClientID AND [ManagerID] = @original_ManagerID">
        <DeleteParameters>
            <asp:Parameter Name="original_SaleID" Type="String" />
            <asp:Parameter Name="original_SaleTotal_exclVAT" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_SaleDate" />
            <asp:Parameter DbType="Time" Name="original_SaleTime" />
            <asp:Parameter Name="original_SaleTotal_inclVAT" Type="Decimal" />
            <asp:Parameter Name="original_SalePaymentType" Type="String" />
            <asp:Parameter Name="original_SaleAmountTendered" Type="Decimal" />
            <asp:Parameter Name="original_SaleChange" Type="Decimal" />
            <asp:Parameter Name="original_ClientID" Type="String" />
            <asp:Parameter Name="original_ManagerID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SaleID" Type="String" />
            <asp:Parameter Name="SaleTotal_exclVAT" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="SaleDate" />
            <asp:Parameter DbType="Time" Name="SaleTime" />
            <asp:Parameter Name="SaleTotal_inclVAT" Type="Decimal" />
            <asp:Parameter Name="SalePaymentType" Type="String" />
            <asp:Parameter Name="SaleAmountTendered" Type="Decimal" />
            <asp:Parameter Name="SaleChange" Type="Decimal" />
            <asp:Parameter Name="ClientID" Type="String" />
            <asp:Parameter Name="ManagerID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SaleTotal_exclVAT" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="SaleDate" />
            <asp:Parameter DbType="Time" Name="SaleTime" />
            <asp:Parameter Name="SaleTotal_inclVAT" Type="Decimal" />
            <asp:Parameter Name="SalePaymentType" Type="String" />
            <asp:Parameter Name="SaleAmountTendered" Type="Decimal" />
            <asp:Parameter Name="SaleChange" Type="Decimal" />
            <asp:Parameter Name="ClientID" Type="String" />
            <asp:Parameter Name="ManagerID" Type="String" />
            <asp:Parameter Name="original_SaleID" Type="String" />
            <asp:Parameter Name="original_SaleTotal_exclVAT" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_SaleDate" />
            <asp:Parameter DbType="Time" Name="original_SaleTime" />
            <asp:Parameter Name="original_SaleTotal_inclVAT" Type="Decimal" />
            <asp:Parameter Name="original_SalePaymentType" Type="String" />
            <asp:Parameter Name="original_SaleAmountTendered" Type="Decimal" />
            <asp:Parameter Name="original_SaleChange" Type="Decimal" />
            <asp:Parameter Name="original_ClientID" Type="String" />
            <asp:Parameter Name="original_ManagerID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSSaleItem" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" DeleteCommand="DELETE FROM [SaleItem] WHERE [SaleItemID] = @original_SaleItemID AND [SaleID] = @original_SaleID AND [ItemID] = @original_ItemID AND [PaymentDetails] = @original_PaymentDetails AND [Quantity] = @original_Quantity AND [UnitPrice] = @original_UnitPrice AND [Size] = @original_Size AND [Color] = @original_Color" InsertCommand="INSERT INTO [SaleItem] ([SaleItemID], [SaleID], [ItemID], [PaymentDetails], [Quantity], [UnitPrice], [Size], [Color]) VALUES (@SaleItemID, @SaleID, @ItemID, @PaymentDetails, @Quantity, @UnitPrice, @Size, @Color)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SaleItem]" UpdateCommand="UPDATE [SaleItem] SET [SaleID] = @SaleID, [ItemID] = @ItemID, [PaymentDetails] = @PaymentDetails, [Quantity] = @Quantity, [UnitPrice] = @UnitPrice, [Size] = @Size, [Color] = @Color WHERE [SaleItemID] = @original_SaleItemID AND [SaleID] = @original_SaleID AND [ItemID] = @original_ItemID AND [PaymentDetails] = @original_PaymentDetails AND [Quantity] = @original_Quantity AND [UnitPrice] = @original_UnitPrice AND [Size] = @original_Size AND [Color] = @original_Color">
        <DeleteParameters>
            <asp:Parameter Name="original_SaleItemID" Type="String" />
            <asp:Parameter Name="original_SaleID" Type="String" />
            <asp:Parameter Name="original_ItemID" Type="String" />
            <asp:Parameter Name="original_PaymentDetails" Type="String" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
            <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
            <asp:Parameter Name="original_Size" Type="String" />
            <asp:Parameter Name="original_Color" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SaleItemID" Type="String" />
            <asp:Parameter Name="SaleID" Type="String" />
            <asp:Parameter Name="ItemID" Type="String" />
            <asp:Parameter Name="PaymentDetails" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="Size" Type="String" />
            <asp:Parameter Name="Color" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SaleID" Type="String" />
            <asp:Parameter Name="ItemID" Type="String" />
            <asp:Parameter Name="PaymentDetails" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="Size" Type="String" />
            <asp:Parameter Name="Color" Type="String" />
            <asp:Parameter Name="original_SaleItemID" Type="String" />
            <asp:Parameter Name="original_SaleID" Type="String" />
            <asp:Parameter Name="original_ItemID" Type="String" />
            <asp:Parameter Name="original_PaymentDetails" Type="String" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
            <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
            <asp:Parameter Name="original_Size" Type="String" />
            <asp:Parameter Name="original_Color" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSClient" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT * FROM [Client] WHERE ([Email] = @Email)">
        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
