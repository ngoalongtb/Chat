using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_QuanLyChuDe : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyword = Request.QueryString["keyword"];

        if (keyword != null)
        {
            ChuDe c = new ChuDe();
            txtten.Text = c.TenChuDe = keyword.Replace('+', ' ');
            rptData.DataSource = c.TimKiem();
            rptData.DataBind();
        }
        else
        {
            ChuDe c = new ChuDe();
            rptData.DataSource = c.DanhSachChuDe();
            rptData.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtten.Text.Trim() != "")
        {
            string keyword = txtten.Text.Trim().Replace(' ', '+');
            Response.Redirect("Default.aspx?Function=QuanLyChuDe&keyword=" + keyword);
        }
    }
}