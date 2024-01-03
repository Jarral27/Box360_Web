<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientDetails.aspx.cs" Inherits="Box360_Web.Client.ClientDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <h2 style="text-align:center;width:100%;background-color:maroon;color:white">Customer Details</h2>
    <asp:DetailsView ID="dvClient" runat="server" Height="50px" Width="268px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ClientID" DataSourceID="SqlDSClient" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnPageIndexChanging="dvClient_PageIndexChanging" OnItemUpdating="dvClient_ItemUpdating" OnModeChanging="dvClient_ModeChanging" OnItemUpdated="dvClient_ItemUpdated" OnDataBound="dvClient_DataBound">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ClientID" HeaderText="ClientID" SortExpression="ClientID" ReadOnly="True" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ReadOnly="True" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" ReadOnly="True" />
            <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" SortExpression="ContactNumber" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" ReadOnly="True" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" ReadOnly="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
</asp:DetailsView>

    <asp:SqlDataSource ID="SqlDSClient" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT * FROM [Client] WHERE ([Email] = @Email)" DeleteCommand="DELETE FROM [Client] WHERE [ClientID] = @original_ClientID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [ContactNumber] = @original_ContactNumber AND [Email] = @original_Email AND [Gender] = @original_Gender AND [Password] = @original_Password" InsertCommand="INSERT INTO [Client] ([ClientID], [FirstName], [LastName], [ContactNumber], [Email], [Gender], [Password]) VALUES (@ClientID, @FirstName, @LastName, @ContactNumber, @Email, @Gender, @Password)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE Client SET ContactNumber = @ContactNumber WHERE (Email = @email)">
        <DeleteParameters>
            <asp:Parameter Name="original_ClientID" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_ContactNumber" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Gender" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ClientID" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="ContactNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ContactNumber" />
            <asp:Parameter Name="email" />
        </UpdateParameters>
</asp:SqlDataSource>
    
</asp:Content>
