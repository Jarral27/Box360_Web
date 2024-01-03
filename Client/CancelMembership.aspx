<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelMembership.aspx.cs" Inherits="Box360_Web.Client.CancelMembership" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <h2 style="text-align:center;width:100%;background-color:maroon;color:white">Membership</h2>
    <asp:DetailsView ID="dvMembership" runat="server" Height="100px" Width="564px" AutoGenerateRows="False" DataSourceID="SqlDSMembership" HorizontalAlign="Center">
        <Fields>
            <asp:BoundField DataField="MembershipID" HeaderText="MembershipID" InsertVisible="False" ReadOnly="True" SortExpression="MembershipID" />
            <asp:BoundField DataField="ClientID" HeaderText="ClientID" SortExpression="ClientID" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
            <asp:BoundField DataField="MembershipType" HeaderText="MembershipType" SortExpression="MembershipType" />
            <asp:BoundField DataField="TypeFee" HeaderText="TypeFee" SortExpression="TypeFee" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="AmountPaid" HeaderText="AmountPaid" SortExpression="AmountPaid" />
            <asp:BoundField DataField="AmountDue" HeaderText="AmountDue" SortExpression="AmountDue" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDSMembership" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT * FROM [Membership]" DeleteCommand="DELETE FROM Membership WHERE (Email = @email)">
        <DeleteParameters>
            <asp:Parameter Name="email" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <div style="text-align:center">
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Membership" OnClick="btnCancel_Click" />
    </div>
</asp:Content>
