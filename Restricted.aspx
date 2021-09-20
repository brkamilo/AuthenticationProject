<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Restricted.aspx.cs" Inherits="AuthenticationProject.Restricted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
    <link rel="stylesheet" type="text/css" href="Content/Restricted.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divMessage">
        Lo sentimos.<br />
        El usuario actual no tiene permisos para consultar esta página.
    </div>
</asp:Content>
