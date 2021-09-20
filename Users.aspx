<%@ Page Language="C#" Title=""  AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Users.aspx.cs" Inherits="AuthenticationProject.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="HiddenFieldUserId" runat="server" />
    <br />
    <asp:Label ID="LabelName" runat="server" Text="Nombre:"></asp:Label>
    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="LabelRole" runat="server" Text="Role:"></asp:Label>
        <asp:TextBox ID="TextBoxRole" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button_User" runat="server" OnClick="Button_User_Click" Text="Buscar" />
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Crear Usuario</asp:LinkButton>
    <br />
    <asp:DropDownList ID="DropDownListRole" runat="server" Enabled="false" Visible="false">
    </asp:DropDownList>
    <br />
    <asp:GridView ID="GridViewUser" runat="server" OnRowUpdating="GridViewUser_RowUpdating" AutoGenerateColumns="False"
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
        CellPadding="3" DataKeyNames="UserId" GridLines="Vertical"
    OnRowEditing="GridViewUser_RowEditing" OnRowCancelingEdit="GridViewUser_RowCancelingEdit" OnRowDeleting="GridViewUser_RowDeleting">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            <asp:TemplateField HeaderText="User Id" Visible="true">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox" runat="server" Text='<%# Bind("UserId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>                  
                    <asp:Label ID="Label" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" Visible="false">
                <edititemtemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                </edititemtemplate>
            <itemtemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
            </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FullName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Login">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UserLogin") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserLogin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dirección">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Teléfono">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edad">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>                 
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
  

    <br />

      

</asp:Content>

