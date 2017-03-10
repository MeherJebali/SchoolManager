<%@ Page Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Suivi.Parent.WebForm6" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Les Notifications
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Notifications
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
    <asp:SqlDataSource ID="DSNotifs" runat="server"
    ConnectionString="<%$ ConnectionStrings:Cnxion %>" ></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="DSNotifs" ForeColor="Black" GridLines="Vertical" 
        Width="465px" HorizontalAlign="Center" DataKeyNames="Vu_notif">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" 
                SortExpression="Date" />
            <asp:BoundField DataField="Notification" HeaderText="Notification" 
                SortExpression="Notification" />
            <asp:BoundField DataField="Vu_notif" SortExpression="Vu_notif" Visible="false"/>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>
</center>
<asp:TextBox ID="txtTest" runat="server" Visible="false"></asp:TextBox>
</asp:Content>
