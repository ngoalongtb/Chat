using System;
using System.Collections.Generic;
using System.Web;
using System.Data;

public class ChuDe
{
    public int MaChuDe;
    public string TenChuDe;

    private SQLQuery sql;

	public ChuDe()
	{
        this.sql = new SQLQuery();
	}

    public int ThemChuDe()
    {
        this.sql.Execute("insert into tblchude(tenchude) values(N'"+TenChuDe+"')");
        return Convert.ToInt32(this.sql.GetDataRow("select top 1 machude from tblchude order by machude desc")["machude"]);
    }

    public void XoaChuDe()
    {
        this.sql.Execute("delete from tblchude where machude = "+MaChuDe);
    }

    public void SuaChuDe()
    {
        this.sql.Execute("update tblchude set tenchude = N'"+TenChuDe+"' where machude ="+MaChuDe);
    }

    public DataRow ChiTietChuDe()
    {
        return this.sql.GetDataRow("select * from tblchude where machude = " + MaChuDe);
    }

    public DataTable DanhSachChuDe()
    {
        DataTable dtbl = sql.GetDataTable("select taikhoannguoidung, a.machude, tenchude, a.ngaytao from tblchude a, tblnguoidung b, tblNguoiDung_tblChuDe c where a.machude = c.machude and b.manguoidung = c.manguoidung and c.taochude = 1 order by a.NgayTao desc");

        dtbl.Columns.Add(new DataColumn("ngay", typeof(string)));

        foreach (DataRow dr in dtbl.Rows)
        {
            dr["ngay"] = MyFunction.NgayVietNam(Convert.ToDateTime(dr["ngaytao"]));
        }

        return dtbl;
    }

    public DataTable TimKiem()
    {
        DataTable dtbl = sql.GetDataTable("select taikhoannguoidung, a.machude, tenchude, a.ngaytao from tblchude a, tblnguoidung b, tblNguoiDung_tblChuDe c where a.machude = c.machude and b.manguoidung = c.manguoidung and c.taochude = 1 and tenchude like '%"+TenChuDe+"%' order by a.NgayTao desc");

        dtbl.Columns.Add(new DataColumn("ngay", typeof(string)));

        foreach (DataRow dr in dtbl.Rows)
        {
            dr["ngay"] = MyFunction.NgayVietNam(Convert.ToDateTime(dr["ngaytao"]));
        }

        return dtbl;
    }   
}