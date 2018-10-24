<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuaThanhVien.ascx.cs" Inherits="Control_SuaThanhVien" %>


<h1>&raquo; Sửa thông tin Thành Viên</h1>
<center>
<table width="850px" runat="server" id="tblDangKy">    
    <tr><td colspan="3" style="font-weight:bold; text-align:center;"><asp:Literal runat="server" ID="litErr"></asp:Literal></td></tr>
    <tr>
        <td align="left" width="150px">Tên Đăng Nhập:</td>
        <td align="left" width="500px"><asp:TextBox ID="txtTen" runat="server" Width="450px" Enabled="false"></asp:TextBox></td>
        <td align="left" width="200px"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Cần nhập đủ" ControlToValidate="txtTen"></asp:RequiredFieldValidator></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>
    <tr>
        <td align="left">Mật khẩu:</td>
        <td align="left"><asp:TextBox ID="txtMK" runat="server" Width="450px" TextMode="Password"></asp:TextBox></td>
        <td align="left"></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>
    <tr>
        <td align="left">Nhập lại Mật khẩu:</td>
        <td align="left"><asp:TextBox ID="txtMKRe" runat="server" Width="450px" TextMode="Password"></asp:TextBox></td>
        <td align="left"><asp:CompareValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Mật khẩu nhập lại không đúng" ControlToValidate="txtMKRe" ControlToCompare="txtMK"></asp:CompareValidator></td>
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
    <tr>
        <td align="left">Quyền:</td>
        <td align="left">
            <asp:DropDownList ID="ddlQuyen" runat="server">
                <asp:ListItem Text="Quản trị" Value="1"></asp:ListItem>
                <asp:ListItem Text="Bình thường" Value="0"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td></td>
    </tr>
    <tr><td colspan="3" height="10px"></td></tr>
    <tr><td colspan="3" align="center"><asp:Button ID="btnConfirm" runat="server" 
            Text="Sửa thông tin thành viên" onclick="btnConfirm_Click" /></td></tr>
</table>
</center>

