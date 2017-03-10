<%@ Page Language="C#" MasterPageFile="~/Administrateur/Admin.Master" AutoEventWireup="true" CodeBehind="Enseignants_Ajout.aspx.cs" Inherits="Suivi.Administrateur.WebForm4" Title="Page sans titre" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Ajouter un enseignant
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Ajouter un enseignant
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="test" runat="server">
    <center>
     <div class="profs">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        oncreatinguser="CreateUserWizard1_CreatingUser" 
            oncreateduser="CreateUserWizard1_CreatedUser" LoginCreatedUser="false">
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                Text="Suivant" />
        </StartNavigationTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <table border="0" style="font-family:Verdana;font-size:100%;">
                        <tr>
                            <td align="center" colspan="2" 
                                style="color:White;background-color:#5D7B9D;font-weight:bold;">
                                Ajouter un enseingnant</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblCIN" runat="server" AssociatedControlID="txtCin">Numéro CIN :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCin" runat="server" MaxLength="8"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtCin" ErrorMessage="Un nom d'utilisateur est requis." 
                                    ToolTip="Un nom d'utilisateur est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Le Numéro de CIN doit être composé de 8 chiffres."
                                    ControlToValidate="txtCin" Type="Integer" Operator="DataTypeCheck" ValidationGroup="CreateUserWizard1" ToolTip="Le Numéro de CIN doit être composé de 8 chiffres.">*</asp:CompareValidator>
                                          
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nom 
                                d&#39;utilisateur&nbsp;:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="Un nom d'utilisateur est requis." 
                                    ToolTip="Un nom d'utilisateur est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblNom" runat="server" AssociatedControlID="txtNom">Nom 
                               :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNom" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtNom" ErrorMessage="Un nom est requis." 
                                    ToolTip="Un nom est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblPrenom" runat="server" AssociatedControlID="txtPrenom">Prénom:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPrenom" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtPrenom" ErrorMessage="Un prénom est requis." 
                                    ToolTip="Un nom est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mot 
                                de passe&nbsp;:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Un mot de passe est requis." 
                                    ToolTip="Un mot de passe est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Confirmer le mot de passe&nbsp;:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="La confirmation du mot de passe est requise." 
                                    ToolTip="La confirmation du mot de passe est requise." 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Adresse de 
                                messagerie&nbsp;:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="Une adresse de messagerie est requise." 
                                    ToolTip="Une adresse de messagerie est requise." 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Question 
                                de sécurité&nbsp;:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" 
                                    ErrorMessage="Une question de sécurité est requise." 
                                    ToolTip="Une question de sécurité est requise." 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Réponse 
                                de sécurité&nbsp;:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="Une réponse de sécurité est requise." 
                                    ToolTip="Une réponse de sécurité est requise." 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblNumTel" runat="server" AssociatedControlID="txtNumTel">Numéro de Téléphone:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNumTel" runat="server" MaxLength="8"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtNumTel" ErrorMessage="Un numéro de téléphone est requis." 
                                    ToolTip="Un numéro de téléphone est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Le Numéro de Téléphone doit être composé de 8 chiffres."
                                    ControlToValidate="txtNumTel" Type="Integer" Operator="DataTypeCheck" ValidationGroup="CreateUserWizard1" ToolTip="Le Numéro de Téléphone doit être composé de 8 chiffres.">*</asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblPhot" runat="server" AssociatedControlID="photo">Photo :</asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="photo" runat="server" />
                                <asp:RequiredFieldValidator ID="reqPhoto" runat="server" ErrorMessage="Photo Obligatoire" ControlToValidate="photo" ToolTip="Vous n'avez pas Sélectionné une Photo" ValidationGroup="CreateUserWizard1" >*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="Le mot de passe et le mot de passe de confirmation doivent correspondre." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                <asp:Label ID="lblCheck" runat="server" Text="" ForeColor=Red></asp:Label>    
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <CustomNavigationTemplate>
                    <table border="0" cellspacing="5" style="width:100%;height:100%;">
                        <tr align="right">
                            <td align="right" colspan="0">
                                <asp:Button ID="StepNextButton" runat="server" BackColor="#FFFBFF" 
                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                                    CommandName="MoveNext" Font-Names="Verdana" ForeColor="#284775" 
                                    Text="Créer un enseignant" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
</center>
</asp:Content>
