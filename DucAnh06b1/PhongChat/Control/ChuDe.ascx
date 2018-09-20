<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChuDe.ascx.cs" Inherits="Control_ChuDe" %>

<h1>&raquo; Chủ Đề</h1>

<table width="1000px" align="left">
    <tr style="font-weight:bold;">
        <td width="500px">Chủ Đề</td>
        <td width="250px">Ngày tạo</td>
        <td width="250px">Người tạo</td>
    </tr>
    <asp:Repeater ID="rptData" runat="server">
    <ItemTemplate>    
    <tr><td colspan="3" height="5px"></td></tr>
    <tr>
        <td><a href="Default.aspx?Function=Chat&Id=<%# Eval("MaChuDe")%>"><%# Eval("TenChuDe")%></a></td>
        <td><%# Eval("Ngay") %></td>
        <td><%# Eval("TaiKhoanNguoiDung")%></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
</table>