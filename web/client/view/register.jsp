<%-- 
    Document   : register
    Created on : Sep 16, 2023, 12:01:22 AM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký tài khoản</title>
    </head>
    <body>
        <h1>Đăng ký</h1>
                <form action="register" method="post">
                    <input type="text" name="username" placeholder="Tên đăng nhập"/> <br>
                    <input type="email" name="email" placeholder="Gmail"/> <br>
                    <input type="number" name="phone" placeholder="Số điện thoại"/> <br>
                    <input type="password" name="password" placeholder="Mật khẩu"/> <br>
                    <input type="password" name="confirm" placeholder="Nhập lại mật khẩu"/> <br>
                    <input type="submit" value="Đăng ký" name="submit">
                </form>
                Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a>  
    </body>
</html>
