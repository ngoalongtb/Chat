<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChatCaNhan.ascx.cs" Inherits="Control_ChatCaNhan" %>
<script type="text/javascript">
    $(document).ready(
        function () {
            
            var p1 = $("#ctl03_p1").val();
            var p2 = $("#ctl03_p2").val();
            
            var user = $("#ctl03_user").val();

            $("#btnChat").click(function () {
                console.log('everything ok');
                var message = $("#ctl03_message").val();

                var truyendulieu = "ChatCaNhanPage.aspx?p1=" + p1 + "&p2=" + p2 + "&user=" + user + "&message=" + message;

                $.ajax(
                    {
                        type: "POST",
                        url: truyendulieu
                    }
                );
                console.log('everything ok 2');
            }); 
            
            var url1 = "ListChat.aspx?p1=" + p1 + "&p2=" + p2;

            setInterval(function () {
                $('#listChat').load(url1).fadeIn("slow");
            }, 1000);

        }
    );
</script>
<h1>&raquo; Chat cá nhân </h1>

<table width="990px" align="left">
    <tr>
        <td width="700px" valign="top" style="border:2px solid #FF9900; padding:5px; height:400px; overflow:scroll;">
            <b>Chat cá nhân</b>
            <div id="listChat" style="margin:10px 0px;">
                <asp:Repeater ID="rptList" runat="server">
                    <ItemTemplate>
                        <b><%# Eval("TaiKhoanNguoiDung") %></b>: <%# Eval("NoiDungChat") %> <br />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </td>
        <td valign="top"  style="border:2px solid #FF9900; padding:5px; height:400px; overflow:scroll;">
            <b>Danh sách người chat: </b>
            <div>
                <b><asp:Label ID="lblTenNguoiChat1" runat="server" Text="Label"></asp:Label></b> <br />
                <b><asp:Label ID="lblTenNguoiChat2" runat="server" Text="Label"></asp:Label></b> <br />
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="border:2px solid #FF9900; padding:5px;" valign="top">
            Nội dung chat: <br />
            <asp:TextBox ID="message" runat="server" Width="980px" Height="50px" TextMode="MultiLine"></asp:TextBox>
            <asp:Literal ID="enter" runat="server"></asp:Literal><br />
            
            
            <input type="button" value="Gửi nội dung" id="btnChat" />
            <span style="display:none;">
                <asp:TextBox ID="p1" runat="server"></asp:TextBox>
                <asp:TextBox ID="p2" runat="server"></asp:TextBox>
                <asp:TextBox ID="user" runat="server"></asp:TextBox>
            </span>
        </td>
    </tr>
</table>