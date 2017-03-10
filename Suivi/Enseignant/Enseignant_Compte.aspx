<%@ Page Language="C#" MasterPageFile="~/Enseignant/Enseignant.Master" AutoEventWireup="true" CodeBehind="Enseignant_Compte.aspx.cs" Inherits="Suivi.Enseignant.WebForm2" Title="Page sans titre" %>
<%@ Register Assembly="ASP.Web.UI.PopupControl" Namespace="ASP.Web.UI.PopupControl" TagPrefix="ASPP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titre" runat="server">
    Compte Enseignant
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Votre compte
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="test" runat="server">
    <div class="profs">
    <asp:SqlDataSource ID="DSDetailsEns" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cnxion %>" >
    </asp:SqlDataSource>
    <br />
    <div id="EventDetails">
    <asp:DataList ID="DsInfo" runat="server" DataSourceID="DSDetailsEns">
    <ItemTemplate>
        <ItemTemplate>
                <font color="#14327c"><h2><asp:Label ID="lblTitre" runat="server" 
                    Text='<%# Eval("NomP") %>' /></h2></font>
                <br />
                <asp:Image ID="Image1" runat="server" ImageURL='<%# Eval("Photo_ens") %>'                                  Width="320px" Height="220px" />
                <br />
                <br />
                <font color="#f3961b"><b>Nom d'utilisateur :</b></font>
                <asp:Label ID="descriptionLabel" runat="server" 
                    Text='<%# Eval("Username_ens") %>' />
                <br />
                <br />
                <font color="#f3961b"><b>Numéro de CIN :</b></font>
                <asp:Label ID="prixLabel" runat="server" Text='<%# Eval("CIN_ens") %> ' />
                <br />
                <br /> 
                <font color="#f3961b"><b>Numéro de Téléphone : </b></font>
                <asp:Label ID="formatDate" runat="server" Text='<%# Eval("Tel_ens") %>'></asp:Label>
                <br />
                <br />
                <font color="#f3961b"><b>Adresse Email : </b></font>
                
                <asp:Label ID="nbrPlacesLabel" runat="server" Text='<%# Eval("Email_ens") %>' />              
            </ItemTemplate>
    </ItemTemplate>
    </asp:DataList>
    <br />
    <br />
    <br />
    <asp:LinkButton ID="changePass" runat="server" onclick="changePass_Click" Font-Underline=true>Changer le Mot de Passe</asp:LinkButton> || 
    <asp:LinkButton ID="EditInfo" runat="server" Font-Underline=true 
            onclick="EditInfo_Click">Editer Les Infos</asp:LinkButton>
    <aspp:popuppanel HeaderText="Changer Le Mot de passe" ID="pup1" runat="server" 
        Width=400px>
            <PopupWindow runat="server" >
                <ASPP:PopupWindow ID="PopupWindow1" Visible="true" runat="server">
                    <asp:ChangePassword ID="ChangePassword1" runat="server">
                    </asp:ChangePassword>
                </ASPP:PopupWindow>
            </PopupWindow>
        </aspp:popuppanel>
        <aspp:popuppanel HeaderText="Changer Les Informations" ID="pup2" runat="server" 
        Width=400px>
            <PopupWindow runat="server">
                <ASPP:PopupWindow ID="PopupWindow2" Visible="true" runat="server">
                <table>
                <tr>
                    <td align=right><b>Nom : </b></td>
                    <td>
                        <asp:TextBox ID="txtNom" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1" runat="server" ErrorMessage="obligatoire" ControlToValidate="txtNom" ToolTip="Le Nom est requis">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align=right><b>Prenom : </b></td>
                    <td>
                        <asp:TextBox ID="txtPrenom" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req2" runat="server" ErrorMessage="obligatoire" ControlToValidate="txtPrenom" ToolTip="Le Prenom est requis">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align=right><b>Numéro Téléphone : </b></td>
                    <td>
                        <asp:TextBox ID="txtNumTel" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Req3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNumTel" ToolTip="Le numéro de téléphone est requis">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="compTel" runat="server" ErrorMessage="format incorrect" ControlToValidate="txtNumTel" Type="Integer" Operator="DataTypeCheck" ToolTip="Le Format de numéro de téléphone est incorrect">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td align=right><b>Adresse Email : </b></td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="req4" runat="server" ErrorMessage="Obligatoire" ToolTip="L'adresse Email est requise" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align=right><b>Photo : </b></td>
                    <td>
                        <asp:FileUpload ID="photo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align=center colspan="2">
                        <asp:Button ID="btnModifier" runat="server" Text="Modifier" OnClick="btnModifier_Click"/>
                    </td>
                </tr>
                </table>
                </ASPP:PopupWindow>
            </PopupWindow>
        </aspp:popuppanel>
    </div>
    
    </div>
    </asp:Content>