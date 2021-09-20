<%@ Page Title=""  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AuthenticationProject.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link rel="stylesheet" type="text/css" href="Content/Login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divLogin">       
        <div id="divUser">
            <img src="Images/user.png" alt="" class="imgLogin" />
            <input id="txtUser" type="text" name="txtUser" class="txtLogin" runat="server" />
            <div class="divClear"></div>
        </div>
        <div id="divPwd">
            <img src="Images/pwd.png" alt="" class="imgLogin" />
            <input id="txtPwd" type="password" name="txtPwd" class="txtLogin" runat="server" />
            <div class="divClear"></div>
        </div>   
        <div id="divOpt">
            <input id="btnLogin" type="submit" value="Ingresar" class="btnEnter" runat="server" onserverclick="btnLogin_ServerClick" />
        </div>
        <div id="divMessage">
            <asp:Label ID="lblMessage" runat="server" CssClass="lblMessage"></asp:Label>
        </div>
    </div>
</asp:Content>
