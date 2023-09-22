<%-- 
    Document   : register
    Created on : Sep 16, 2023, 12:01:22 AM
    Author     : QUANG HUY
--%>
<%@page import="model.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký tài khoản</title>
        <link rel="stylesheet" type="text/css" href="static/css/register.css">
    </head>
    <body>
        <div class="header">
            <div>
                <img src="static/img/logoheada.png">
            </div>
            <div>    
                <h2> Đăng Ký </h2>
            </div>
        </div>
        <div class="body">
            <div class="logo"> 
                <img src="static/img/logobia.png">
            </div>
            <div class="container">
                <h1>Đăng ký</h1>
                <form action="MainController" method="POST" id="form">
                <%
                    UserError userError = (UserError) request.getAttribute("USER_ERROR");
                    if (userError == null) {
                        userError = new UserError();
                    }
                %>   
                    <div>
                        <input type="text" id="UserID" name="userID" placeholder="Tên đăng nhập" required=""> 
                        <div class="error_message">
                            <%=userError.getUserIDError()%>
                        </div>  
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="Password" name="password" placeholder="Mật khẩu" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="confirm" name="confirm" placeholder="Nhập lại mật khẩu" required="">
                        <div class="error_message">
                            <%=userError.getConfirmError()%>
                        </div> 
                    </div>    
                    <div>
                        <input type="text" id="FullName" name="fullName" placeholder="Họ và tên" required=""> 
                        <div class="error_message">
                            <%=userError.getFullNameError()%>
                        </div> 
                    </div>

                    <div class="form-group">
                        <input type="number"  id="Phone" name="phone" placeholder="Số điện thoại" required=""> 
                    </div>

                    <div>
                        <input type="text"  id="Email" name="email" placeholder="Email" required=""> 
                        <div class="error_message">
                            <%=userError.getEmailError()%>
                        </div> 
                    </div> 
                    <div>
                        <input type="text"  id="Address" name="address" placeholder="Địa chỉ" required=""> 
                        <div class="error_message">
                            <%=userError.getAddressError()%>
                        </div> 
                    </div>   
                    <div class="form-group">
                        <input type="text" name="roleID" value="User" hidden="" readonly="" /></br>
                    </div>    


                    <div class="btn-container">
                        <button type="submit"  name="action" value="Register">Đăng ký</button>
                    </div>
                    <div class="or">------------ Hoặc ------------</div>
                    <div class="btn-container">
                        Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="footer">
            <div class="box-container">
                <div class="box">
                    <h3>VỀ CỬA HÀNG</h3>
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
                    <h3>LIÊN HỆ CHÚNG TÔI</h3>
                    <a href="#">Hotline: 0858.655.818</a>
                    <a href="#">Email: cageshop2023@gmail.com</a>
                    <a href="#">Facebook: fb.com/cageshop2023</a>
                    <a href="#">Address: Thu Duc, HCM, VietNam</a>
                </div>

                <div class="box">
                    <h3>THANH TOÁN</h3>
                    <img src="static/img/thanhtoan.jpg">
                    <h3>ĐƠN VỊ VẬN CHUYỂN</h3>
                    <img src="static/img/foot1.jpg">
                    <img src="static/img/foot2.jpg">
                    <img src="static/img/foot3.jpg">
                    <img src="static/img/foot4.jpg">
                    <img src="static/img/foot5.jpg">
                    <img src="static/img/foot6.jpg">

                </div>

                <!--                <div class="box">
                                        <h3>KẾT NỐI</h3>
                                    <a href="#">Facebook</a>
                                    <a href="#">Instagram</a>
                                    <a href="#">Tiktok</a>
                                    <a href="#">Shoppe</a>
                                </div>-->
            </div>
    </body>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          