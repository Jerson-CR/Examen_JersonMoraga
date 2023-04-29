<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="P.aspx.cs" Inherits="Examen_JersonMoraga.P" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Login_Usuario" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Login_Usuario" HeaderText="Login_Usuario" ReadOnly="True" SortExpression="Login_Usuario" />
                    <asp:BoundField DataField="Clave_Usuario" HeaderText="Clave_Usuario" SortExpression="Clave_Usuario" />
                    <asp:BoundField DataField="Nombre_Usuario" HeaderText="Nombre_Usuario" SortExpression="Nombre_Usuario" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VeterinariaConnectionString1 %>" DeleteCommand="DELETE FROM [Mae_Usuarios] WHERE [Login_Usuario] = @Login_Usuario" InsertCommand="INSERT INTO [Mae_Usuarios] ([Login_Usuario], [Clave_Usuario], [Nombre_Usuario]) VALUES (@Login_Usuario, @Clave_Usuario, @Nombre_Usuario)" ProviderName="<%$ ConnectionStrings:VeterinariaConnectionString1.ProviderName %>" SelectCommand="SELECT [Login_Usuario], [Clave_Usuario], [Nombre_Usuario] FROM [Mae_Usuarios]" UpdateCommand="UPDATE [Mae_Usuarios] SET [Clave_Usuario] = @Clave_Usuario, [Nombre_Usuario] = @Nombre_Usuario WHERE [Login_Usuario] = @Login_Usuario">
                <DeleteParameters>
                    <asp:Parameter Name="Login_Usuario" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Login_Usuario" Type="String" />
                    <asp:Parameter Name="Clave_Usuario" Type="String" />
                    <asp:Parameter Name="Nombre_Usuario" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Clave_Usuario" Type="String" />
                    <asp:Parameter Name="Nombre_Usuario" Type="String" />
                    <asp:Parameter Name="Login_Usuario" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
