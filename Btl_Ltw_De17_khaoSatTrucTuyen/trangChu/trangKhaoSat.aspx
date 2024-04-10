<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trangKhaoSat.aspx.cs" Inherits="Btl_Ltw_De17_khaoSatTrucTuyen.trangChu.trangChu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="khoaSat.css" rel="stylesheet" />
</head>
<body>
    <form id="form" method="post" runat="server">

        <div class="header_container">
            <span class="title van">HPA</span><span class="title survey"><b>Survey</b></span>
            <i class="fa-regular fa-circle-user fa-2x"></i>
        </div>

        <div class="tab_container">
            <div class="tab">
                <button type="button" class="tab_btn">Câu hỏi</button>
                <button type="button" class="tab_btn">Câu trả lời</button>
                <button type="button" class="tab_btn">Cài đặt</button>
                <div class="line"></div>
            </div>
    
        </div>

        <hr>
        <div style="height: 20px; background-color: #d9f5f9;"></div>

        <div class="tab_content active" id="tab1">

            <input type="text" name="ques_hidden" value="" id="ques_hidden" hidden />
            <input type="text" name="ans_hidden" value="" id="ans_hidden" hidden />
            <input type="text" name="select_hidden" value="" id="select_hidden" hidden />

            <input class="btn_luu" type="submit" name="btnLuu" value="Lưu Form" onclick="testform()"/>

            <div class="function_container">
        
                    <input type="button" onclick="add_clicl()" name="" id="add_question" value="+">
        
            </div>
            <div class="tieuDe_container">
                <% Response.Write($"<input class=\"nd_tieuDe tieuDe\" id=\"ip_tieuDe\" type=\"text\" value=\"{fks.TenForm}\" name=\"tieuDe\"    />"); %>
                
                <hr class="hr_tieuDe">
                <% Response.Write($"<input class=\"nd_tieuDe moTaTieuDe\" id=\"ip_moTaTieuDe\" type=\"text\" value=\"{fks.MoTa}\" name=\"moTa\">"); %>
                
                <hr class="hr_moTaTieuDe">
            </div>

            <div style="height: 20px; background-color: #d9f5f9;"></div>

            <% foreach (var ch in listCHtheoF)
                {
                    Response.Write($"<div class=\"question-answer_container\">\r\n    " +
                        $"<div>\r\n        " +
                        $"<div class=\"question_container\">\r\n            " +
                        $"<input name=\"noiDung\" type=\"text\" class=\"question\" placeholder=\"Câu hỏi\" value=\"{ch.NoiDung}\">\r\n            <hr>\r\n       " +
                        $" </div>\r\n        " +
                        $"<div class=\"select_container\">\r\n            "
                        //$"<select class=\"select\" name=\"select\" id=\"\" onchange=\"select_change(this)\" >\r\n                " +
                        //$"<option value=\"1\"> Trắc nghiệm</option>\r\n                " +
                        //$"<option value=\"2\">Hộp điểm</option>\r\n                " +
                        //$"<option value=\"3\">Đoạn</option>\r\n                " +
                        //$"<option value=\"4\">Menu thả xuống</option>\r\n            " +
                        //$"</select>\r\n            " +

                        //$"<div class=\"select_icon\">\r\n               " +
                        //$"<i class=\"fa-sharp fa-solid fa-caret-down\"></i>\r\n            " +
                        //$"</div>\r\n       " +
                        //$" </div>\r\n        " +
                        //$"<input type=\"button\" value=\"X\" class=\"remove_question\" onclick=\"remove_question_click(this)\">\r\n    " +
                        //$"</div>\r\n    \r\n    " +
                        //$"<div class=\"answer_container\">\r\n        " +
                        //$"<div class=\"tuy_chon\">\r\n            " +

                        //$"<div class=\"answer\">\r\n                " +
                        //$"<p class=\"stt_an\">*</p>\r\n                " +
                        //$"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\">\r\n                " +
                        //$"<input class=\"remove_anwser\" type=\"button\" value=\"X\" onclick=\"remove_anwser_click(this)\">\r\n            " +
                        //$"</div>\r\n        " +

                        //$"</div>\r\n        " +
                        //$"<div class=\"\"></div>\r\n\r\n        " +
                        //$"<div class=\"add_anwser\">\r\n            " +
                        //$"<!-- <span onclick=\"them_tc_click(this)\">Thêm tùy chọn</span> Hoặc <span onclick=\"them_khac_click(this)\">Thêm câu trả lời khác</span> -->\r\n            " +
                        //$"<span onclick=\"them_tc_click(this)\">Thêm tùy chọn</span>\r\n        " +
                        //$"</div>\r\n    " +
                        //$"</div>\r\n" +
                        //$"</div>");
                        );
                    if (ch.KieuCauHoi == "TN")
                        Response.Write($"<select class=\"select\" name=\"select\" id=\"\" onchange=\"select_change(this)\" >\r\n                " +
                                    $"<option value=\"TN\" selected> Trắc nghiệm</option>\r\n                " +
                                    $"<option value=\"HD\">Hộp điểm</option>\r\n                " +
                                    $"<option value=\"DO\">Đoạn</option>\r\n                " +
                                    $"<option value=\"MN\">Menu thả xuống</option>\r\n            " +
                                    $"</select>\r\n            " );
                    if(ch.KieuCauHoi == "HD")
                        Response.Write($"<select class=\"select\" name=\"select\" id=\"\" onchange=\"select_change(this)\" >\r\n                " +
                                    $"<option value=\"TN\"> Trắc nghiệm</option>\r\n                " +
                                    $"<option value=\"HD\" selected>Hộp điểm</option>\r\n                " +
                                    $"<option value=\"DO\">Đoạn</option>\r\n                " +
                                    $"<option value=\"MN\">Menu thả xuống</option>\r\n            " +
                                    $"</select>\r\n            " );
                    if(ch.KieuCauHoi == "DO")
                        Response.Write($"<select class=\"select\" name=\"select\" id=\"\" onchange=\"select_change(this)\" >\r\n                " +
                                    $"<option value=\"TN\"> Trắc nghiệm</option>\r\n                " +
                                    $"<option value=\"HD\">Hộp điểm</option>\r\n                " +
                                    $"<option value=\"DO\" selected>Đoạn</option>\r\n                " +
                                    $"<option value=\"MN\">Menu thả xuống</option>\r\n            " +
                                    $"</select>\r\n            " );
                    if(ch.KieuCauHoi == "MN")
                        Response.Write($"<select class=\"select\" name=\"select\" id=\"\" onchange=\"select_change(this)\" >\r\n                " +
                                    $"<option value=\"TN\"> Trắc nghiệm</option>\r\n                " +
                                    $"<option value=\"HD\">Hộp điểm</option>\r\n                " +
                                    $"<option value=\"DO\">Đoạn</option>\r\n                " +
                                    $"<option value=\"MN\" selected>Menu thả xuống</option>\r\n            " +
                                    $"</select>\r\n            " );
                    Response.Write($"<div class=\"select_icon\">\r\n               " +
                                    $"<i class=\"fa-sharp fa-solid fa-caret-down\"></i>\r\n            " +
                                    $"</div>\r\n       " +
                                    $" </div>\r\n        " +
                                    $"<input type=\"button\" value=\"X\" class=\"remove_question\" onclick=\"remove_question_click(this)\">\r\n    " +
                                    $"</div>\r\n    \r\n    " +
                                    $"<div class=\"answer_container\">\r\n        " +
                                    $"<div class=\"tuy_chon\">\r\n            " );
                    foreach(var ctl in listCTLtheoCH)
                    {
                        if(ctl.IdCauHoi == ch.IdCauHoi)
                        {
                            Response.Write($"<div class=\"answer\">\r\n                " +
                                            $"<p class=\"stt_an\">*</p>\r\n                " +
                                            $"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                                            $"<input class=\"remove_anwser\" type=\"button\" value=\"X\" onclick=\"remove_anwser_click(this)\">\r\n            " +
                                            $"</div>\r\n        ");
                        }
                    }
                    Response.Write($"</div>\r\n        " +
                        $"<div class=\"\"></div>\r\n\r\n        " +
                        $"<div class=\"add_anwser\">\r\n            " +
                        $"<!-- <span onclick=\"them_tc_click(this)\">Thêm tùy chọn</span> Hoặc <span onclick=\"them_khac_click(this)\">Thêm câu trả lời khác</span> -->\r\n            " +
                        $"<span onclick=\"them_tc_click(this)\">Thêm tùy chọn</span>\r\n        " +
                        $"</div>\r\n    " +
                        $"</div>\r\n" +
                        $"</div>");
                } %>

            <%--<div class="question-answer_container">
                <div>
                    <div class="question_container">
                        <input name="noiDung" type="text" class="question" placeholder="Câu hỏi">
                        <hr>
                    </div>
                    <div class="select_container">
                        <select class="select" name="select" id="" onchange="select_change(this)" >
                            <option value="1"> Trắc nghiệm</option>
                            <option value="2" selected>Hộp điểm</option>
                            <option value="3" >Đoạn</option>
                            <option value="4">Menu thả xuống</option>
                        </select>
                        <div class="select_icon">
                            <i class="fa-sharp fa-solid fa-caret-down"></i>
                        </div>
                    </div>
                    <input type="button" value="X" class="remove_question" onclick="remove_question_click(this)">
                    
                </div>
    
                <div class="answer_container">
                    <div class="tuy_chon">
                        <div class=""></div>
                        <div class="answer">
                            <p class="stt_an">*</p>
                            <input class="anwser_text" type="text" placeholder="Tùy chọn">
                            <input class="remove_anwser" type="button" value="X" onclick="remove_anwser_click(this)">
                        </div>
                    </div>


            
                    <div class="add_anwser">
                        <!-- <span onclick="them_tc_click(this)">Thêm tùy chọn</span> Hoặc <span onclick="them_khac_click(this)">Thêm câu trả lời khác</span> -->
                        <span onclick="them_tc_click(this)">Thêm tùy chọn</span>
                    </div>
                </div>
            </div>--%>
            
        </div>
        <div class="tab_content" id="tab2">
            
            <div class="tieuDe_container">
                <% Response.Write($"<input class=\"nd_tieuDe tieuDe\" id=\"ip_tieuDe\" type=\"text\" value=\"{fks.TenForm}\" name=\"tieuDe2\"    />"); %>
        
                <hr class="hr_tieuDe">
                <% Response.Write($"<input class=\"nd_tieuDe moTaTieuDe\" id=\"ip_moTaTieuDe\" type=\"text\" value=\"{fks.MoTa}\" name=\"moTa2\">"); %>
        
                <hr class="hr_moTaTieuDe">
            </div>

            <div style="height: 20px; background-color: #d9f5f9;"></div>


            <% 
                int i = 0;
                int j = 0;
                foreach (var ch in listCHtheoF)
                {
                    Response.Write($"<div class=\"question-answer_container\">\r\n    " +
                        $"<div>\r\n        " +
                        $"<div class=\"question_container\">\r\n            " +
                        $"<input name=\"noiDung\" type=\"text\" class=\"question\" placeholder=\"Câu hỏi\" value=\"{ch.NoiDung}\">\r\n            <hr>\r\n       " +
                        $" </div>\r\n        "
                        );

                    Response.Write($"</div>\r\n    \r\n    " +
                                    $"<div class=\"answer_container\">\r\n        " +
                                    $"<div class=\"tuy_chon\">\r\n            " );
                    foreach(var ctl in listCTLtheoCH)
                    {

                        if(ctl.IdCauHoi == ch.IdCauHoi)
                        {

                            if(ch.KieuCauHoi == "TN") {
                                Response.Write($"<div class=\"answer\">\r\n                " +
                                            $"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                                            $"<span>{arr[j]}</span>" +
                                            $"</div>\r\n        ");
                            }
                            if(ch.KieuCauHoi == "HD") {
                                Response.Write($"<div class=\"answer\">\r\n                " +
                                            $"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                                            $"</div>\r\n        ");
                            }

                            //if(ch.KieuCauHoi == "TN") {
                            //    Response.Write($"<div class=\"answer\">\r\n                " +
                            //                $"<input class=\"stt_an\" type=\"radio\" value=\"\"/>\r\n                " +
                            //                $"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                            //                $"</div>\r\n        ");
                            //}

                            j++;

                        }
                    }
                    if(ch.KieuCauHoi == "DO") {
                        foreach(var DO in listTLF)
                        {
                            if(DO.IdCauHoi == ch.IdCauHoi)
                            {
                                Response.Write($"<div class=\"answer\">\r\n                " +
                                    $"<input class=\"anwser_text\" type=\"text\" placeholder=\"tùy chọn\" value=\"{DO.NoiDung}\" readonly>\r\n                " +
                                    $"</div>\r\n        ");
                            }
                        }
                    }
                    i++;
                    Response.Write($"</div>\r\n        " +
                        $"<div class=\"\"></div>\r\n\r\n        " +
                        $"<div class=\"add_anwser\">\r\n            " +
                        $"<!-- <span onclick=\"them_tc_click(this)\">Thêm tùy chọn</span> Hoặc <span onclick=\"them_khac_click(this)\">Thêm câu trả lời khác</span> -->\r\n            " +
                        $"</div>\r\n    " +
                        $"</div>\r\n" +
                        $"</div>");
                } %>

        </div>
        <div class="tab_content" id="tab3">

            <div class="tab3_them">
                <h2>Thêm người ý kiến vào chủ đề này:</h2>
                <br />
                <input type="text" name="txtEmail" value="" placeholder="Nhập email người ý kiến" id="txtEmail"/>
                <input type="button" name="btnThemYK" value="Thêm người ý kiến" id="btnThemYK" runat="server" onserverclick="btnThemYK_ServerClick"/>
                <h2>Xóa Form:</h2>
                <br />
                <input class="btnXoaForm" type="button" name="xoaForm" value="Xóa Form" runat="server" onserverclick="xoaForm_ServerClick"/>
            </div>
            
        </div>

    </form>
    <script src="khaoSat.js"></script>
</body>
</html>
