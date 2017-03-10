<%@ Page Language="C#" MasterPageFile="~/Parent/Parent.Master" AutoEventWireup="true" CodeBehind="Evenements_Details.aspx.cs" Inherits="Suivi.Parent.WebForm4" Title="Page sans titre" %>
<%@ Register Assembly="ASP.Web.UI.PopupControl" Namespace="ASP.Web.UI.PopupControl" TagPrefix="ASPP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Détail de l'évènement
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Détail de l'évènement
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
        DataSourceID="DSDetailsEvent" onitemcommand="EventDetails_ItemCommand" 
            onitemcreated="EventDetails_ItemCreated">
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
                 
        <asp:Button ID="btnReserver" runat="server" Text="Réserver" BackColor="#f3961b"  Height="35px" Width="70px" Font-Bold="True" CommandName="reserver"/>             
            </ItemTemplate>
    </asp:DataList>
    <aspp:popuppanel HeaderText="Nombre de places à reserver" ID="pup1" runat="server" 
        Width="300px" OnCloseWindowClick="MycloseWindow">
            <PopupWindow runat="server" >
                <ASPP:PopupWindow ID="PopupWindow1" Visible="true" runat="server">
                    <table width="300px">
                    <tr>
                    <td align=right><b>Nombre de place</b></td>
                    <td>
                        <asp:TextBox ID="txtNbPlaces" runat="server" Text="0"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1" runat="server" ErrorMessage="Champ obligatoire" ControlToValidate="txtNbPlaces" ToolTip="Le Nombre de place est requis">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="comp" runat="server" ErrorMessage="format invalide" ControlToValidate="txtNbPlaces" Type="Integer" Operator="DataTypeCheck" ToolTip="Le Nombre de place foit être de type Entier">*</asp:CompareValidator>
                    </td>
                    </tr>
                    <tr><td colspan="2" align=center>
                        <asp:Button ID="btnConfirmer" runat="server" Text="Confirmer" OnClick="btnConfirmer_Click"/></td></tr>
                    </table>
                </ASPP:PopupWindow>
            </PopupWindow>
    </aspp:popuppanel>
    </div>
</div>
</asp:Content>
