<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập tài khoản</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <!-- <script src="https://www.google.com/recaptcha/api.js" async defer></script> -->
        <!--        <link rel="stylesheet" type="text/css" href="../static/css/login.css">-->
    </head>
    <div class="container">
        <h2>Đăng nhập </h2>
        <form action="MainController" method="POST" id="form">
            <div class="form-group">
                <label for="userID">Tên đăng nhâp: </label>
                <input type="text"  id="userID" name="userID" required="">
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu :</label>
                <input type="password"  id="password" name="password" required="">
            </div>
          <!--  <div class="g-recaptcha" data-sitekey="6LdYPDYoAAAAAJYX_Nv5N4fwu1QJp6kO1qMKeKLH"></div>-->

            <div class="btn-container">
                <button type="submit" name="action" value="Login">Đăng nhập</button>
                <a href="login.jsp">Reset</a>
            </div>

           

        </form>
       <!-- <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("form");
                const error = document.getElementById("error");


                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    console.log("123")
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please tick not a robot!";
                    }
                });
            }
        </script> -->
        <div class="error_message">
            ${requestScope.ERROR}
        </div>    
        <div class="btn-container">
            Chưa có tài khoản ? <a href="register.jsp">Tạo tài khoản tại đây</a>
        </div>    


    </div>
</html>