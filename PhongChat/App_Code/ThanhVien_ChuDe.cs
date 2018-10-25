using System;
using System.Collections.Generic;
using System.Web;
using System.Data;

public class ThanhVien_ChuDe
{
    public int MaChat, MaNguoiDung, MaChuDe, TaoChuDe;
    public string NoiDungChat;

    private SQLQuery sql;

	public ThanhVien_ChuDe()
	{
        this.sql = new SQLQuery();
	}

    public void Them()
    {
        this.sql.Execute("insert into tblnguoidung_tblchude(MaNguoiDung, MaChuDe, TaoChuDe, NoiDungChat) values("+MaNguoiDung+","+MaChuDe+","+TaoChuDe+",N'"+NoiDungChat+"')");
    }

    public void Xoa()
    {
        this.sql.Execute("delete from tblnguoidung_tblchude where machat = " + MaChat);
    }

    public DataTable DanhSach()
    {
        DataTable dtbl = this.sql.GetDataTable("select taikhoannguoidung, noidungchat, a.ngaytao from tblnguoidung_tblchude a, tblnguoidung b where a.manguoidung = b.manguoidung and a.machude = " + MaChuDe + " order by ngaytao desc");

        dtbl.Columns.Add(new DataColumn("ngay", typeof(string)));

        foreach (DataRow dr in dtbl.Rows)
        {
            dr["ngay"] = MyFunction.NgayVietNam(Convert.ToDateTime(dr["ngaytao"]));
        }

        return dtbl;
    }

    public DataTable DanhSachTV()
    {
        return this.sql.GetDataTable("select distinct(taikhoannguoidung) from tblnguoidung_tblchude a, tblnguoidung b where a.manguoidung = b.manguoidung and a.machude = " + MaChuDe);
    }
    public DataTable DanhSachChatCaNhan(int maNguoiDung1, int maNguoiDung2)
    {
        return this.sql.GetDataTable(string.Format("select distinct(taikhoannguoidung) from tblnguoidung where a.manguoidung IN ( {0}, {1} )",maNguoiDung1,maNguoiDung2));
    }

    public int LayMaNguoiDung()
    {
        return Convert.ToInt32(sql.GetDataRow("select manguoidung from tblNguoiDung_tblChuDe where machude = " + MaChuDe + " and taochude = 1")["manguoidung"]);
    }
}