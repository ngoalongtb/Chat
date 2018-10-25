using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListChat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["p1"] == null)
        {
            string id = Request.QueryString["Id"];
            ThanhVien_ChuDe tv = new ThanhVien_ChuDe();
            tv.MaChuDe = Convert.ToInt32(id);

            rptList.DataSource = tv.DanhSach();
            rptList.DataBind();
        } else
        {
            try
            {
                int maNguoiDung1 = Convert.ToInt32(Request.QueryString["p1"]);
                int maNguoiDung2 = Convert.ToInt32(Request.QueryString["p2"]);
                ChatCaNhan chatCaNhan = new ChatCaNhan(maNguoiDung1, maNguoiDung2);
                DataTable listChat = chatCaNhan.GetData();
                rptList.DataSource = listChat;
                rptList.DataBind();
            }
            catch (Exception)
            {
                
            }
            
        }
        
    }
}