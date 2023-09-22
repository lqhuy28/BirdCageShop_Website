<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập tài khoản</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <script src="https://www.google.com/recaptcha/api.js" async defer></script>-->
        <link rel="stylesheet" type="text/css" href="static/css/login.css">
    </head>
    <body>
        <div class="header">
            <div>
                <img src="static/img/logoheada.png">
            </div>
            <div>    
                <h2> Đăng Nhập </h2>
            </div>
        </div>

        <div class="body">
            <div class="logo"> 
                <img src="static/img/logobia.png">
            </div>
            <div class="login">
                <h1>Đăng nhập </h1>
                <form action="MainController" method="POST" id="form">
                    <div class="form-group">
                        <input type="text"  id="UserID" name="userID" placeholder="Tên đăng nhập" required="">
                    </div>
                    <div class="form-group">
                        <input type="password"  id="Password" name="password" placeholder="Mật khẩu" required="">
                    </div>
                    <div class="error_message">
                        ${requestScope.ERROR}
                    </div>
                    <!--                    <div class="g-recaptcha" data-sitekey="6LdYPDYoAAAAAJYX_Nv5N4fwu1QJp6kO1qMKeKLH"></div>-->
                    <div class="btn-container">
                        <button type="submit" name="action" value="Login">Đăng nhập</button>
                    </div>

                    
                </form>
                <div class="or">------------ Hoặc ------------</div>
                <div class="btn-container">
                    Chưa có tài khoản? <a href="register.jsp">Đăng ký</a>
                </div>    
            </div>    
        </div>

        <div class="footer">
            <div class="box-container">
                <div class="box">
                    <h3>THÔNG TIN CỬA HÀNG</h3>
                    <a href="homepage.html">Trang Chủ</a>
                    <a href="#">Giới Thiệu</a>
                    <a href="#">Liên Hệ</a>
                    <a href="#">Tin Tức</a>
                </div>

                <div class="box">
                    <h3>CHÍNH SÁCH</h3>
                    <a href="#">Chính Sách Chung</a>
                    <a href="#">Chính Sách Mua Hàng</a>
                    <a href="#">Chính Sách Đổi Trả</a>
                    <a href="#">Chính Sách Bảo Mật</a>
                </div>

                <div class="box">
                    <h3>LIÊN HỆ VỚI CHÚNG TÔI</h3>
                    <a href="#">Hotline: 0858.655.818</a>
                    <a href="#">Email: cageshop2023@gmail.com</a>
                    <a href="#">Facebook: fb.com/cageshop2023</a>
                    <a href="#">Thu Duc, HCM, VietNam</a>
                </div>

                <div class="box">
                    <h3>KẾT NỐI</h3>
                    <a href="#">Facebook</a>
                    <a href="#">Instagram</a>
                    <a href="#">Tiktok</a>
                    <a href="#">Shoppe</a>
                </div>
            </div>
</html>