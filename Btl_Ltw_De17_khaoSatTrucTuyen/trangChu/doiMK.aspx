<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doiMK.aspx.cs" Inherits="Btl_Ltw_De17_khaoSatTrucTuyen.trangChu.doiMK" %>

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
        #form_changePW{
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
        .change-password{
            width: 250px;
            height: 30px;
            border-radius: 10px;
            color: black;
            padding-left: 10px;
            font-size: 12pt;

        }
        .change-password::placeholder{
            color: black;
            opacity: 0.5;
        }

        .form_save {
            width: 100%;
            display: flex;
            justify-content: center;
        }

 
        .form_save input{
            background-color: rgb(236, 22, 236);
            color: black;
    
            width: 100px;
            font-size: 12pt;
            font-weight: 600;
   
            padding: 6px 10px;
            transition: 0.25s ease-in-out;
            margin-top: 30px;
        }
        .form-save:hover{
            border: 1px solid #54a0ff;
        }

        .link_trangChu {
            height: 20px;
            width: 100%;
            display: flex;
            justify-content: end;
        }

        .link_trangChu a {
            font-size: 11pt;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <form action="DoiMK.aspx" id="form_changePW" method="post" runat="server" onsubmit="return check()">
            <h1 class="form-heading">Đổi mật khẩu</h1>
            <div class="form-group">
                <input type="password" class="change-password" placeholder="Mật khẩu hiện tại" name="txtMKHT" required/>
            </div>
            <div class="form-group">
                <input id="txtMKmoi" type="password" class="change-password" placeholder="Mật khẩu mới" name="txtMKM" required/>
            </div>
            <div class="form-group">
                <input id="txtNLMKmoi" type="password" class="change-password" placeholder="Nhắc lại mật khẩu mới" required/>
            </div>
            <div class="link_trangChu">
                <p><a href="trangChu.aspx">Quay lại trang chủ</a></p>
            </div>
            <div class="form_save">
                <input type="submit" value="Lưu"/>
            </div>
            
        </form>
    </div>
    <script>
        let matKhauM = document.getElementById("txtMKmoi");
        let nlMatKhauM = document.getElementById("txtNLMKmoi");
        function check() {
            let erorr = []
            if (matKhauM.value.trim() !== nlMatKhauM.value.trim()) {
                alert("Mât khẩu chưa khớp");
                return false;
            }
            else {
                alert("Đổi mật khẩu thành công!")
            }
        }
    </script>
</body>
</html>
