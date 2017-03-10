<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Parents.aspx.cs" Inherits="Suivi.Administrateur.WebForm6" Title="Page sans titre" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Les parents
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Les parents
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="test" runat="server">
<div id="recherche">
    <asp:TextBox ID="txtSearch" runat="server" 
        ontextchanged="txtSearch_TextChanged" AutoPostBack="true" Width="167px" 
        BorderWidth=0px Height="26px"></asp:TextBox>
    </div>
 <br />  
<center>
    <div class="profs">
     <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" HorizontalAlign="Center" BorderColor="#14327B">
        <ItemTemplate>
            <table border="2" rules=none BorderColor="#808080">
                <tr>
                    <td colspan="2">
                        <asp:Image ID="photo" runat="server" ImageURL='<%# Eval("Photo_parent") %>'  Width="200px" Height="150px" />
                    </td>
                </tr>
                <tr>
                    <td   class="detail_photo" width="25px" height="25">
                    </td>
                    <td>
                         <asp:Label ID="lblNom" runat="server" Text='<%# Eval("Prenom_parent") %>' Font-Bold="True"></asp:Label>
                         <asp:Label ID="lblPrenom" runat="server" Text='<%# Eval("Nom_parent") %>' Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td   class="detail_email" width="25px" height="25">
                    </td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email_parent") %>' Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td   class="detail_phone" width="25px" height="25">
                    </td>
                    <td>
                        <asp:Label ID="lblTel" runat="server" Text='<%# Eval("Tel_parent") %>' Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList> 
        <asp:Panel ID="Panel1" runat="server">
        
	<table>
      <tr>
        <td>
            <asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="<<" Height="31px" 
                        Width="43px" onclick="btnfirst_Click" /></td>
        <td>
        <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="<" Height="31px" 
                        Width="43px" onclick="btnprevious_Click" />
                        </td>
        <td>
                    <asp:Button ID="btnnext" runat="server" Font-Bold="true" Text=">" Height="31px" 
                        Width="43px" onclick="btnnext_Click" /></td>
        <td>
                        <asp:Button ID="btnlast" runat="server" Font-Bold="true" Text=">>" Height="31px" 
                        Width="43px" onclick="btnlast_Click" /></td>
      </tr>
    </table>
    </asp:Panel>
    </div>
</center>    
</asp:Content>
