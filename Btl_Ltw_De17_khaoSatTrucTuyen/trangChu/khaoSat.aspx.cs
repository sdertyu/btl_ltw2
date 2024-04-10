using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public partial class khaoSat : System.Web.UI.Page
    {
        public List<obj_cauHoi> cauHois = new List<obj_cauHoi>();
        public List<obj_cauTraLoi> cauTLs = new List<obj_cauTraLoi>();
        public List<obj_formKS> formsKS = new List<obj_formKS>();
        public obj_formKS fks = new obj_formKS();
        public List<obj_cauHoi> listCHtheoF = new List<obj_cauHoi>();
        public List<obj_cauTraLoi> listCTLtheoCH = new List<obj_cauTraLoi>();
        public List<obj_traLoiForm> listTLF = new List<obj_traLoiForm>();



        protected void Page_Load(object sender, EventArgs e)
        {
            cauHois = (List<obj_cauHoi>)Application["listCauHoi"];
            cauTLs = (List<obj_cauTraLoi>)Application["listCTL"];
            formsKS = (List<obj_formKS>)Application["listFormKS"];
            listTLF = (List<obj_traLoiForm>)Application["listTLF"];
            int idf = 0; 
            

            if (IsPostBack)
            {
                String p = "0909";
                Response.Write(p.ToCharArray()[0]);
            }
            else
            {
                if(!String.IsNullOrEmpty(Request.QueryString["content"]))
                {
                    idf = int.Parse(Request.QueryString["content"]);
                    Session["idForm"] = idf;
                    //idf = (int)Session["idForm"];
                }
                else
                {
                    idf = (int)Session["idForm"];
                }

                if (!String.IsNullOrEmpty(Request.QueryString["cauHoi"]))
                {
                    Response.Write(Request.QueryString["cauHoi"]);
                    Response.Write(Request.QueryString["noiDung"]);
                    var ltlf = Request.QueryString["cauHoi"].Split(',');
                    for(int i = 0; i<ltlf.Length -1 ; i++)
                    {
                        Response.Write(ltlf[i]);
                        listTLF.Add(new obj_traLoiForm(listTLF[listTLF.Count - 1].IdTLF + 1, idf, 1, int.Parse(ltlf[i]), ""));
                    }
                }
                if(!String.IsNullOrEmpty(Request.QueryString["noiDung"]))
                {
                    var DO = Request.QueryString["noiDung"].Split(',');
                    for (int i = 0; i < DO.Length - 1; i++)
                    {
                        var DO2 = DO[i].Split('-');
                        listTLF.Add(new obj_traLoiForm(listTLF[listTLF.Count - 1].IdTLF + 1, idf, int.Parse(DO2[0]), 0, DO2[1]));
                    }
                }

            }

            //hiển thị
            foreach (var f in formsKS)
            {
                if (f.IdForm == idf)
                {
                    fks = f;
                    break;
                }
            }
            foreach (var ch in cauHois)
            {
                if (ch.IdForm == idf)
                {
                    listCHtheoF.Add(ch);
                    foreach (var ctl in cauTLs)
                    {
                        if (ch.IdCauHoi == ctl.IdCauHoi)
                        {
                            listCTLtheoCH.Add(ctl);
                        }
                    }
                }
            }

        }
    }
}