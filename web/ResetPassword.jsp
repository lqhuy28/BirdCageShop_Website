<%-- 
    Document   : a
    Created on : Sep 29, 2023, 11:54:16 PM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quên mật khẩu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
        <!-- /fonts -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css -->
        <link href="static/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="static/css/login.css" rel='stylesheet' type='text/css' media="all" />       
        <link rel="stylesheet" href="static/css/root.css">
        <!-- /css -->
    </head>
    <body class="fade-in">
        <h1 class="w3ls">Quên mật khẩu</h1>
        <div class="content-w3ls">
            <div class="content-agile1">
                <h2 class="agileits1">BIRDCAGE</h2>
                <p class="agileits2">CỬA HÀNG BÁN LỒNG CHIM SỐ 1 VIỆT NAM</p>
            </div>

            <div class="content-agile2">
                <form action="ResetPassword" method="post">

                    <div class="form-control w3layouts"> 
                        <input type="password" id="UserID" name="newPassword" placeholder="Nhập mật khẩu mới" required="">
                    </div>	
                    <div class="form-control w3layouts"> 
                        <input type="password" id="UserID" name="validPassword" placeholder="Xác nhận mật khẩu" required="">
                    </div>

                    <button type="submit" name="action" class="register" value="Login"> Xác nhận </button>


                    <div class="error_message">
                        ${requestScope.ERROR}
                    </div>
                </form>
            </div>
            <div class="clear"></div>
        </div>
    </body>
</html>
