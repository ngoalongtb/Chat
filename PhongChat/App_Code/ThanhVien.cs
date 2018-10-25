using System;
using System.Data;

public class NguoiDung
{
    public int MaNguoiDung, Quyen;
    public string TaiKhoanNguoiDung, MatKhau, Email;

    private SQLQuery sql;

    public NguoiDung()
	{
        sql = new SQLQuery();
	}

    public bool KiemTraDangNhap()
    {
        DataTable dtbl = sql.GetDataTable("select * from tblnguoidung where TaiKhoanNguoiDung = N'" + MyFunction.KillSqlInjection(this.TaiKhoanNguoiDung) + "' and matkhau = '" + MyFunction.KillSqlInjection(this.MatKhau) +  "'");
        if (dtbl.Rows.Count > 0)
        {
            this.Quyen = Convert.ToInt32(dtbl.Rows[0]["Quyen"]);
            this.MaNguoiDung = Convert.ToInt32(dtbl.Rows[0]["MaNguoiDung"]);
            return true;
        }
        else
        {
            return false;
        }
    }

    public int ThemNguoiDung()
    {        
        sql.Execute("insert into tblnguoidung(TaiKhoanNguoiDung, matkhau, email, quyen) values(N'"+this.TaiKhoanNguoiDung+"', '"+this.MatKhau+"', '" + this.Email + "', " + this.Quyen + ")");
        return Convert.ToInt32(sql.GetDataRow("select top 1 MaNguoiDung from tblnguoidung order by MaNguoiDung desc")["MaNguoiDung"]);
    }

    public void XoaNguoiDung()
    {
        sql.Execute("delete from tblnguoidung where MaNguoiDung = " + this.MaNguoiDung);
    }

    public void SuaThongTin()
    {
        sql.Execute("update tblnguoidung set email = '" + this.Email + "', quyen = " + this.Quyen + " where MaNguoiDung = " + this.MaNguoiDung);
    }

    public void ThayMatKhau()
    {
        sql.Execute("update tblnguoidung set matkhau = '" + this.MatKhau + "' where MaNguoiDung = " + this.MaNguoiDung);
    }

    public DataTable DanhSachNguoiDung()
    {        
        DataTable dtbl = sql.GetDataTable("select * from tblnguoidung where quyen = " + this.Quyen + " order by TaiKhoanNguoiDung asc");

        dtbl.Columns.Add(new DataColumn("ngay", typeof(string)));


        //dtbl.Columns.Add(new DataColumn("gt", typeof(string)));

        foreach (DataRow dr in dtbl.Rows)
        {
            dr["ngay"] = MyFunction.NgayVietNam(Convert.ToDateTime(dr["ngaytao"]));


            //if (dr["gioitinh"].ToString() == "1")
            //{
            //    dr["gt"] = "nam";
            //}
            //else
            //{
            //    dr["gt"] = "nu";
            //}


        }


        return dtbl;
    }

    public DataTable DanhSachChat(int currentUserId)
    {
        DataTable dtbl = sql.GetDataTable("select * from tblnguoidung order by TaiKhoanNguoiDung asc");

        DataTable result = new DataTable();
        result.Columns.Add("MaNguoiDung1");
        result.Columns.Add("MaNguoiDung2");
        result.Columns.Add("TenNguoiDung");
        foreach (DataRow dr in dtbl.Rows)
        {
            int userId = (int)dr["MaNguoiDung"];
            if(userId != currentUserId)
            {
                string tenNguoiDung = (string)dr["TaiKhoanNguoiDung"];
                ChatModel o = new ChatModel(currentUserId, userId, tenNguoiDung);
                result.Rows.Add(new object[] { o.MaNguoiDung1, o.MaNguoiDung2, o.TenNguoiDung });
            }
        }


        return result;
    }

    public DataRow ChiTietNguoiDung()
    {
        return sql.GetDataRow("select * from tblnguoidung where MaNguoiDung = " + this.MaNguoiDung);
    }
    public DataRow ChiTietNguoiDung(int maNguoiDung)
    {
        return sql.GetDataRow("select * from tblnguoidung where MaNguoiDung = " + maNguoiDung);
    }
}