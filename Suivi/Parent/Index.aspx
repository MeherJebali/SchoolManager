<%@ Page Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Suivi.Parent.WebForm1" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Accueil
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Accueil
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<div id="raccourci">
			<div class="btn">
			<a href="Messages.aspx">
				<img src="../img/msgBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbMsg" runat="server" Text=""></asp:Label> Message(s)</b></p>
			</a>
			</div>
			<div class="btn">
				<a href="Evenements.aspx">
				<img src="../img/eventBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbEvent" runat="server" Text=""></asp:Label> évènement(s)</b></p>
			</a>
			</div>
			<div class="btn">
			<a href="Demandes.aspx">
				<img src="../img/congeBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbConge" runat="server" Text="Label"></asp:Label> Demande(s) Congé</b></p>
			</a>
			</div>
			<div class="btn">
			<a href="Parents.aspx">
				<img src="../img/parentBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbParent" runat="server" Text="Label"></asp:Label> Parent(s)</b></p>
			</a>
			</div>
			<div class="btn">
			<a href="Enseignants.aspx">
				<img src="../img/ensBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbEns" runat="server" Text="Label"></asp:Label> Enseignant(s)</b></p>
			</a>
			</div>
			<div class="btn">
			<a href="Eleves.aspx">
				<img src="../img/eleveBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbEleve" runat="server" Text="Label"></asp:Label> Élève(s)</b></p>
			</a>
			</div>
			<div class="btn">
				<a href="Classes.aspx">
				<img src="../img/classBtn.png"/>
				<p><b><asp:Label ID="lblNbClasse" runat="server" Text=""></asp:Label> Classe(s)</b></p>
			</a>
			</div>
			<div class="btn">
			<a href="Matieres.aspx">
				<img src="../img/matBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbMatiere" runat="server" Text="Label"></asp:Label> Matière(s)</b></p>
			</a>
			</div>
			<div class="btn">
			<a href="Paiements.aspx">
				<img src="../img/payBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbPaiement" runat="server" Text="Label"></asp:Label> Paiement(s)</b></p>
			</a>
			</div>
			
		</div>
</asp:Content>
