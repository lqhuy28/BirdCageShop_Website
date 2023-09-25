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
       
       <div class="content">
        <!-- Sử dụng thẻ jsp:include để bao gồm header và footer -->
        <jsp:include page="header.jsp" />
    <!-- end header -->

    <!--start home section-->
    <!-- start hero -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>DANH SÁCH SẢN PHẨM</span>
                        </div>
                        <ul>
                            <li><a href="#">Lồng chim chào mào </a></li>
                            <li><a href="#">Lồng chim cu</a></li>
                            <li><a href="#">Lồng chim khuyên </a></li>
                            <li><a href="#">Lồng khướu</a></li>
                            <li><a href="#">Lồng vẹt</a></li>
                            <li><a href="#">Lồng chim sâu</a></li>
                            <li><a href="#">Lồng chim họa mi</a></li>
                            <li><a href="#">Lồng chim sơn ca</a></li>
                            <li><a href="#">Lồng chim sáo </a></li>
                            <li><a href="#">Lồng chim chích chòe</a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    Tất cả danh mục
                                </div>
                                <input type="text" placeholder="Tìm kiếm sản phẩm..." fdprocessedid="5py24">
                                <button type="submit" class="site-btn" fdprocessedid="6hi3um">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>Hỗ trợ 24/7</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg"
                        style="background-image: url(&quot;img/hero/banner.jpg&quot;);">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br>100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end hero -->
    <!-- start featured -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm bán chạy</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".oranges">Lồng tre </li>
                            <li data-filter=".fresh-meat">Lồng trần </li>
                            <li data-filter=".vegetables">Lồng vuông</li>
                            <li data-filter=".fastfood">Lồng tam giác</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg">
                            <img src="../../general/img/logobia.png" alt="">

                            <ul class="featured__item__pic__hover">
                                <!-- ảnh sản phẩm -->
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Tên sản phẩm</a></h6>
                            <h5>Giá sản phẩm</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end featured -->
    <!-- start banner -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../../general/img/logobia.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end banner -->
    <!-- start blog -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>Blog nuôi chim</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="" alt="">
                        </div>
                        <div class="blog__item__text">
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="" alt="">
                        </div>
                        <div class="blog__item__text">
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="" alt="">
                        </div>
                        <div class="blog__item__text">
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end bloog -->

        <jsp:include page="footer.jsp" />
        <!-- end item -->
        

        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script src="static/js/index.js"></script>
</body></html>
