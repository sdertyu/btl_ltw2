<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangNhap.aspx.cs" Inherits="Btl_Ltw_De17_khaoSatTrucTuyen.trangChu.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{

            background-color: #E0EEE0;
        }
        #wrapper{
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #form_login{
            width: 300px;
            height: 300px;
            background: #CDB5CD;
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
            color: white;
    
            width: 100px;
            font-size: 12pt;
            font-weight: 600;
   
            padding: 6px 8px;
            transition: 0.25s ease-in-out;
            margin-top: 30px;
        }
        /*.form-submit:hover{
            border: 1px solid #54a0ff;
            color: green;
        }*/
        .form_submit input:hover{
            border: 1px solid #54a0ff;
            color: green;
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
        .link_dangKy a:hover {
            color: red;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <form action="dangNhap.aspx" id="form_login" runat="server" method="post" onsubmit="return check()"> 
            <h1 class="form-heading">Đăng nhập</h1>
            <div class="form-group">
                
                <input type="email" class="form-input" placeholder="Email" name="sEmail" required>
            </div>
            <div class="form-group">
                
                <input type="password" class="form-input" placeholder="Mật khẩu" name="sMatKhau" required>
                
            </div>
            <div class="link_dangKy">
                <p>Bạn chưa có tài khoản? <a href="dangKy.aspx">Đăng ký ngay</a></p>
            </div>
            <div class="form_submit">
                <input type="submit" value="Đăng nhập">
            </div>
            
        </form>
    </div>
    <script>
        
    </script>
</body>
</html>