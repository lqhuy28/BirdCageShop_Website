

<%@page import="model.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký tài khoản</title>
    </head>
</head>
<div class="container">
    
    <div class="row">
        <div class="col-md-4">
            <form action="MainController" class="pt-5" method="POST">
                <%
                    UserError userError = (UserError) request.getAttribute("USER_ERROR");
                    if (userError == null) {
                        userError = new UserError();
                    }
                %>
                <h1>Đăng kí tài khoản</h1>
                <div class="form-group">
                    <label class= "label" for="userID">Tên đăng nhập</label>
                    <input type="text" name="userID" required="" /> <%=userError.getUserIDError()%> </br> 
                </div>
                <div class="form-group">
                    <label class="label" for="password">Mật khẩu</label>
                    <input type="password" name="password" required="" /> </br>
                </div>
                <div class="form-group">
                    <label class="label" for="confirm">Xác nhận</label>
                    <input type="password" name="confirm" required="" /> <%=userError.getConfirmError()%> </br>
                </div>
                <div class="form-group">
                    <label class="label" for="fulllName">Họ và tên</label>
                    <input type="text" name="fullName" required="" /> <%=userError.getFullNameError()%> </br>
                </div>
                <div class="form-group">
                    <label class="label" for="phone">Số điện thoại</label>
                    <input type="number" name="phone" required="" />
                </div>
                <div class="form-group">
                    <label class="label" for="email">Email</label>
                    <input type="email" name="email" required="" /> <%=userError.getEmailError()%> </br>
                </div>
                <div class="form-group">
                    <label class="label" for="address">Địa chỉ</label>
                    <input type="text" name="address" required="" /> <%=userError.getAddressError()%> </br>
                </div>
                <div class="form-group">
                    <label class="label" for="roleID">Role ID</label>
                    <input type="text" name="roleID" value="US" readonly="" />
                </div>

                <br>
                <div class="btn-container">
                    <button type="submit" class="btn btn-primary" name="action" value="Register">Tạo</button>
                    <a href="register.jsp">Reset</a>
                </div>
                <div class="btn-container">
                    Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
