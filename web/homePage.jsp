<%-- 
    Document   : homePage
    Created on : Sep 22, 2023, 10:22:12 PM
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
        <!-- header -->
       
        <div>
            <header>
                <div class="logo">
                    <img src="client/static/img/logoHomepage.png">
                </div>
                <div class="search">
                    <input type="text" placeholder="Tìm kiếm...">
                    <button type="submit"><i class="fas fa-search"></i>
                    </button>
                </div>
                <div class="login">
                    <a href="#">Đăng nhập</a>
                </div>
            </header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center align-items-center  w-100 mr-auto">
                <div class="collapse navbar-collapse container " id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto ">
                    <li class="nav-item active">
                      <a class="nav-link" href="#">Trang chủ  <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Giới thiệu</a>
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
    <!-- end header -->

    <!--start home section-->
    <section class="home" id="home">
        <div class="swiper home-slider">
            <div class="swiper-wrapper wrapper">

                <div class="swiper-slide slide">
                    <div class="content">
                        <span>Best-Seller</span>
                        <a href="#order" class="btn"></a>
                    </div>
                    <div class="image">
                        <img src="images/jordan11.jpg" alt="">
                    </div>
                </div>

                <div class="swiper-slide slide">
                    <div class="content">
                        <span>Best-Seller</span>
                        <a href="#order" class="btn"></a>
                    </div>
                    <div class="image">
                        <img src="images/jordan12.webp" alt="">
                    </div>
                </div>

                <div class="swiper-slide slide">
                    <div class="content">
                        <span>Best-Seller</span>
                        <a href="#order" class="btn"></a>
                    </div>
                    <div class="image">
                        <img src="images/jd2.jpeg" alt="">
                    </div>
                </div>

            </div>
            <div class="swiper-pagination"></div>
        </div>

    </section>
    <!-- end home section-->

    <!-- start item -->
    <div>
        <h1>Sản phẩm bán chạy</h1>
        <div class="container">
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="bg-info text-white p-3">item</div>
                </div>
            </div>
        </div>
        <div>
            <h1>Sản phẩm mới </h1>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="bg-info text-white p-3">item</div>
                    </div>
                </div>
            </div>
        </div>

        
        <!-- end item -->
        <!-- start footer -->
        <footer class="footer">
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
            </footer>
        <!-- end footer -->

        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script src="static/js/index.js"></script>
</body>
</html>
