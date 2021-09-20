<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="AuthenticationProject.CreateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link rel="stylesheet" type="text/css" href="Content/Login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="*" ControlToValidate="TextBoxName"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Login"></asp:Label>
    <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLogin" runat="server" ErrorMessage="*" ControlToValidate="TextBoxLogin"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="TextBoxPassword" runat="server" CausesValidation="True" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="*" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Dirección"></asp:Label>
    <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ErrorMessage="*" ControlToValidate="TextBoxAddress"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Teléfono"></asp:Label>
    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ErrorMessage="*" ControlToValidate="TextBoxPhone"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="*" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Edad"></asp:Label>
    <asp:TextBox ID="TextBoxAge" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ErrorMessage="*" ControlToValidate="TextBoxAge"></asp:RequiredFieldValidator>
    <br />
    <asp:DropDownList ID="DropDownListRole" runat="server" >
    </asp:DropDownList>
    <br />
    <asp:Button ID="ButtonCreate" runat="server" Text="Crear" OnClick="ButtonCreate_Click" />
    <div id="divMessage">
        <asp:Label ID="lblMessage" runat="server" CssClass="lblMessage"></asp:Label>
    </div>
</asp:Content>
