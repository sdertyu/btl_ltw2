<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="khaoSat.aspx.cs" Inherits="Btl_Ltw_De17_khaoSatTrucTuyen.khaoSat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .header_container {
            height: 70px;
            background-color: #BA55D3;
            padding: 10px;
            padding-left: 30px;
            position: relative;
        }
        .title {
            font-size: 24pt;
            display: inline-block;
            line-height: 50px;
            cursor: pointer;
            
        }

        .van {
            color: white;
            cursor: pointer;
        }

        .survey {
            color: #FFD700;
            padding: 0;
        }

        .fa-circle-user {
            position: absolute;
            right: 50px;
            height: 50px;
            line-height: 50px;
        }


        .tab_content.active {
            display: block;
            min-height: 100vh;
            background-color: #d9f5f9;
        }

        .btn_luu {
            color: mediumpurple;
            position: fixed;
            bottom: 20px;
            padding: 7px;
            left: 50%;
            outline: solid;
        }

        .tieuDe_container {
            width: 768px;
            background-color: white;
            /* height: 100px; */
            margin: 0 auto;
            /* padding-top: 20px; */
            padding: 10px;
            border-radius: 10px;
            border-left: 5px solid #4285f4;
            border-top: 5px solid #00bcd4;
            margin-bottom: 20px;
        }

        .question-answer_container {
            width: 768px;
            background-color: white;
            height: fit-content;
            margin: 0 auto;
            /* padding-top: 20px; */
            padding: 10px;
            border-radius: 10px;
            border-left: 5px solid #4285f4;
            border-top: 5px solid #00bcd4;
            margin-bottom: 30px;
        }

        .question_container {
            width: 440;
            display: inline-block;
            margin-right: 30px;
        }

        .question {
            margin-bottom: 2px;
            border: none;
            width: 440px;
            height: 56px;
            background-color: #f3fafa;
            padding: 10px;
            font-size: 12pt;
        }
        .remove_question {
            height: 50px;
            vertical-align: top;
            font-size: 15pt;
            background-color: white;
            margin-left: 20px;
        }

        .answer {
            height: 50px;
            width: 650px;
            /* display: flex; */
            /* align-self: center; */
            /* justify-content: center; */
        }

        .anwser_text {
            width: 600px;
            height: 50px;
            font-size: 12pt;
            vertical-align: top;
        }

        .remove_anwser {
            height: 50px;
            vertical-align: top;
            font-size: 12pt;
            background-color: white;
        }

        .tieuDe {
            font-size: 24pt;
        }

        .moTaTieuDe {
            margin-top: 8px;
        }

        #ip_tieuDe:focus + .hr_tieuDe {
            height: 5px;
            background-color: black;
            transition: all 0.5s ease-in;
        }


        #ip_moTaTieuDe:focus + .hr_moTaTieuDe {
            height: 5px;
            background-color: black;
            transition: all 0.3s ease-in;
        }

        input {
            outline: none;
            border: none;
        }

        span {
            color: blue;
            font-size: 17px;
            padding-left: 30px;
        }
        
        .stt_an {
            height: 50px;
            font-size: 18px;
            display: inline-block;
            margin-right: 10px;
            /*width: 90%;*/
            /*width: 100px;*/
        }


    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div class="header_container">
            
            <span class="title van">HPA</span><span class="title survey"><b>Survey</b></span>
            <i class="fa-regular fa-circle-user fa-2x"></i>
        </div>

        <div style="height: 20px; background-color: #d9f5f9;"></div>

        <div class="tab_content active" id="tab1">

            <input type="text" name="ques_hidden" value="" id="ques_hidden" hidden />
            <input type="text" name="ans_hidden" value="" id="ans_hidden" hidden />
            <input type="text" name="select_hidden" value="" id="select_hidden" hidden />

            <input class="btn_luu" id="btnGui" type="button" name="btnLuu" value="Gửi" />

            <div class="tieuDe_container">
                <% Response.Write($"<input class=\"nd_tieuDe tieuDe\" id=\"ip_tieuDe\" type=\"text\" value=\"{fks.TenForm}\" name=\"tieuDe\"    />"); %>
        
                <hr class="hr_tieuDe">
                <% Response.Write($"<input class=\"nd_tieuDe moTaTieuDe\" id=\"ip_moTaTieuDe\" type=\"text\" value=\"{fks.MoTa}\" name=\"moTa\">"); %>
        
                <hr class="hr_moTaTieuDe">
            </div>

            <div style="height: 20px; background-color: #d9f5f9;"></div>


            <% 
                int i = 0;
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
                                            $"<input class=\"stt_an\" name=\"{i}\" type=\"radio\" value=\"{ctl.IdCauTraLoi}\"/>\r\n                " +
                                            $"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                                            $"</div>\r\n        ");
                            }
                            if(ch.KieuCauHoi == "HD") {
                                Response.Write($"<div class=\"answer\">\r\n                " +
                                            $"<input class=\"stt_an\" type=\"checkbox\" value=\"{ctl.IdCauTraLoi}\"/>\r\n                " +
                                            $"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                                            $"</div>\r\n        ");
                            }
                            
                            //if(ch.KieuCauHoi == "TN") {
                            //    Response.Write($"<div class=\"answer\">\r\n                " +
                            //                $"<input class=\"stt_an\" type=\"radio\" value=\"\"/>\r\n                " +
                            //                $"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                            //                $"</div>\r\n        ");
                            //}



                        }
                    }
                    if(ch.KieuCauHoi == "DO") {
                        Response.Write($"<div class=\"answer\">\r\n                " +
                                    $"<input class=\"stt_an\" name=\"{ch.IdCauHoi}\" type=\"text\" placeholder=\"Nhập vào đây\" value=\"\" style=\"border-bottom: 1px solid black; width: 90%\"/>\r\n                " +
                                    //$"<input class=\"anwser_text\" type=\"text\" placeholder=\"Tùy chọn\" value=\"{ctl.NoiDung}\">\r\n                " +
                                    $"</div>\r\n        ");
                        break;
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

    </form>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let mess = ""
            let mess2 = ""
            let btn = document.getElementById("btnGui")
            btn.addEventListener("click", function () {
                let divs = document.querySelectorAll(".question-answer_container")
                divs.forEach((div) => {

                    let ans = div.querySelector(".answer_container").querySelector(".tuy_chon").querySelectorAll(".answer")

                    ans.forEach((an) => {
                        let ip = an.querySelectorAll(".stt_an")
                        ip.forEach((i) => {
                            if ((i.type == "radio" || i.type == "checkbox") && i.checked) {
                                //console.log(i)
                                mess = mess + i.value + ","
                            }
                            if(i.type == "text") {
                                mess2 +=i.name + "-" + i.value + ","
                            }
                        })
                    })
                    console.log(mess.split(','))
                })

                window.location.href = "khaoSat.aspx?cauHoi=" + encodeURIComponent(mess) + "&noiDung=" + encodeURIComponent(mess2);
            })

            let titles = document.querySelectorAll(".title")
            titles.forEach((title) => {
                title.addEventListener("click", function () {
                                window.location.href = "trangChu.aspx"
                            })
            })
            
        })
            
            
            
        
    </script>
</body>
</html>
