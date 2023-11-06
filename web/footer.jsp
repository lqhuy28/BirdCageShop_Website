<%-- 
    Document   : footer
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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/index.css">
        <link rel="stylesheet" href="static/css/root.css">
    </head>
    <body>
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">


                            <ul>
                                <div class="footer__about__logo">
                                    <a href="MainController"><img src="static/img/logoheada.png" alt="" style="width: 70%;"></a>
                                </div>
                                <li style="font-weight: bold;">Địa chỉ: <span style="font-weight: normal;">TP Thủ Đức, TP HCM</span></li>
                                <li style="font-weight: bold;">Số điện thoại: <span style="font-weight: normal;">0123456789</span></li>
                                <li style="font-weight: bold;">Email: <span style="font-weight: normal;">birdcageshop@gmail.com</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-6 offset-lg-1">
                        <div class="footer__widget">

                            <ul>
                                <h6>VỀ CỬA HÀNG</h6>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="MainController">Trang chủ</a></li>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="IntroduceShop">Giới thiệu</a></li>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="#">Liên hệ</a></li>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="#">Tin tức</a></li>
                            </ul>
                            <h6>CHÍNH SÁCH CHUNG</h6>
                            <ul>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="generalPolicy">Chính Sách Chung </a></li>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="BuyPolicy">Chính Sách Mua Hàng</a></li>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="ReturnPolicy">Chính Sách Đổi Trả</a></li>
                                <li><i class="fa fa-light fa-forward fa-xs" style="color: #000000;"></i> <a href="PrivacyPolicy">Chính Sách Bảo Mật</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12">
                        <div class="footer__widget">
                            <h6>NHẬN ƯU ĐÃI KHỦNG </h6>
                            <p>Nhận thông tin email để đăng kí nhận ưu đãi mới nhất của chúng tôi</p>
                            <form action="#">
                                <input type="text" placeholder="Nhập email..." fdprocessedid="zvp6la">
                                <button type="submit" class="site-btn" fdprocessedid="oqfqel"><i class="fa-solid fa-paper-plane" style="color: #ffffff;"></i></button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fa fa-brands fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-brands fa-twitter" ></i></a>
                                <a href="#"><i class="fa fa-brands fa-linkedin" ></i></i></a>
                                <a href="#"><i class="fa fa-brands fa-telegram" ></i></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
