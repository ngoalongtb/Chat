<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DangKy.ascx.cs" Inherits="Control_DangKy" %>

<h1>&raquo; Đăng ký Thành Viên</h1>
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
    <tr>
        <td align="left">Nhập lại Mật khẩu:</td>
        <td align="left"><asp:TextBox ID="txtMKRe" runat="server" Width="450px" TextMode="Password"></asp:TextBox></td>
        <td align="left"><asp:CompareValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Mật khẩu nhập lại không đúng" ControlToValidate="txtMKRe" ControlToCompare="txtMK"></asp:CompareValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtMKRe"></asp:RequiredFieldValidator></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>
    <tr>
        <td align="left">Email:</td>
        <td align="left"><asp:TextBox ID="txtEmail" runat="server" Width="450px"></asp:TextBox></td>
        <td align="left"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                runat="server" ErrorMessage="* Email không đúng dạng" 
                ControlToValidate="txtEmail" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>        
    </tr>
  
    <tr><td colspan="3" height="10px"></td></tr>
    <tr><td colspan="3" align="center"><asp:Button ID="btnConfirm" runat="server" 
            Text="Đăng ký thành viên" onclick="btnConfirm_Click" /></td></tr>
</table>

<table runat="server" id="tblSuccess">
    <tr><td colspan="3" align="center">Đăng ký thành viên thành công! click <a href="Default.aspx"><u>vào đây</u></a> để theo dõi các chủ đề mới nhất.</td></tr>
</table>
</center>

