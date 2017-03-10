<%@ Page Title="" Language="C#" MasterPageFile="~/Enseignant/Enseignant.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="Suivi.Enseignant.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
Message
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
Message
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
<div class="profs">
    <asp:SqlDataSource ID="DSMessage" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
        SelectCommand="SELECT Parent.Prenom_parent + ' ' + Parent.Nom_parent AS Parent, Parent.Photo_parent, Message.Objet_msg, Message.Corps_msg, Message.Categorie_msg FROM Parent INNER JOIN Message ON Parent.CIN_parent = Message.Emetteur_msg WHERE (Message.Recepteur_msg = @cin) AND (Message.ID_msg = @idMsg)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtcin" Name="cin" PropertyName="Text" />
            <asp:QueryStringParameter Name="idMsg" QueryStringField="ID_msg" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="EventDetails">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="DSMessage">
        <ItemTemplate>
            <asp:Image ID="photo" runat="server" ImageURL='<%# Eval("Photo_parent") %>'  Width="70px" Height="70px" />
            <br />
            <br />
            <b><asp:Label ID="ParentLabel" runat="server" Text='<%# Eval("Parent") %>' /></b>
            <br />
            <br />
            <b>Objet :</b>
            <asp:Label ID="Objet_msgLabel" runat="server" Text='<%# Eval("Objet_msg") %>' />
            <br />
            <br />
            <b>Message:</b>
            <asp:Label ID="Corps_msgLabel" runat="server" Text='<%# Eval("Corps_msg") %>' />
            <br />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    </div>
</div>
    <asp:TextBox ID="txtcin" runat="server" Visible="false"></asp:TextBox>
</asp:Content>
