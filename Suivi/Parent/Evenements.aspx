<%@ Page Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Evenements.aspx.cs" Inherits="Suivi.Parent.WebForm3" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Les évènéments 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les évènéments 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
    <div class="profs">
        <asp:SqlDataSource ID="DSEvent" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT [ID_event], [Photo_event], [Lib_event], [Date_event], [NbrParticipants_event], [NbrPlaces_event] FROM [Evenement]"></asp:SqlDataSource>
        <asp:DataList ID="Listevent" runat="server" DataKeyField="ID_event" 
            DataSourceID="DSEvent" RepeatColumns="2" HorizontalAlign="Center">
            <ItemTemplate>
                <table border="2" bordercolor="#808080" rules=none  width="350px" height="90">
            <tr>
              <td rowspan="3">
                <asp:Image ID="Image1" runat="server" ImageURL='<%# Eval("Photo_event") %>'  Width="150px" Height="85" />
              </td>
              <td colspan="2">
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Lib_event") %>' Font-Bold="True"></asp:Label>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Date_event","{0:d}") %>'></asp:Label>
              </td>
            </tr>
            <tr>
              <td>
               <asp:Label ID="Label4" runat="server" Text='<%# Eval("NbrParticipants_event") %> '></asp:Label>/<asp:Label ID="Label2" runat="server" Text='<%# Eval("NbrPlaces_event") %> '></asp:Label> Réservations
              </td>
              <td>
                <a href="Evenements_Details.aspx?ID_event=<%# Eval("ID_event") %>">Détails</a>
              </td>
            </tr>
               
        </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</center>
</asp:Content>
