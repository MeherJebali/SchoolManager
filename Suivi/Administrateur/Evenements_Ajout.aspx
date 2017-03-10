<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Evenements_Ajout.aspx.cs" Inherits="Suivi.Administrateur.WebForm20" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    Ajouter un évènement
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Ajouter un évènement
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
<center>
<div class="profs">
<table width=500px style="font-family:Verdana;font-size:100%;" cellspacing=5>
    <tr align=center>
    <td colspan="2" style="color:White;background-color:#5D7B9D;font-weight:bold;">Ajouter un évènement     </td>
    </tr>
    <tr>
        <td align="right"><b>Nom : </b></td>
        <td>
            <asp:TextBox ID="txtEvent" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rq1" runat="server" ErrorMessage="Obligatoire" ControlToValidate="txtEvent" ToolTip="Le Titre est requis">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right"><b>Détails : </b></td>
        <td>
            <asp:TextBox ID="txtDetails" runat="server" Height="74px" TextMode="MultiLine" 
                Width="250px" MaxLength="500" style="resize:none"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rq2" runat="server" ErrorMessage="Obligatoire" ControlToValidate="txtDetails" ToolTip="Veuillez Saisir les détails">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right"><b>Prix : </b></td>
        <td>
            <asp:TextBox ID="txtPrix" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ReqPrix" runat="server" ErrorMessage="Obligatoire" ControlToValidate="txtPrix" ToolTip="Le Prix est requis">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="comPrix" runat="server" ErrorMessage="Format" ToolTip="Le Prix doit être de type Réel" Type="Double" Operator="DataTypeCheck" ControlToValidate="txtPrix">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td align="right"><b>Affiche : </b></td>
        <td>
            <asp:FileUpload ID="photo" runat="server" Width="250px"/>
            <asp:RequiredFieldValidator ID="rqPic" runat="server" ErrorMessage="Photo obligatoire" ToolTip="Vous n'avez pas Sélectionné une Photo" ControlToValidate="photo">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="right"><b>Quand : </b></td>
        <td>
            <asp:TextBox ID="txtDate" runat="server" Width="250px" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="req3" runat="server" ErrorMessage="obligatoire" ControlToValidate="txtDate" ToolTip="La date de l'événèment est requise">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="comDate" runat="server" ErrorMessage="Format incorrect" ControlToValidate="txtDate" Type=Date Operator=DataTypeCheck ToolTip="Vérifier le format de la date">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td align="right"><b>Nombre de places : </b></td>
        <td>
            <asp:TextBox ID="txtNombres" runat="server" Width="250px" MaxLength="3"></asp:TextBox>
            <asp:RequiredFieldValidator ID="req4" runat="server" ErrorMessage="Nombre obligatoire" ControlToValidate="txtNombres" ToolTip="Le Nombre de place est requis">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="comNbr" runat="server" ErrorMessage="Le nombre de place doit être de type Entier." ControlToValidate="txtNombres" Type="Integer" Operator="DataTypeCheck" ToolTip="Le nombre de place doit être de type Entier.">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
        <br /><br />
            <asp:Button ID="btnAddEvent" runat="server" Text="Ajouter un évènement" 
                onclick="btnAddEvent_Click" />
        </td>
    </tr>
</table>
</div>
</center>
</asp:Content>
