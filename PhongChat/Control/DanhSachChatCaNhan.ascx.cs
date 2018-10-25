using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_DanhSachChatCaNhan : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            NguoiDung c = new NguoiDung();
            int currentUserId = (int)Session["MaNguoiDung"];
            DataTable danhSachChat = c.DanhSachChat(currentUserId);
            rptData.DataSource = danhSachChat;
            rptData.DataBind();
        }
    }
}