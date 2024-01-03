<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Box360_Web.Manager.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center">
        <h1>Booking Management</h1>
        <div style="text-align: center">
            <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
        </div>
        <asp:GridView ID="gvBooking" runat="server" Width-="100%" AutoGenerateColumns="False" DataKeyNames="BookingID" DataSourceID="SqlDSBooking" Width="100%">
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="BookingID" ReadOnly="True" SortExpression="BookingID" />
                <asp:BoundField DataField="ClientID" HeaderText="ClientID" SortExpression="ClientID" />
                <asp:BoundField DataField="ClassID" HeaderText="ClassID" SortExpression="ClassID" />
                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:CheckBoxField DataField="isArchived" HeaderText="isArchived" SortExpression="isArchived" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDSBooking" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" DeleteCommand="DELETE FROM [Booking] WHERE [BookingID] = @original_BookingID AND [ClientID] = @original_ClientID AND [ClassID] = @original_ClassID AND [BookingDate] = @original_BookingDate AND [Status] = @original_Status AND [isArchived] = @original_isArchived" InsertCommand="INSERT INTO [Booking] ([BookingID], [ClientID], [ClassID], [BookingDate], [Status], [isArchived]) VALUES (@BookingID, @ClientID, @ClassID, @BookingDate, @Status, @isArchived)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Booking]" UpdateCommand="UPDATE [Booking] SET [ClientID] = @ClientID, [ClassID] = @ClassID, [BookingDate] = @BookingDate, [Status] = @Status, [isArchived] = @isArchived WHERE [BookingID] = @original_BookingID AND [ClientID] = @original_ClientID AND [ClassID] = @original_ClassID AND [BookingDate] = @original_BookingDate AND [Status] = @original_Status AND [isArchived] = @original_isArchived">
            <DeleteParameters>
                <asp:Parameter Name="original_BookingID" Type="String" />
                <asp:Parameter Name="original_ClientID" Type="String" />
                <asp:Parameter Name="original_ClassID" Type="String" />
                <asp:Parameter DbType="Date" Name="original_BookingDate" />
                <asp:Parameter Name="original_Status" Type="String" />
                <asp:Parameter Name="original_isArchived" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BookingID" Type="String" />
                <asp:Parameter Name="ClientID" Type="String" />
                <asp:Parameter Name="ClassID" Type="String" />
                <asp:Parameter DbType="Date" Name="BookingDate" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="isArchived" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ClientID" Type="String" />
                <asp:Parameter Name="ClassID" Type="String" />
                <asp:Parameter DbType="Date" Name="BookingDate" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="isArchived" Type="Boolean" />
                <asp:Parameter Name="original_BookingID" Type="String" />
                <asp:Parameter Name="original_ClientID" Type="String" />
                <asp:Parameter Name="original_ClassID" Type="String" />
                <asp:Parameter DbType="Date" Name="original_BookingDate" />
                <asp:Parameter Name="original_Status" Type="String" />
                <asp:Parameter Name="original_isArchived" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDSSearch" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT * FROM [Booking] WHERE ([BookingDate] = @BookingDate)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="BookingDate" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
