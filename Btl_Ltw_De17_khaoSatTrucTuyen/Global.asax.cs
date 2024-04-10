using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

            //thêm dữ liệu tài khoản
            List<obj_taiKhoan> listTK = new List<obj_taiKhoan>();
            listTK.Add(new obj_taiKhoan("1@gmail.com", "1"));
            Application["taiKhoan"] = listTK;

            //Thêm dữ liệu form
            List<obj_formKS> listFormKS = new List<obj_formKS>();
            listFormKS.Add(new obj_formKS(1,"1@gmail.com", "Test form", "Form này chỉ để test thôi"));
            listFormKS.Add(new obj_formKS(2,"1@gmail.com", "Test form 2", "Form này chỉ để test thôi 2 dfg dfg dsfg dsfg dfg dg sdfg dfg sdg sdgf dsfg dsg dfg dsgf dgf "));
            Application["listFormKS"] = listFormKS;

            //Thêm bộ câu hỏi
            List<obj_cauHoi> cauHois = new List<obj_cauHoi>();
            cauHois.Add(new obj_cauHoi(1, 1, "Bạn tên là gì", "TN"));
            cauHois.Add(new obj_cauHoi(2, 1, "Bạn tên là gì nhỉ", "TN"));
            cauHois.Add(new obj_cauHoi(3, 1, "Bạn tên là gì nhỉ 2", "DO"));
            Application["listCauHoi"] = cauHois;

            //Thêm bộ câu trả lời
            List<obj_cauTraLoi> listCTL = new List<obj_cauTraLoi>();
            listCTL.Add(new obj_cauTraLoi(1, 1, "haha"));
            listCTL.Add(new obj_cauTraLoi(2, 1, "kệ tao hỏi làm gì"));
            listCTL.Add(new obj_cauTraLoi(3, 2, "kệ tao hỏi làm gì 2"));
            listCTL.Add(new obj_cauTraLoi(4, 2, "kệ tao hỏi làm gì 3"));
            Application["listCTL"] = listCTL;

            List<obj_themYK> listThemYK = new List<obj_themYK>();
            listThemYK.Add(new obj_themYK(1, "1@gmail.com", 1));
            Application["listTYK"] = listThemYK;

            List<obj_traLoiForm> listTLF = new List<obj_traLoiForm>();
            listTLF.Add(new obj_traLoiForm(1, 1, 1, 1, ""));
            listTLF.Add(new obj_traLoiForm(2, 1, 2, 3, ""));
            Application["listTLF"] = listTLF;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["email"] = "";
            Session["idForm"] = 0;
            //Session["email"] = "";
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}