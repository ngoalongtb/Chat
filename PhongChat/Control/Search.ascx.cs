using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Control_Search : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyword = Request.QueryString["keyword"];

        if (keyword != null)
        {
            ChuDe c = new ChuDe();
            txtten.Text = c.TenChuDe = keyword.Replace('+',' ');


            DataTable dtbl = c.TimKiem();
            if (dtbl.Rows.Count > 0)
            {
                rptData.DataSource = dtbl;
                rptData.DataBind();
            }
            else
            {
                literr.Text = "";
            }
           
            rptData.DataSource = c.TimKiem();
            rptData.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtten.Text.Trim() != "")
        {
            string keyword = txtten.Text.Trim().Replace(' ', '+');
            Response.Redirect("Default.aspx?Function=Search&keyword=" + keyword);
        }
    }
}