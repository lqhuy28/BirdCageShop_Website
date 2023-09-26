<%-- 
    Document   : profile
    Created on : Sep 27, 2023, 3:47:37 AM
    Author     : HOANGDUC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/profile.css">
        <title>Document</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <body>
        <main class="col-md-10">
            <div class="container main ">
                <form action="updateUser" method="POST">
                    <table>
                        <tr>
                            <td>Tên đăng nhập</td>
                            <td>
                                <input value="${us.userID}" type="text" name="userID" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>Tên người dùng</td>
                            <td>
                                <input value="${us.fullName}" type="text" name="fullName">
                            </td>
                        </tr>
                        <tr>
                            <td>Mật khẩu</td>
                            <td>
                                <input value="${us.password}" type="text" name="password">
                            </td>
                        </tr>
                        <tr>
                            <td>Số điện thoại</td>
                            <td><input value="${us.phone}" type="text" name="phone"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input value="${us.email}" type="text" name="email"></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ</td>
                            <td><input value="${us.address}" type="text" name="address"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button name="updateUser" type="submit">Cập nhật</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </main>
    </body>
        <jsp:include page="footer.jsp" />
    </body>
</html>