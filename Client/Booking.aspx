<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Box360_Web.Client.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section style="font-family: 'Times New Roman', Times, serif; text-align: center">
        <div style="font-family:'Times New Roman'; background-color: #333333; color: #FFFFFF; font-size: medium;">
            <h1 style="text-align: center">Boxing</h1>
            <b></b>
            <div>
                <p>
                    Experience the exhilaration of boxing at our gym! 
                    Our boxing classes offer a high-energy and empowering 
                    workout that combines the art of boxing with fitness. 
                    Whether you're a seasoned pro or a complete beginner, 
                    our certified trainers will guide you through a dynamic 
                    training session that includes punching techniques, footwork, 
                    and conditioning exercises. Get ready to build strength, 
                    improve endurance, and boost your self-confidence while 
                    having a blast in a supportive and motivating environment. 
                    Join us in the ring and discover the incredible physical 
                    and mental benefits of boxing. It's not just a workout; 
                    it's a way of life.
                </p>
            </div>
        </div>
    </section>
    <hr />
      
    <section style="text-align: center; font-family: 'Times New Roman', Times, serif">
        <div>
            <h1>Why Boxing is Essential</h1>
            <p>
                "Boxing is an important sport for a multitude of reasons. It offers a dynamic full-body workout, enhancing physical fitness, cardiovascular health, strength, and agility. Additionally, it equips individuals with valuable self-defense skills, boosting their confidence and personal safety. Beyond the physical aspects, boxing instills discipline, focus, and mental resilience, fostering qualities like determination and perseverance. It serves as a constructive outlet for stress and aggression, contributing to emotional well-being. The sport also encourages sportsmanship, respect, and fair play, nurturing good character and values. Furthermore, it creates a sense of community and friendship within the boxing world and offers opportunities for athletes to compete at the highest levels. With cultural significance and a rich history, boxing is not only a sport but also a source of inspiration and entertainment for audiences worldwide. It plays a vital role in personal growth, fitness, and the enrichment of one's life."
            </p>
        </div>
    </section>
   
    <hr />
    <section style="background-color: #333333; font-family: 'Times New Roman', Times, serif; color: #FFFFFF">
        <div style="text-align: center">
            <h2>Pick your class</h2>
            <h1>Boxing Classes</h1>
            
            <div style="text-align: center; color: #000000;">
                <div style="border-color: black; float:left ; border-style: solid; width: 33.33%">
                    <asp:Panel ID="pnlMen" runat="server" Height="300px" Width="300px" HorizontalAlign="Center">
                        <asp:Button ID="btnMen" runat="server" Text="Men" Width="100%" Height="100%" OnClick="btnMen_Click"/>
                    </asp:Panel>
                </div>
                <div style="border-color: black; float:left ; border-style: solid; width: 33.33%">
                    <asp:Panel ID="pnlWomen" runat="server" Height="300px" Width="300px" HorizontalAlign="Center">
                        <asp:Button ID="btnWomen" runat="server" Text="Women" Width="100%" Height="100%" OnClick="btnWomen_Click"/>
                    </asp:Panel>
                </div>
                <div style="border-color: black; float:left ; border-style: solid; width: 33.33%">
                    <asp:Panel ID="pnlUnisex" runat="server" Height="300px" Width="300px">
                        <asp:Button ID="btnUnisex" runat="server" Text="Unisex" Width="100%" Height="100%" OnClick="btnUnisex_Click" />
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div>
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        </div>
        <asp:Button ID="btnMakeBooking" runat="server" Text="Make a Booking" ForeColor="Black" OnClick="btnMakeBooking_Click" />

        <asp:SqlDataSource ID="SqlDSBooking" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GroupWst13ConnectionString %>" DeleteCommand="DELETE FROM [BookingTest] WHERE [BookingID] = @original_BookingID AND [ClientID] = @original_ClientID AND [ClassID] = @original_ClassID AND [BookingDate] = @original_BookingDate AND [Status] = @original_Status AND [isArchived] = @original_isArchived" InsertCommand="INSERT INTO [BookingTest] ([BookingID], [ClientID], [ClassID], [BookingDate], [Status], [isArchived]) VALUES (@BookingID, @ClientID, @ClassID, @BookingDate, @Status, @isArchived)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [BookingTest]" UpdateCommand="UPDATE [BookingTest] SET [ClientID] = @ClientID, [ClassID] = @ClassID, [BookingDate] = @BookingDate, [Status] = @Status, [isArchived] = @isArchived WHERE [BookingID] = @original_BookingID AND [ClientID] = @original_ClientID AND [ClassID] = @original_ClassID AND [BookingDate] = @original_BookingDate AND [Status] = @original_Status AND [isArchived] = @original_isArchived">
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
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="BookingDate" PropertyName="SelectedDate" />
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

    </section>
</asp:Content>
