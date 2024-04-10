using System;
using System.Collections.Generic;
using System.Threading;

namespace Btl_Ltw_De17_khaoSatTrucTuyen.trangChu
{
    public partial class trangChu : System.Web.UI.Page
    {
        public List<obj_cauHoi> cauHois= new List<obj_cauHoi>();
        public List<obj_cauTraLoi> cauTLs= new List<obj_cauTraLoi>();
        public List<obj_formKS> formsKS = new List<obj_formKS>();
        public obj_formKS fks = new obj_formKS();
        public List<obj_cauHoi> listCHtheoF = new List<obj_cauHoi>();
        public List<obj_cauTraLoi> listCTLtheoCH = new List<obj_cauTraLoi>();
        public List<obj_themYK> listTYK = new List<obj_themYK>();
        public List<obj_traLoiForm> listTLF = new List<obj_traLoiForm>();
        public List<int> arr = new List<int>();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            cauHois = (List<obj_cauHoi>)Application["listCauHoi"];
            listTLF = (List<obj_traLoiForm>)Application["listTLF"];
            cauTLs = (List<obj_cauTraLoi>)Application["listCTL"];
            formsKS = (List<obj_formKS>)Application["listFormKS"];
            Session["idForm"] = int.Parse(Request.QueryString["content"]);
            int idf = (int)Session["idForm"];


            if (IsPostBack)
            {
                //cauHois = (List<obj_cauHoi>)Application["listCauHoi"];
                //List<obj_cauHoi>
                String input = Request.Form["btnLuu"];
                if(input != null)
                {
                    cauTLs = (List<obj_cauTraLoi>)Application["listCTL"];
                    var ques = Request.Form["ques_hidden"].Split(',');
                    var sel = Request.Form["select_hidden"].Split(',');
                    var ans = Request.Form["ans_hidden"].Split(',');
                    int ind = 0;
                    int idCauHoi;

                    foreach (var f in formsKS)
                    {
                        if (f.IdForm == idf)
                        {
                            String tieuDe = Request.Form["tieuDe"];
                            String mota = Request.Form["moTa"];
                            f.TenForm = tieuDe;
                            f.MoTa = mota;
                            fks = f;
                        }
                    }

                    for (int i = cauHois.Count - 1; i >= 0; i--)
                    {
                        var ch1 = cauHois[i];
                        if (ch1.IdForm == idf)
                        {
                            // Tìm và xóa tất cả các câu trả lời có IdCauHoi tương ứng với câu hỏi hiện tại
                            cauTLs.RemoveAll(ctl => ctl.IdCauHoi == ch1.IdCauHoi);

                            // Xóa câu hỏi khỏi danh sách cauHois
                            cauHois.RemoveAt(i);
                        }
                    }


                    for (int i = 0; i < ques.Length; i++)
                    {
                        if (cauHois.Count == 0)
                        {
                            idCauHoi = 1;
                            //cauHois.Add(new obj_cauHoi(1, Session["idForm"], ques[i], sel[i]));
                        }
                        else
                        {
                            idCauHoi = cauHois[cauHois.Count - 1].IdCauHoi + 1;

                        }

                        while (true)
                        {
                            if (ind == ans.Length - 1) break;
                            if (ans[ind].CompareTo(";") == 1)
                            {

                                if (cauTLs.Count == 0)
                                    cauTLs.Add(new obj_cauTraLoi(1, idCauHoi, ans[ind]));
                                else
                                    cauTLs.Add(new obj_cauTraLoi(cauTLs[cauTLs.Count - 1].IdCauTraLoi + 1, idCauHoi, ans[ind]));
                                ind++;
                                Response.Write(idCauHoi);

                            }
                            else
                            {
                                ind++;
                                break;
                            }

                        }
                        Response.Write(sel[i]);
                        cauHois.Add(new obj_cauHoi(idCauHoi, idf, ques[i], sel[i]));
                    }
                }

                
                //foreach (var f in formsKS)
                //{
                //    if (f.IdForm == idf)
                //    {
                //        fks = f;
                //        break;
                //    }
                //}
                //foreach (var ch in cauHois)
                //{
                //    if (ch.IdForm == idf)
                //    {
                //        listCHtheoF.Add(ch);
                //        foreach (var ctl in cauTLs)
                //        {
                //            if (ch.IdCauHoi == ctl.IdCauHoi)
                //            {
                //                listCTLtheoCH.Add(ctl);
                //            }
                //        }
                //    }
                //}


            }
            else
            {
                //Response.Write(cauHois.Count);
                //Response.Write(Request.QueryString["content"]);

                //foreach (var f in formsKS)
                //{
                //    if (f.IdForm == idf)
                //    {
                //        fks = f;
                //        break;
                //    }
                //}
                //foreach (var ch in cauHois)
                //{
                //    if (ch.IdForm == idf)
                //    {
                //        listCHtheoF.Add(ch);
                //        foreach (var ctl in cauTLs)
                //        {
                //            if (ch.IdCauHoi == ctl.IdCauHoi)
                //            {
                //                listCTLtheoCH.Add(ctl);
                //            }
                //        }
                //    }
                //}
            }

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
                            int count = 0;
                            foreach (var tlf in listTLF)
                            {
                                if (ctl.IdCauTraLoi == tlf.IdCauTraLoi)
                                {
                                    count++;
                                }
                            }
                            arr.Add(count);
                        }
                    }
                }
            }
        }

        protected void btnThemYK_ServerClick(object sender, EventArgs e)
        {
            String email = Request.Form["txtEmail"];
            listTYK = (List<obj_themYK>)Application["listTYK"];
            int idt = 0;
            if(listTYK.Count == 0) idt = 1;
            else idt = listTYK[listTYK.Count - 1].Id + 1;

            int idf = (int)Session["idForm"];

            listTYK.Add(new obj_themYK(idt, email, idf));
        }

        protected void btnLuuForm_ServerClick(object sender, EventArgs e)
        {
            int idf = (int)Session["idForm"];
            cauTLs = (List<obj_cauTraLoi>)Application["listCTL"];
            var ques = Request.Form["ques_hidden"].Split(',');
            var sel = Request.Form["select_hidden"].Split(',');
            var ans = Request.Form["ans_hidden"].Split(',');
            int ind = 0;
            int idCauHoi;

            foreach (var f in formsKS)
            {
                if (f.IdForm == idf)
                {
                    String tieuDe = Request.Form["tieuDe"];
                    String mota = Request.Form["moTa"];
                    f.TenForm = tieuDe;
                    f.MoTa = mota;
                    fks = f;
                }
            }

            for (int i = cauHois.Count - 1; i >= 0; i--)
            {
                var ch1 = cauHois[i];
                if (ch1.IdForm == idf)
                {
                    // Tìm và xóa tất cả các câu trả lời có IdCauHoi tương ứng với câu hỏi hiện tại
                    cauTLs.RemoveAll(ctl => ctl.IdCauHoi == ch1.IdCauHoi);

                    // Xóa câu hỏi khỏi danh sách cauHois
                    cauHois.RemoveAt(i);
                }
            }


            for (int i = 0; i < ques.Length; i++)
            {
                if (cauHois.Count == 0)
                {
                    idCauHoi = 1;
                    //cauHois.Add(new obj_cauHoi(1, Session["idForm"], ques[i], sel[i]));
                }
                else
                {
                    idCauHoi = cauHois[cauHois.Count - 1].IdCauHoi + 1;

                }

                while (true)
                {
                    if (ind == ans.Length - 1) break;
                    if (ans[ind].CompareTo(";") == 1)
                    {

                        if (cauTLs.Count == 0)
                            cauTLs.Add(new obj_cauTraLoi(1, idCauHoi, ans[ind]));
                        else
                            cauTLs.Add(new obj_cauTraLoi(cauTLs[cauTLs.Count - 1].IdCauTraLoi + 1, idCauHoi, ans[ind]));
                        ind++;
                        Response.Write(idCauHoi);

                    }
                    else
                    {
                        ind++;
                        break;
                    }

                }
                Response.Write(sel[i]);
                cauHois.Add(new obj_cauHoi(idCauHoi, idf, ques[i], sel[i]));
            }


            //foreach (var f in formsKS)
            //{
            //    if (f.IdForm == idf)
            //    {
            //        fks = f;
            //        break;
            //    }
            //}

            
            //foreach (var ch in cauHois)
            //{
            //    if (ch.IdForm == idf)
            //    {
            //        listCHtheoF.Add(ch);
            //        foreach (var ctl in cauTLs)
            //        {
            //            if (ch.IdCauHoi == ctl.IdCauHoi)
            //            {
            //                listCTLtheoCH.Add(ctl);
            //                int count = 0;
            //                foreach (var tlf in listTLF)
            //                {
            //                    if(ctl.IdCauTraLoi == tlf.NoiDung)
            //                    {
            //                        count ++;
            //                    }
            //                }
            //                arr.Add(count);
            //            }
            //        }
            //    }
            //}

        }

        protected void xoaForm_ServerClick(object sender, EventArgs e)
        {
            formsKS.RemoveAll(item => item.IdForm == (int)Session["idForm"]);
            Response.Redirect("trangChu.aspx");
        }
    }

}