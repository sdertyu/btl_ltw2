<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trangChu.aspx.cs" Inherits="Btl_Ltw_De17_khaoSatTrucTuyen.trangChu.trangChu1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../fontawesome/all.min.css" rel="stylesheet" />
    <link href="../fontawesome/fontawesome.min.css" rel="stylesheet" />
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
        }

        .van {
            color: white;
        }

        .survey {
            color: #FFD700;
        }

        .fa-circle-user {
            position: absolute;
            right: 50px;
            height: 50px;
            line-height: 50px;
        }

        input {
            border: none;
            outline: none;
        }
        /* input:focus {
            outline: none;
        } */

        .tab_container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            height: 25px;
            position: relative;
            border-bottom: 1px solid black;
        }

        .tab_btn {
            border: none;
            background-color: white;
            padding: 0 10px;
            font-size: 14px;
        }


        .line {
            bottom: 0;
            width: 68px;
            height: 5px;
            border-radius: 10px;
            background-color: blueviolet;
            position: absolute;
            transition: all 0.5s ease-in-out;
            width: 98px;
        }

        hr {
            opacity: 0.5;
        }

        .tab_content {
            display: none;
        }

        .tab_content.active {
            display: block;
            min-height: 100vh;
            background-color: #d9f5f9;
        }

        #tab1 {
            position: relative;
        }

        .table_form {
            width: 90%;
            margin: 0 auto;
            margin-top: 30px;
            background-color: white;
            border-radius: 12px;
        }

        .title_container {
            display: flex;
            width: 80%;
            margin: 0 auto;
            padding: 10px;
            border-radius: 15px;
        }

        .title_form {
            text-align: center;
            font-size: 20px;
        }

        .title_stt {
            width: 20%
        }
        
        .title_ten {
            width: 20%
        }
        
        .title_mt {
            width: 55%
        }

        .fa-trash-can {
            width: 2.5%;
            display: block;
            /*line-height: 40px;*/
            text-align: center;
            font-size: 20px;
            color: red;
        }

        .fa-pen-to-square {
            width: 2.5%;
            display: block;
            /*line-height: 40px;*/
            color: green;
            text-align: center;
            font-size: 20px;
        }

        .title_detail {
            background-color: white;
            
            border-radius: 0;
            border-top: 1px solid black;
            line-height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

      

        .btn_themForm {
            position: fixed;
            right: 100px;
            bottom: 100px;
        }

        .modal {
              display: none; /* Hidden by default */
              position: fixed; /* Stay in place */
              z-index: 1; /* Sit on top */
              padding-top: 100px; /* Location of the box */
              left: 0;
              top: 0;
              width: 100vw; /* Full width */
              height: 100vh; /* Full height */
              overflow: auto; /* Enable scroll if needed */
              background-color: rgb(0,0,0); /* Fallback color */
              background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        .modal-content {
          background-color: #fefefe;
          margin: 150px auto;
          padding: 20px;
          border: 1px solid #888;
          width: 30%;
          height: 40%;
        }

        .txtTenForm  {
            height: 20px;
            border: 1px solid black;
            margin-top: 20px;
            margin-bottom: 20px;
            margin-left: 7px;
            height: 20px;
        }

        .txtMoTa  {
            height: 20px;
            border: 1px solid black;
            margin-left: 7px;
            min-height: 50px;
            overflow: auto;
        }

        .modal_input {
            border: 1px solid black;
            padding: 5px;
            margin-top: 10px;

        }

        #btn_dongThemForm {
            margin-left: 30px;
        }

        .khaoSat {
            display: flex;
            width: 80%;                                         
            margin: 0 auto;
            padding: 10px;
            border-radius: 15px;    
            background-color: white;
            margin-top: 10px;
        }

        /*table {
            width: 80%;
            margin: 0 auto;
            margin-top: 40px;*/
            /*border-collapse: separate;*/
            /*border: none;*/
            /*border-spacing: 10px;*/
        /*}

        td {
            margin-left: 30px;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
        }

        tr {
            margin-top: 20px;
            border:1px solid white;
        }

        .form_container {
            background-color: blue;
            
        }*/
         #account-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 91%;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            /*padding: 10px;*/
            z-index: 1;
        }

        #account-menu a {
            display: block;
            color: #333;
            text-decoration: none;
            padding: 5px 8px;
        }

        #account-menu a:hover {
            background-color: #e87ecf;
            color: white;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" method="post">

        <div class="header_container">
            <span class="title van">HPA</span><span class="title survey"><b>Survey</b></span>
            <i class="fa-regular fa-circle-user fa-2x" onclick="return tkClick()"></i>
             <div id="account-menu">
                <a href="#" id="changeMK" onclick="changePassword()">Đổi mật khẩu</a>
                <a href="#" id="Logout" onclick="logout()">Đăng xuất</a>
            </div>
        </div>



        <div class="tab_container">
            <div class="tab">
                <button type="button" class="tab_btn">Form của tôi</button>
                <button type="button" class="tab_btn">Form được chia sẻ khảo sát</button>
                <div class="line"></div>
            </div>
        </div>

        <div class="tab_content active" id="tab1">
            <h3>Các Form khảo sát bạn hiện có:</h3>
            <div class="table_form" >
                <div class="title_container">
                    <p class="title_form title_stt"><b>STT</b></p>
                    <p class="title_form title_ten"><b>TÊN FORM</b></p>
                    <p class="title_form title_mt"><b>MÔ TẢ FORM</b></p>
                </div>

                <% if (listFormHT.Count == 0)
                    {
                        Response.Write($"<h4>Bạn chưa có Form khảo sát nào cả</h3>");
                    }
                    int i = 0;
                    foreach (var form in listFormHT)
                    {
                        i++;
                        Response.Write($"<div class=\"title_container title_detail\">\r\n   <p class=\"idForm_hidden\" hidden>{form.IdForm}</p>\r\n     <p class=\"title_form title_ten\">{i}</p>\r\n    <p class=\"title_form title_stt\">{form.TenForm}</p>\r\n    <p class=\"title_form title_mt\">{form.MoTa}</p> <i class=\"fa-regular fa-pen-to-square\"></i> <i class=\"fa-regular fa-trash-can\"></i>\r\n</div> ");
                        //Response.Write($"<div class=\"form_container\">fdfaf</div>");
                    } %>
            </div>
            <%--<table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên Form</th>
                        <th>Mô tả form</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (listForm.Count == 0)
                        {
                            Response.Write($"<h4>Bạn chưa có Form khảo sát nào cả</h3>");
                        }
                        int i = 0;
                        foreach (var form in listForm)
                        {
                            i++;
                            Response.Write($"<tr class=\"form_container\">\r\n    <td>{i}</td>\r\n    <td>{form.TenForm}</td>\r\n    <td>{form.MoTa}</td>\r\n</tr>");
                            //Response.Write($"<div class=\"form_container\">fdfaf</div>");
                        } %>
                </tbody>
            </table>--%>
            <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <% 
                if (listTenForm.Count == 0)
                {
                    Response.Write($"<h3>Bạn chưa có Form khảo sát nào cả</h3><h4>{Session["email"]}d</h4>");
                }
                foreach (var i in listTenForm)
                {
                    Response.Write($"<h3>{i}</h3>");
                } %>--%>
            <%--<button class="btn_themForm"><a href="trangKhaoSat.aspx" style="text-decoration: none;">Thêm Form mới</a></button>--%>
            <button id="btn_them" class="btn_themForm"><a href="#" style="text-decoration: none;">Thêm Form mới</a></button>
            <div class="modal" id="myModal">
                <div class="modal-content">
                    <p style="text-align: center; font-size: 24pt;"><b>Thêm Form mới</b></p>
                    <table style="margin: 0 auto;">
                        <tr>
                            <td><span>Tên Form</span></td>
                            <td><input class="txtTenForm" type="text" name="txtTenForm" value="" /></td>
                        </tr>
                        <tr>
                            <td><span>Mô tả</span></td>
                            <td><input class="txtMoTa" type="text" name="txtMTF" value="" /></td>
                        </tr>
                        <tr>
                            <td>
                                <input class="modal_input" type="submit" name="name" value="Thêm form" />
                            </td>
                            <td>
                                <input class="modal_input" type="button" id="btn_dongThemForm" name="name" value="Hủy" />
                            </td>
                        </tr>
                    </table>
                    <%--<span>Tên Form</span><input class="txtTenForm" type="text" name="name" value="" /><br />
                    <span>Mô tả</span><input class="txtMoTa" type="text" name="name" value="" /><br />--%>
              </div>
            </div>
        </div>
        <div class="tab_content" id="tab2">
            <h3>Content for Tab 2</h3>
            <p>This is the content for Tab 2.</p>
            <div class="table_form" >
                <div class="title_container">
                    <p class="title_form title_stt"><b>STT</b></p>
                    <p class="title_form title_ten"><b>TÊN FORM</b></p>
                    <p class="title_form title_mt"><b>MÔ TẢ FORM</b></p>
                </div>

                <% if (listFormYK.Count == 0)
                    {
                        Response.Write($"<h4>Bạn chưa có Form khảo sát nào cả</h3>");
                    }
                    int j = 0;
                    foreach (var form in listFormYK)
                    {
                        j++;
                        Response.Write($"<div class=\"khaoSat\">\r\n   <p class=\"idForm_hidden\" hidden>{form.IdForm}</p>\r\n     <p class=\"title_form title_ten\">{j}</p>\r\n    <p class=\"title_form title_stt\">{form.TenForm}</p>\r\n    <p class=\"title_form title_mt\">{form.MoTa}</p>\r\n</div>");
                        //Response.Write($"<div class=\"form_container\">fdfaf</div>");
                    } %>
            </div>  

        </div>


    </form>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const tabs = document.querySelectorAll('.tab_btn');
            const tabContents = document.querySelectorAll('.tab_content');

            tabs.forEach((tab, index) => {
                tab.addEventListener('click', (e) => {
                    tabs.forEach(tab => { tab.classList.remove("active") })
                    tab.classList.add('active')
                    var line = document.querySelector('.line');
                    line.style.width = e.target.offsetWidth + 'px';
                    console.log(e.target.offsetWidth);
                    line.style.left = e.target.offsetLeft + 'px';


                    tabContents.forEach(tab => { tab.classList.remove('active') })
                    tabContents[index].classList.add('active')
                })
            })
        });

        var menu = document.getElementById("account-menu");
        function tkClick() {
            if (menu.style.display === "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        }
        function changePassword() {
            window.location.href = "DoiMK.aspx";
        }

        function logout() {
            var confirmLogout = confirm("Bạn có chắc muốn đăng xuất?");
            if (confirmLogout) {
                // Chuyển hướng về trang đăng nhập
                window.location.href = "dangNhap.aspx";
            }
        }

        var modal = document.getElementById("myModal");
        

        // Get the button that opens the modal
        var btn = document.getElementById("btn_them");
        var btn_dongThemForm = document.getElementById("btn_dongThemForm")

        btn_dongThemForm.onclick = function () {
            modal.style.display = "none";
        }

        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }


        //Bấm xem form
        const suas = document.querySelectorAll(".fa-pen-to-square");

        // Lặp qua từng div và thêm sự kiện click
        suas.forEach(sua => {
            sua.addEventListener('click', function () {
                // Lấy nội dung của thẻ p đầu tiên bên trong div đó
                let content = this.closest(".title_detail").querySelector('.idForm_hidden').textContent;
                // Chuyển hướng đến trang khaoSat.aspx với tham số nội dung của thẻ p đầu tiên
                window.location.href = 'trangKhaoSat.aspx?content=' + encodeURIComponent(content);
            });
            //div.querySelector(".fa-trash-can").addEventListener("click", function() {
            //    window.location.href ="dangNhap.aspx"
            //})
        });


        //Bấm vào xóa form
        const xoas = document.querySelectorAll(".fa-trash-can")
        xoas.forEach(xoa => {
            xoa.addEventListener("click", function () {
                let content = this.closest(".title_detail").querySelector('.idForm_hidden').textContent;
                window.location.href = 'trangChu.aspx?xoa=' + encodeURIComponent(content);
            })
        })

        const divKS = document.querySelectorAll('.khaoSat');

        // Lặp qua từng div và thêm sự kiện click
        divKS.forEach(div => {
            
            div.addEventListener('click', function () {
                // Lấy nội dung của thẻ p đầu tiên bên trong div đó
                const content = this.querySelector('.idForm_hidden').textContent;
                // Chuyển hướng đến trang khaoSat.aspx với tham số nội dung của thẻ p đầu tiên
                window.location.href = 'khaoSat.aspx?content=' + encodeURIComponent(content);
            });
        });

        //document.addEventListener("click", function (event) {
        //    var target = event.target;
        //    if (target.classList.contains("title_container") && target.classList.contains("title_detail")) {
        //        // Phần tử mục tiêu là phần tử bạn muốn xử lý
        //        let hh = target.querySelector(".title_form .title_stt").textContent;
        //        window.location.href = "trangKhaoSat.aspx?stt=" + hh;
        //    }
        //});

        //let div_form = document.getElementById("div_form");
        //div_form.onclick = function () {
        //    window.location.href = "./trangKhaoSat.aspx"
        //}

        //document.addEventListener("DOMContentLoaded", function () {
        //    var elements = document.querySelectorAll(".title_container.title_detail");
        //    for (var i = 0; i < elements.length; i++) {
        //        elements[i].onclick = doi;
        //    }
        //});

        //function doi(h) {

        //        let hh = h.querySelector(".title_form .title_stt").innerText;
        //        window.location.href = "trangKhaoSat.aspx?stt=" + hh;
            
        //}

        //document.addEventListener('DOMContentLoaded', function () {
        //    var clickableDivs = document.querySelectorAll('.title_container .title_detail');
        //    clickableDivs.forEach(function (div) {
        //        div.addEventListener('click', function () {
        //            console.log("hâha");    
        //            //var stt = this.querySelector(".title_form .title_ten").textContent; // Lấy STT từ id của div
        //            var stt ="fdfs"; // Lấy STT từ id của div
        //            window.location.href = "trangKhaoSat.aspx?stt=" + "fdf"; // Chuyển đến trang SaveSttToSession.aspx với query parameter là STT của div
        //        });
        //    });
        //});
    </script>
</body>
</html>
