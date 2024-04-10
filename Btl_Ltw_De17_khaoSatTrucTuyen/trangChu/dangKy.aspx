<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangKy.aspx.cs" Inherits="Btl_Ltw_De17_khaoSatTrucTuyen.trangChu.dangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{

            background-color: rgb(161, 155, 155);
        }
        #wrapper{
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #form_signUp{
            width: 300px;
            height: 300px;
            background: rgba(228, 214, 214, 0.8);
            /* align-items: center; */
            padding: 30px 30px 40px;
            /* box-shadow: 0px 0px 17px 2px rgba(255, 255, 255, 0.8); */
        }
        .form-heading{
            font-size: 25px;
            color: #131010;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group{
            margin-top: 20px;
            /* margin-bottom: 20px; */
           width: 300px;
           display: flex;
           justify-content: space-around;
           align-items: center;
   

        }
        .form-group i{
            color: black;
            font-size: 14px;
            padding-top: 5px;
            padding-right: 10px;
        }
        .form-input{
            width: 250px;
            height: 30px;
            border-radius: 10px;
            color: black;
            padding-left: 10px;
            font-size: 12pt;

        }
        .form-input::placeholder{
            color: black;
            opacity: 0.5;
        }

        .form_submit {
            width: 100%;
            display: flex;
            justify-content: center;
        }

 
        .form_submit input{
            background-color: rgb(236, 22, 236);
            color: black;
    
            width: 100px;
            font-size: 12pt;
            font-weight: 600;
   
            padding: 6px 10px;
            transition: 0.25s ease-in-out;
            margin-top: 30px;
        }
        .form-submit:hover{
            border: 1px solid #54a0ff;
        }

        .link_dangKy {
            height: 20px;
            width: 100%;
            display: flex;
            justify-content: end;
        }

        .link_dangKy a {
            font-size: 11pt;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <form action="dangKy.aspx" id="form_signUp" method="post" runat="server" onsubmit="return check()">
            <h1 class="form-heading">Đăng ký</h1>
            <div class="form-group">
                <input type="email" class="form-input" placeholder="Email" name="txtEmail" required/>
            </div>
            <div class="form-group">
                <input id="txtMatKhau" type="password" class="form-input" placeholder="Mật khẩu" name="txtMatKhau" required/>
            </div>
            <div class="form-group">
                <input id="txtNLMK" type="password" class="form-input" placeholder="Nhắc lại mật khẩu" required/>
            </div>
            <div class="link_dangKy">
                <p><a href="dangNhap.aspx">Quay lại đăng nhập</a></p>
            </div>
            <div class="form_submit">
                <input type="submit" value="Đăng ký"/>
            </div>
            
        </form>
    </div>
    <script>
        let matKhau = document.getElementById("txtMatKhau");
        let nlMatKhau = document.getElementById("txtNLMK");
        function check() {
            let erorr = []
            if (matKhau.value.trim() !== nlMatKhau.value.trim()) {
                alert("Mât khẩu chưa khớp");
                return false;
            }
            else {
                alert("Đăng ký tài khoản thành công!")
            }
        }
    </script>
</body>
</html>