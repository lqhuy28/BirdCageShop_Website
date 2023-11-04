<%-- 
    Document   : a
    Created on : Sep 30, 2023, 12:47:27 AM
    Author     : QUANG HUY
--%>

<%@page import="model.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
        <!-- /fonts -->
        <!-- css -->
        <link href="static/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="static/css/register.css" rel='stylesheet' type='text/css' media="all" />
        <link rel="stylesheet" href="static/css/root.css">
        <!-- /css -->
    </head>
    <body class="fade-in">
        <h1 class="w3ls">ĐĂNG KÝ</h1>
        <div class="content-w3ls">
            <div class="content-agile1">
                <h2 class="agileits1">BIRDCAGE</h2>
                <p class="agileits2">CỬA HÀNG BÁN LỒNG CHIM SỐ 1 VIỆT NAM</p>
            </div>
            <div class="content-agile2">
                <form action="MainController" method="post">
                    <%
                        UserError userError = (UserError) request.getAttribute("USER_ERROR");
                        if (userError == null) {
                            userError = new UserError();
                        }
                    %> 
                    <div class="form-control w3layouts"> 
                        <input type="text" id="UserID" name="userID" placeholder="Tên đăng nhập" required="">
                    </div>
                    <div class="error_message">
                        <%=userError.getUserIDError()%>
                    </div> 
                    <div class="form-control agileinfo">	
                        <input type="password" class="lock" name="password" placeholder="Mật khẩu" id="password" required="">
                    </div>	
                    <div class="error_message">
                        <%=userError.getPasswordError()%>
                    </div>

                    <div class="form-control agileinfo">	
                        <input type="password" class="lock" name="confirm" placeholder="Nhập lại mật khẩu" id="password" required="">
                    </div>
                    <div class="error_message">
                        <%=userError.getConfirmError()%>
                    </div> 
                    <div class="form-control agileinfo">	
                        <input type="text" class="lock" name="fullName" placeholder="Họ và tên" id="password" required="">
                    </div>
                    <div class="error_message">
                        <%=userError.getFullNameError()%>
                    </div> 
                    <div class="form-control agileinfo">	
                        <input type="number" class="lock" name="phone" placeholder="Số điện thoại" id="password" required="">
                    </div>
                    <div class="error_message">
                        <%=userError.getPhoneError()%>
                    </div> 

                    <div class="form-control agileinfo">	
                        <input type="email" class="lock" name="email" placeholder="Email" id="password" required="">
                    </div>
                    <div class="error_message">
                        <%=userError.getEmailError()%>
                    </div> 

                    <div class="form-control agileinfo">	
                        <input type="text" class="lock" name="address" placeholder="Địa chỉ" id="password" required="">
                    </div>
                    <div class="error_message">
                        <%=userError.getAddressError()%>
                    </div> 
                    <div class="form-control agileinfo">	
                        <input type="text" class="lock" name="roleID" value="User" hidden="" readonly="">
                    </div>
                    <div class="form-control agileinfo">	
                        <input type="text" class="lock" name="status" value="1" hidden="" readonly="">
                    </div>

                    <button type="submit" name="action" class="register" value="Register"> Đăng ký </button>
                </form>
                <div class="noLogin">
                    Đã có tài khoản? <a href="MainController?action=LoginPage">Đăng nhập</a>
                </div> 
            </div>
            <div class="clear"></div>
        </div>
    </body>
</html>
