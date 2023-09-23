<%-- 
    Document   : header
    Created on : Sep 23, 2023, 1:46:24 AM
    Author     : HOANGDUC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/index.css">
    </head>
    <body>
         <div>
            <header>
                <div class="logo" >
                    <img  src="static/img/logoheadb.png">
                </div>
                <div class="search">
                    <input type="text" placeholder="Tìm kiếm...">
                    <button type="submit"><i class="fas fa-search"></i>
                    </button>
                </div>
                <div class="login">
                    <a href="MainController?action=LoginPage">Đăng nhập</a>
                </div>
            </header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center align-items-center  w-100 mr-auto">
                <div class="collapse navbar-collapse container " id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto ">
                    <li class="nav-item active">
                        <a class="nav-link" href="homePage.jsp">Trang chủ  <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="policy/IntroduceShop.jsp">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="#">Sản phẩm </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="#">Phụ kiện lòng chim</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="#">Đặt hàng theo yêu cầu </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="#">Liên hệ</a>
                    </li>
                  </ul>
                  
                </div>
                <div class="icons">
                    <a href="">giỏ hàng</a>
                    <a href="#" class="fas fa-shopping-cart"></a>
                </div>
              </nav>
        </div>
    </body>
</html>
