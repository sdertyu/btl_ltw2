using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_Ltw_De17_khaoSatTrucTuyen.trangChu
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                List<obj_taiKhoan> listTK = (List<obj_taiKhoan>)Application["taiKhoan"];
                String email = Request.Form["sEmail"];
                String mk = Request.Form["sMatKhau"];
                foreach(var item in listTK)
                {
                    if(item.Email.ToString() == email && item.Password.ToString() == mk)
                    {
                        Session["email"] = email;
                        Response.Redirect("trangChu.aspx");
                        //Response.Write(Session["email"]);
                        Response.End();
                    }
                }
            }
        }
    }
}


//String conString = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
//SqlConnection sqlConnection = new SqlConnection(conString);

//try
//{

//    String email = Request.Form["sEmail"];
//    String mk = Request.Form["sMatKhau"];
//    Response.Write(email);
//    sqlConnection.Open();
//    SqlCommand cmd = new SqlCommand();
//    cmd.Connection = sqlConnection;
//    cmd.CommandText = $"Select count(*) from tblNguoiDung where sEmail = '{email}' and sMatKhau = '{mk}'";

//    int count = (int)cmd.ExecuteScalar();
//    if(count > 0)
//    {
//        sqlConnection.Close();
//        Session["email"] = email;
//        Response.Redirect("trangChu.aspx");
//    }
//    else
//    {
//        ClientScript.RegisterStartupScript(this.GetType(),"alert", "alert('Email hoặc mật khẩu chưa đúng')",true);
//    }


//}
//catch (Exception ec)
//{
//    Response.Write(ec);
//    Console.WriteLine(ec);
//}
//finally
//{
//    sqlConnection.Close();
//}