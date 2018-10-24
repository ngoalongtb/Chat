<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DangNhap.ascx.cs" Inherits="Control_DangNhap" %>

<h1>&raquo; Đăng Nhập</h1>
<center>
<table width="850px" runat="server" id="tblDangKy">    
    <tr><td colspan="3" style="font-weight:bold; text-align:center;"><asp:Literal runat="server" ID="litErr"></asp:Literal></td></tr>
    <tr>
        <td align="left" width="150px">Tên Đăng Nhập:</td>
        <td align="left" width="500px"><asp:TextBox ID="txtTen" runat="server" Width="450px"></asp:TextBox></td>
        <td align="left" width="200px"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Cần nhập đủ" ControlToValidate="txtTen"></asp:RequiredFieldValidator></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>
    <tr>
        <td align="left">Mật khẩu:</td>
        <td align="left"><asp:TextBox ID="txtMK" runat="server" Width="450px" TextMode="Password"></asp:TextBox></td>
        <td align="left"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Cần nhập đủ" ControlToValidate="txtMK"></asp:RequiredFieldValidator></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>    
    <tr><td colspan="3" align="center"><asp:Button ID="btnConfirm" runat="server" 
            Text="Đăng nhập" onclick="btnConfirm_Click" /></td></tr>
    <tr><td colspan="3" height="10px"></td></tr>    
    <tr><td colspan="3" align="center">Nếu chưa có tài khoản, bạn có thể <a href="Default.aspx?Function=DangKy"><u>đăng ký!</u></a></td></tr>    
</table>
</center>