<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientRegistration.aspx.cs" Inherits="Box360_Web.Client.ClientRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width:50%">
        <h2 style="text-align:center">Customer Registration</h2>
        <table style="width: 100%">
            <tr>
                <td colspan="2">Enter Client ID
                </td>
                <td>
                    <asp:TextBox ID="txtClientID" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">Enter First Name
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">Enter Last Name
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">Enter Contact Numbers
                </td>
                <td>
                    <asp:TextBox ID="txtContactNo" runat="server" MaxLength="10" TextMode="Phone"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">Enter Email
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" ReadOnly="True" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">Enter Gender
                </td>
                <td>
                    <asp:DropDownList ID="ddlGenders" runat="server" Height="20px" Width="128px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">Enter Password
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="4"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDSClient" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" DeleteCommand="DELETE FROM [Client] WHERE [ClientID] = @original_ClientID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [ContactNumber] = @original_ContactNumber AND [Email] = @original_Email AND [Gender] = @original_Gender AND [Password] = @original_Password" InsertCommand="INSERT INTO [Client] ([ClientID], [FirstName], [LastName], [ContactNumber], [Email], [Gender], [Password]) VALUES (@ClientID, @FirstName, @LastName, @ContactNumber, @Email, @Gender, @Password)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Client]" UpdateCommand="UPDATE [Client] SET [FirstName] = @FirstName, [LastName] = @LastName, [ContactNumber] = @ContactNumber, [Email] = @Email, [Gender] = @Gender, [Password] = @Password WHERE [ClientID] = @original_ClientID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND [ContactNumber] = @original_ContactNumber AND [Email] = @original_Email AND [Gender] = @original_Gender AND [Password] = @original_Password">
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
            <asp:ControlParameter ControlID="txtClientID" Name="ClientID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtFirstName" Name="FirstName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtLastName" Name="LastName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtContactNo" Name="ContactNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlGenders" Name="Gender" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="Password" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="ContactNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="original_ClientID" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_ContactNumber" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Gender" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
