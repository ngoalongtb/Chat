using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Control_SuaThanhVien : System.Web.UI.UserControl
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

        if (!Page.IsPostBack)
        {
            NguoiDung tv = new NguoiDung();
            tv.MaNguoiDung = Convert.ToInt32(Id);
            DataRow dr = tv.ChiTietNguoiDung();
            txtEmail.Text = dr["Email"].ToString();
            txtTen.Text = dr["TaiKhoanNguoiDung"].ToString();
           

            //if (dr["gioitinh"].ToString() == "1")
            //{
            //    radnam.checked = true;
            //}
            //else
            //{ 
            //    radnu.checked = false;
            //}

            foreach (ListItem lt in ddlQuyen.Items)
            { 
                if(lt.Value == dr["Quyen"].ToString())
                {
                    lt.Selected = true;
                }
            }
        }
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        string Id = Request.QueryString["Id"];

        try
        {

            //int gt = 1;
            //if(radnam.checked == false)
            //    {gt = 0;}

            NguoiDung tv = new NguoiDung();
            tv.MaNguoiDung = Convert.ToInt32(Id);
            tv.Email = txtEmail.Text;
            tv.Quyen = Convert.ToInt32(ddlQuyen.SelectedItem.Value);
            //tv.gioiinh = gt;

            tv.SuaThongTin();



            if (txtMK.Text != "")
            {
                tv.MatKhau = txtMK.Text;
                tv.ThayMatKhau();
            }

            litErr.Text = "Thay đổi thông tin thành công!";
        }
        catch
        {
            litErr.Text = "Thay đổi thông tin không thành công!";
        }
    }
}
