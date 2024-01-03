<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MembershipSelection.aspx.cs" Inherits="Box360_Web.Client.MembershipSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align:center">
        <h3>Membership</h3>
        <table style="text-align:center ; width:100%"> 
            <tr>
                <td colspan="2">
                    Client ID
                </td>
                <td>
                    <asp:TextBox ID="txtClientID" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Start Date
                </td>
                <td>
                    <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    End Date
                </td>
                <td>
                    <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    MembershipType
                </td>
                <td>
                    <asp:DropDownList ID="ddlMembershipType" runat="server" Height="17px" Width="127px" OnSelectedIndexChanged="ddlMembershipType_SelectedIndexChanged" OnTextChanged="ddlMembershipType_TextChanged" AutoPostBack="True">
                        <asp:ListItem>Monthly</asp:ListItem>
                        <asp:ListItem>Yearly</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Type of Fee
                </td>
                <td>
                    <asp:TextBox ID="txtTypeFee" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Status
                </td>
                <td>
                    <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Amount Paid
                </td>
                <td>
                    <asp:TextBox ID="txtAmtPaid" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Amount Due
                </td>
                <td>
                    <asp:TextBox ID="txtAmtDue" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnAddMS" runat="server" Text="Add Membership" OnClick="btnAddMS_Click" />
        <asp:SqlDataSource ID="SqlDSMS" runat="server" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" SelectCommand="SELECT * FROM [Membership] WHERE ([ClientID] = @ClientID)">
            <SelectParameters>
                <asp:Parameter Name="ClientID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDSClient" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [ClientID] = @original_ClientID" InsertCommand="INSERT INTO [Client] ([ClientID]) VALUES (@ClientID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ClientID] FROM [Client] WHERE ([Email] = @Email)">
            <DeleteParameters>
                <asp:Parameter Name="original_ClientID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ClientID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
