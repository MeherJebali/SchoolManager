<%@ Page Language="C#" MasterPageFile="~/Enseignant/Enseignant.Master" AutoEventWireup="true" CodeBehind="Demandes_Ajout.aspx.cs" Inherits="Suivi.Enseignant.WebForm4" Title="Page sans titre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Ajouter une demande de congé
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Ajouter une demande de congé
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <center>
<div class="profs">
<table width=424px style="font-family:Verdana;font-size:100%;">
    <tr align=center><td colspan="2" style="color:White;background-color:#5D7B9D;font-weight:bold;">Ajouter une demande de congé</td></tr>
    <tr>
        <td align=right><b>Raison : </b></td>
        <td>
            <asp:DropDownList ID="Raisons" runat="server" Width="245px">
                <asp:ListItem>Maladie</asp:ListItem>
                <asp:ListItem>Maternité</asp:ListItem>
                <asp:ListItem>Annuel</asp:ListItem>
                <asp:ListItem>Sans Solde</asp:ListItem>
                <asp:ListItem>Autre</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align=right><b>Durée : </b></td>
        <td>
            <asp:TextBox ID="txtDuree" runat="server" Width="244px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqDuree" runat="server" ErrorMessage="obligatoire champ" ControlToValidate="txtDuree" ToolTip="La Durée est requise">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="compDuree" runat="server" ErrorMessage="Format incorrect" ControlToValidate="txtDuree" Type="Integer" Operator="DataTypeCheck" ToolTip="La durée est indiqué par nombre de jours">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td align=right><b>Date Début : </b></td>
        <td>
            <asp:Calendar ID="Calendar" runat="server" BackColor="White" 
                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                Width="245px" ondayrender="Calendar_DayRender">
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <WeekendDayStyle BackColor="#FFFFCC" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            </asp:Calendar>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ErrorMessage="la date est requise" ToolTip="La date est requise" 
                onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
        </td>
    </tr>
    <tr align="center">
    <td colspan="2">
        <asp:Button ID="BtnAjouter" runat="server" Text="Ajouter la demande" 
            onclick="BtnAjouter_Click" /></td>
    </tr>
    </table>
</div>
</center>
</asp:Content>
