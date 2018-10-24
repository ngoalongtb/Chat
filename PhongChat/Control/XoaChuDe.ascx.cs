using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_XoaChuDe : System.Web.UI.UserControl
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

        string Id = Request.QueryString["Id"];

        try
        {
            ChuDe c = new ChuDe();
            c.MaChuDe = Convert.ToInt32(Id);
            c.XoaChuDe();
            Response.Redirect("Default.aspx?Function=QuanLyChuDe");
        }
        catch
        { }
    }
}