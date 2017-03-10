<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Suivi.Administrateur.WebForm27" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Les Notifications
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les Notifications
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
    <asp:SqlDataSource ID="DSNotifs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>"  ></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GVNotif" runat="server" DataSourceID="DSNotifs" 
        AutoGenerateColumns="False" AllowPaging="True" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Vertical" Height="173px" DataKeyNames="Vu_notif">
        <RowStyle BackColor="#F7F7DE"/>
    <Columns>
        <asp:BoundField DataField="Date" 
            HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}" />
        <asp:BoundField DataField="Notification" HeaderText="Notification" 
            SortExpression="Notification"/>
        <asp:BoundField DataField="Vu_notif" HeaderText="Etat" 
            SortExpression="Vu_notif" Visible="false"/>
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
