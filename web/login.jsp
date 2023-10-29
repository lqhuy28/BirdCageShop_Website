<%-- 
    Document   : a
    Created on : Sep 29, 2023, 11:54:16 PM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập</title>
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
        <!-- Kiểm tra và hiển thị thông báo nếu có -->
        <c:if test="${not empty requestScope.SUCCESS_MESSAGE}">
            <div id="success-message">
            <div class="toast toast--success">
                <div class="toast__icon">
                    <i class="fas fa-solid fa-circle-check" style="color: #1eff00;"></i>
                </div>
                <div class="toast__body">
                    <h3 class="toast__title">Thành công</h3>
                    <p class="toast__msg">${requestScope.SUCCESS_MESSAGE}</p>
                </div>
                <div class="toast__close">
                    <i class="fas fa-times"></i>
                </div>   
            </div>
        </div>
        </c:if>

        <h1 class="w3ls">ĐĂNG NHẬP</h1>
        <div class="content-w3ls">
            <div class="content-agile1">
                <h2 class="agileits1">BIRDCAGE</h2>
                <p class="agileits2">CỬA HÀNG BÁN LỒNG CHIM SỐ 1 VIỆT NAM</p>
            </div>
            <div class="content-agile2">
                <form action="MainController" method="post">
                    <div class="form-control w3layouts"> 
                        <input type="text" id="UserID" name="userID" placeholder="Tên đăng nhập" required="">
                    </div>

                    <div class="form-control agileinfo">	
                        <input type="password" class="lock" name="password" placeholder="Mật khẩu" id="password" required="">
                    </div>	
                    <div class="forgot">
                        <a href="#"> Quên mật khẩu?</a>
                    </div>

                    <button type="submit" name="action" class="register" value="Login"> Đăng nhập </button>
                    <div class="error_message">
                        ${requestScope.ERROR}
                    </div>
                </form>
                <div class="noLogin">
                    Chưa có tài khoản? <a href="register.jsp">Đăng ký</a>
                </div> 
                <p class="wthree w3l">--------- HOẶC ---------</p>
                <ul class="social-agileinfo wthree2">
                    <li><a href="#"><i class="fa fa-brands fa-facebook"></i></a></li>
                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/Fall2023SWP391_NET1703_Group6/LoginGoogleController&response_type=code
                           &client_id=242838873945-fafllo7gm5ups4aejqla1t4mievr9kov.apps.googleusercontent.com&approval_prompt=force"><i class="fa fa-brands fa-google-plus"></i></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <script>
            // Lấy thẻ div thành công bằng ID
            var successMessage = document.getElementById('success-message');

            // Nếu thẻ tồn tại, thực hiện hiệu ứng
            if (successMessage) {
                // Thiết lập thời gian 5 giây (5000 mili giây) cho hiển thị
                setTimeout(function () {
                    // Ẩn thẻ div
                    successMessage.style.display = 'none';
                }, 5000);
            }
        </script>
    </body>
</html>
