<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Evenements_Details.aspx.cs" Inherits="Suivi.Administrateur.WebForm22" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Détails évènement
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Détails évènement
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<div class="profs">
    <asp:SqlDataSource ID="DSDetailsEvent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT ID_event, Lib_event, Desc_event,Prix_event , Photo_event, Date_event, NbrPlaces_event, NbrParticipants_event FROM Evenement WHERE (ID_event = @ID_event)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID_event" QueryStringField="ID_event" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="EventDetails">
    <asp:DataList ID="EventDetails" runat="server" DataKeyField="ID_event" 
        DataSourceID="DSDetailsEvent">
    <ItemTemplate>
                <font color="#14327c"><h2><asp:Label ID="lblTitre" runat="server" 
                    Text='<%# Eval("Lib_event") %>' /></h2></font>
                <br />
                <asp:Image ID="Image1" runat="server" ImageURL='<%# Eval("Photo_event") %>'                                  Width="320px" Height="220px" />
                <br />
                <br />
                <font color="#f3961b"><b>Date: </b></font>
                <asp:Label ID="formatDate" runat="server" Text='<%# Eval("Date_event","{0:d}") %>'></asp:Label>
                <br />
                <br />
                <font color="#f3961b"><b>Nombre de Places : </b></font>
                
                <asp:Label ID="nbrPlacesLabel" runat="server" Text='<%# Eval("NbrPlaces_event") %>' />
                <br />
                <br />
                <font color="#f3961b"><b>Description:</b></font>
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("Desc_event") %>' />
                <br />
                <br />
                <font color="#f3961b"><b>Prix:</b></font>
                <asp:Label ID="Label1" runat="server" 
                    Text='<%# Eval("Prix_event") %>' />
                <br />
                <br />
                <font color="#f3961b"><b>Participants:</b></font>
                <asp:Label ID="prixLabel" runat="server" Text='<%# Eval("NbrParticipants_event") %> ' />
                <br />
                <br />                
            </ItemTemplate>
    </asp:DataList>
    </div>
</div>
</asp:Content>
