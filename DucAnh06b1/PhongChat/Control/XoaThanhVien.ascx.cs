using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_XoaThanhVien : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Quyen"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            if (Session["Quyen"].ToString() != "1")
            {
                Response.Redirect("Default.aspx");
            }
        }

        string P = Request.QueryString["P"];
        string Id = Request.QueryString["Id"];

        try
        {
            NguoiDung tv = new NguoiDung();
            tv.MaNguoiDung = Convert.ToInt32(Id);
            tv.XoaNguoiDung();
            Response.Redirect("Default.aspx?Function=ThanhVien&P="+P);
        }
        catch
        { }
    }
}