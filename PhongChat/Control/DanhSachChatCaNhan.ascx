<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSachChatCaNhan.ascx.cs" Inherits="Control_DanhSachChatCaNhan" %>
<h1>&raquo; Danh sách chat cá nhân</h1>

<table width="1000px" align="left">
    <tr style="font-weight:bold;">
        <td width="500px">Thành viên</td>
    </tr>
    <asp:Repeater ID="rptData" runat="server">
    <ItemTemplate>    
    <tr><td colspan="3" height="5px"></td></tr>
    <tr>
        <td><a href="Default.aspx?Function=ChatCaNhan&p1=<%# Eval("MaNguoiDung1")%>&p2=<%# Eval("MaNguoiDung2")%>"><%# Eval("TenNguoiDung")%></a></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
</table>