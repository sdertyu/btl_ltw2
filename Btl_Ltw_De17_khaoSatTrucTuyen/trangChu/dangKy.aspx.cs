using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_Ltw_De17_khaoSatTrucTuyen.trangChu
{
    public partial class dangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                String email = Request.Form["txtEmail"];
                String mk = Request.Form["txtMatKhau"];
                List<obj_taiKhoan> listTK = (List<obj_taiKhoan>)Application["taiKhoan"];
                listTK.Add(new obj_taiKhoan(email, mk));
                Application["taiKhoan"] = listTK;
            }
        }
    }
}

//String conString = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
//SqlConnection sqlConnection = new SqlConnection(conString);

//try
//{

//    String email = Request.Form["txtEmail"];
//    String mk = Request.Form["txtMatKhau"];
//    Response.Write(email);
//    sqlConnection.Open();
//    SqlCommand cmd = new SqlCommand();
//    cmd.Connection = sqlConnection;
//    cmd.CommandText = "st_dangKyTaiKhoan";
//    cmd.CommandType = System.Data.CommandType.StoredProcedure;
//    cmd.Parameters.Add("@email", System.Data.SqlDbType.NVarChar).Value = email;
//    cmd.Parameters.Add("@mk", System.Data.SqlDbType.NVarChar).Value = mk;
//    cmd.ExecuteNonQuery();

//    sqlConnection.Close();
//    Response.Redirect("trangChu.aspx");
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