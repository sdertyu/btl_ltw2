using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_Ltw_De17_khaoSatTrucTuyen.trangChu
{
    public partial class trangChu1 : System.Web.UI.Page
    {
        public List<obj_formKS> listFormHT = new List<obj_formKS>();
        public List<obj_formKS> listFormYK = new List<obj_formKS>();
        public List<obj_formKS> listFormKS;
        public List<obj_themYK> listTYK;


        protected void Page_Load(object sender, EventArgs e)
        {
            listFormKS = (List<obj_formKS>)Application["listFormKS"];
            listTYK = (List<obj_themYK>)Application["listTYK"];
            String email = (String)Session["email"];
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["xoa"]))
                {
                    int idfx = int.Parse(Request.QueryString["xoa"]);
                    listFormKS.RemoveAll(item => item.IdForm == idfx);
                   
                }

                //lấy danh sách các form của mình
                foreach (var form in listFormKS)
                {

                    if (form.Email.ToString() == email)
                    {
                        //Response.Write(form.Email);
                        listFormHT.Add(form);
                    }
                }

                //lấy danh sách các form được chia sẻ với mình
                foreach(var yk in listTYK)
                {
                    if(yk.Email.ToString() == email)
                    {
                        foreach(var f in listFormKS)
                        {
                            if(f.IdForm == yk.IdForm)
                            {
                                listFormYK.Add(f);
                            }
                        }
                    }
                }
                
                


            }
            else
            {
                int idForm;
                if (listFormKS.Count > 0)
                {
                    idForm = listFormKS[listFormKS.Count - 1].IdForm + 1;
                }
                else
                    idForm = 1;
                listFormKS.Add(new obj_formKS(idForm, (String)Session["email"], Request.Form["txtTenForm"], Request.Form["txtMTF"]));

                foreach (var form in listFormKS)
                {
                    
                    if (form.Email.ToString() == email)
                    {
                        //Response.Write(form.Email);
                        listFormHT.Add(form);
                    }
                }
                Response.Write("fsdf");


            }
            
        }

    }
}
