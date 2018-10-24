<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Chat.ascx.cs" Inherits="Control_Chat" %>

<script type="text/javascript">
    $(document).ready(
        function () {
            var machude = $("#ctl03_txtmacd").val();
            var mand = $("#ctl03_txtmand").val();

            $("#btnChat").click(function () {
                var noidung = $("#ctl03_txtChat").val();

                var truyendulieu = "Chat.aspx?noidung=" + noidung + "&mand=" + mand + "&chude=" + machude;

                $.ajax(
                                    {
                                        type: "POST",
                                        url: truyendulieu
                                    }
                                  );
                
            }); 

            var url1 = "ListChat.aspx?Id=" + $("#ctl03_txtmacd").val();
            var url2 = "ListUserChat.aspx?Id=" + $("#ctl03_txtmacd").val();

            setInterval(function () {
                $('#listChat').load(url1).fadeIn("slow");
            }, 1000);

            setInterval(function () {
                $('#listUser').load(url2).fadeIn("slow");
            }, 1000);
        }
    );
function btnChat_onclick() {

}

</script>

<h1>&raquo; Chat </h1>

<table width="990px" align="left">
    <tr>
        <td width="700px" valign="top" style="border:2px solid #FF9900; padding:5px; height:400px; overflow:scroll;">
            <b>Chủ đề: <asp:Literal ID="litChuDe" runat="server"></asp:Literal></b> <asp:Literal ID="litEdit" runat="server"></asp:Literal>
            <div id="listChat" style="margin:10px 0px;">
            </div>
        </td>
        <td valign="top"  style="border:2px solid #FF9900; padding:5px; height:400px; overflow:scroll;">
            <b>Danh sách người chat: </b>
            <div id="listUser" style="margin:10px 0px;">
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="border:2px solid #FF9900; padding:5px;" valign="top">
            Nội dung chat: <br /> <asp:TextBox ID="txtChat" runat="server" Width="980px" Height="50px" TextMode="MultiLine"></asp:TextBox><asp:Literal ID="enter" runat="server"></asp:Literal><br /><input type="button" value="Gửi nội dung" id="btnChat" onclick="return btnChat_onclick()" />
            <span style="display:none;"><asp:TextBox ID="txtmacd" runat="server"></asp:TextBox><asp:TextBox ID="txtmand" runat="server"></asp:TextBox></span>
        </td>
    </tr>
</table>
