using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_ThanhVien : System.Web.UI.UserControl
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

        if (!Page.IsPostBack)
        {
            if (P == null)
            {
                P = "1";
            }

            foreach (ListItem lt in ddlQuyen.Items)
            {
                if (lt.Value == P)
                {
                    lt.Selected = true;
                }
            }

            NguoiDung tv = new NguoiDung();
            tv.Quyen = Convert.ToInt32(ddlQuyen.SelectedItem.Value);
            rptData.DataSource = tv.DanhSachNguoiDung();
            rptData.DataBind();
        }
    }
    protected void ddlQuyen_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?Function=ThanhVien&P="+ddlQuyen.SelectedItem.Value);
    }
}