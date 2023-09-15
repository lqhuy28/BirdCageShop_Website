<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập tài khoản</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--        <link rel="stylesheet" type="text/css" href="../static/css/login.css">-->
    </head>
    <body>
                <h1>Đăng nhập</h1>
                <form action="login" method="post">
                    <input type="text" name="username" placeholder="Tên đăng nhập"> <br>
                    <input type="password" name="password" placeholder="Mật khẩu"> <br>
                    <input type="submit" value="Đăng nhập" name="submit">
                </form>
                <a href="homepage.html">Quên mật khẩu</a> </br>
                Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký</a>        
    </body>
</html>