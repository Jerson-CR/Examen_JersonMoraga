<%@ Page Title="" Language="C#" MasterPageFile="~/Menuprincipal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Examen_JersonMoraga.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
<asp:GridView ID="GridView1" runat="server">
</asp:GridView>
<br />
Usuario<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<br />
<br />
Clave del Usuario
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
<br />
<br />
Nombre del Usuario<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
<br />
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Borrar" />
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Refrescar" />
</asp:Content>
