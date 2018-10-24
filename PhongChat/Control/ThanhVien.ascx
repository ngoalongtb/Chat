<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThanhVien.ascx.cs" Inherits="Control_ThanhVien" %>

<h1>&raquo; Danh sách Thành viên</h1>

<table width="1000px" align="left">
    <tr>
        <td colspan="4">Lựa chọn nhóm thành viên: 
            <asp:DropDownList ID="ddlQuyen" runat="server" 
                ontextchanged="ddlQuyen_TextChanged" AutoPostBack="true">
                <asp:ListItem Text="Quản trị" Value="1"></asp:ListItem>
                <asp:ListItem Text="Bình thường" Value="0"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr><td colspan="4" height="5px"></td></tr>
    <tr style="font-weight:bold;">
        <td width="250px">Tên thành viên</td>
        <td width="250px">Ngày đăng ký</td>
        <td width="250px">Sửa thông tin</td>
        <td width="250px">Xóa thành viên</td>
    </tr>
    <asp:Repeater ID="rptData" runat="server">
    <ItemTemplate>    
    <tr><td colspan="4" height="5px"></td></tr>
    <tr>
        <td><%# Eval("TaiKhoanNguoiDung")%></td>
        <td><%# Eval("Ngay") %></td>
        <td><a href="Default.aspx?Function=SuaThanhVien&Id=<%# Eval("MaNguoiDung") %>">Sửa</a> </td>
        <td><a href="Default.aspx?Function=XoaThanhVien&Id=<%# Eval("MaNguoiDung") %>&P=<%# Eval("Quyen") %>" onclick="return confirm('Xóa thành viên này?');">Xóa</a></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
</table>
<center><asp:Literal ID="literr" runat="server"></asp:Literal></center>