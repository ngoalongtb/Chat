using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string function = Request.QueryString["Function"];
        switch (function)
        { 
            case "DangKy":
                phCenter.Controls.Add(Page.LoadControl("~/Control/DangKy.ascx"));
                break;
            case "DangNhap":
                phCenter.Controls.Add(Page.LoadControl("~/Control/DangNhap.ascx"));
                break;
            case "ThayDoiThongTin":
                phCenter.Controls.Add(Page.LoadControl("~/Control/ThayDoiThongTin.ascx"));
                break;
            case "ThayDoiMatKhau":
                phCenter.Controls.Add(Page.LoadControl("~/Control/ThayDoiMatKhau.ascx"));
                break;
            case "ThanhVien":
                phCenter.Controls.Add(Page.LoadControl("~/Control/ThanhVien.ascx"));
                break;
            case "SuaThanhVien":
                phCenter.Controls.Add(Page.LoadControl("~/Control/SuaThanhVien.ascx"));
                break;
            case "XoaThanhVien":
                phCenter.Controls.Add(Page.LoadControl("~/Control/XoaThanhVien.ascx"));
                break;
            case "TaoChuDe":
                phCenter.Controls.Add(Page.LoadControl("~/Control/TaoChuDe.ascx"));
                break;
            case "SuaChuDe":
                phCenter.Controls.Add(Page.LoadControl("~/Control/SuaChuDe.ascx"));
                break;
            case "ChuDe":
                phCenter.Controls.Add(Page.LoadControl("~/Control/ChuDe.ascx"));
                break;
            case "QuanLyChuDe":
                phCenter.Controls.Add(Page.LoadControl("~/Control/QuanLyChuDe.ascx"));
                break;
            case "XoaChuDe":
                phCenter.Controls.Add(Page.LoadControl("~/Control/XoaChuDe.ascx"));
                break;
            case "Search":
                phCenter.Controls.Add(Page.LoadControl("~/Control/Search.ascx"));
                break;
            case "Chat":
                phCenter.Controls.Add(Page.LoadControl("~/Control/Chat.ascx"));
                break;
            case "DanhSachChatCaNhan":
                phCenter.Controls.Add(Page.LoadControl("~/Control/DanhSachChatCaNhan.ascx"));
                break;
            case "ChatCaNhan":
                phCenter.Controls.Add(Page.LoadControl("~/Control/ChatCaNhan.ascx"));
                break;
            case "DangXuat":
                Session.Abandon();
                Response.Redirect("Default.aspx");
                break;
            default:
                phCenter.Controls.Add(Page.LoadControl("~/Control/ChuDe.ascx"));
                break;
        }

        if (Session["MaNguoiDung"] != null)
        {
            mnudangky.Visible = false;
            mnudangnhap.Visible = false;
            mnutaochude.Visible = true;
            mnuChatCaNhan.Visible = true;

            SubMenu.Visible = true;
            litName.Text = "<b>" + Session["TaiKhoanNguoiDung"].ToString() + "</b>";
        }

        if (Session["Quyen"] != null)
        {
            if (Session["Quyen"].ToString() == "1")
            {
                mnuthanhvien.Visible = true;
                mnuquanlychude.Visible = true;
            }
        }
    }
}