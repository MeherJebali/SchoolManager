<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Suivi.Administrateur.WebForm1" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Accueil
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    Accueil
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="test" runat="server">
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
			<div class="btn">
			<a href="Services.aspx">
				<img src="../img/servBtn.png"/>
				<p><b>
                    <asp:Label ID="lblNbService" runat="server" Text="Label"></asp:Label> service(s)</b></p>
			</a>
			</div>
                    <asp:SqlDataSource ID="DSNiveau" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT COUNT(Eleve.ID_eleve) AS NbrEleve, Classe.Niveau FROM Eleve INNER JOIN Classe ON Eleve.ID_classe = Classe.ID_classe GROUP BY Classe.Niveau"></asp:SqlDataSource>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="DSNiveau" Width="465px">
            <Titles>
               <asp:Title Text="Pourcentage des élèves par niveau" Font=" Trebuchet MS, 16pt, style=bold"></asp:Title>
            </Titles>
            <Series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="Niveau" 
                    YValueMembers="NbrEleve" YValuesPerPoint="2" IsValueShownAsLabel="true" 
                    YValueType="Auto" Palette="None">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
            <asp:Legend LegendStyle="Column" Title="Niveau ">
                <Position Height="30" Width="12" Y="35" X="90" />
            </asp:Legend>
            </Legends>
        </asp:Chart>
         <asp:SqlDataSource ID="DSSexe" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Cnxion %>" 
            SelectCommand="SELECT COUNT(*) AS Sexe, Sexe_eleve FROM Eleve GROUP BY Sexe_eleve"></asp:SqlDataSource>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="DSSexe" 
            Palette="None" PaletteCustomColors="Red; DodgerBlue" Width="394px" 
                Height="314px">
            <Titles>
               <asp:Title Text="Répartition des élève selon le sexe" Font=" Trebuchet MS, 16pt, style=bold"></asp:Title>
            </Titles>
            <Series>
                <asp:Series Name="Series1" ChartType="Doughnut" XValueMember="Sexe_eleve" 
                    YValueMembers="Sexe">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
             <Legends>
            <asp:Legend LegendStyle="Column" Title="Sexe " LegendItemOrder="SameAsSeriesOrder">
                <Position Height="30" Width="12" Y="35" X="90" />
            </asp:Legend>
            </Legends>
        </asp:Chart>
        <br />
                <asp:Chart ID="Chart3" runat="server" Width="608px">
            <Titles>
               <asp:Title Text="Les absences pour les 7 derniers jours" Font=" Trebuchet MS, 16pt, style=bold"></asp:Title>
            </Titles>
            <Series>
                <asp:Series Name="Series1">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
		</div>
</asp:Content>


