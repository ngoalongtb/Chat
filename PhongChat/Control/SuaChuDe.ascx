<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuaChuDe.ascx.cs" Inherits="Control_SuaChuDe" %>


<h1>&raquo; Sửa Chủ Đề</h1>
<center>
<table width="850px">    
    <tr><td colspan="3" style="font-weight:bold; text-align:center;"><asp:Literal runat="server" ID="litErr"></asp:Literal></td></tr>
    <tr>
        <td align="left" width="150px">Tên Chủ Đề:</td>
        <td align="left" width="500px"><asp:TextBox ID="txtTen" runat="server" Width="450px"></asp:TextBox></td>
        <td align="left" width="200px"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Cần nhập đủ" ControlToValidate="txtTen"></asp:RequiredFieldValidator></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>    
    <tr><td colspan="3" align="center"><asp:Button ID="btnConfirm" runat="server" 
            Text="Sửa chủ đề" onclick="btnConfirm_Click" /></td></tr>
</table>
</center>