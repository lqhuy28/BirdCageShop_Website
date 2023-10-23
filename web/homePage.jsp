<%-- 
    Document   : homePage
    Created on : Sep 22, 2023, 10:22:12 PM
    Author     : HOANGDUC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bird Cage Shop</title>
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
                                    <span>PHÂN LOẠI SẢN PHẨM</span>
                                </div>
                                <ul>
                                    <c:forEach items ="${listCC}" var ="o">
                                    <li><a href="category?cid=${o.categoryID}">${o.categoryName}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="hero__search">
                                <div class="hero__search__form">
                                    <form action="search" method="GET">
                                        <input type="text" name="search" placeholder="Tìm kiếm sản phẩm..." fdprocessedid="5py24">
                                        <button type="submit" class="site-btn" fdprocessedid="6hi3um">SEARCH</button>
                                    </form>
                                </div>
                                <div class="hero__search__phone">
                                    <div class="hero__search__phone__icon">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <div class="hero__search__phone__text">
                                        <h5>+84 85.999.999</h5>
                                        <span>Hỗ trợ 24/7</span>
                                    </div>
                                </div>
                            </div>
                            <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg"
                                 style="background-image: url(https://c4.wallpaperflare.com/wallpaper/404/390/382/cages-cityscape-window-digital-art-wallpaper-preview.jpg);">
                                <div class="hero__text">
                                    <span>BIRD CAGE </span>
                                    <h2>Lồng chim <br>số 1 Việt Nam </h2>
                                    <p>Lồng chim luôn có sẳn để hỗ trợ khạch hàng</p>
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
                                <h2>SẢN PHẨM BÁN CHẠY</h2>
                            </div>
                            <div class="featured__controls">
                                <ul>
                                    <li >Lồng chim Khuyên </li>
                                    <li >Lồng chim Chào mào </li>
                                    <li >Lồng chim Sâu  </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row featured__filter">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg">
                                    <img src="static/img/logobia.png" alt="">

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
            <section class="featured spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <h2>DANH SÁCH SẢN PHẨM </h2>
                            </div>
                        </div>
                    </div>
                    <div class="row featured__filter">
                        <c:set var="listS" value="${requestScope.listS}" />
                        <c:forEach items="${listS}" var="x">
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg">
                                        <img src="${x.image}" alt="">

                                        <ul class="featured__item__pic__hover">
                                            <!-- ảnh sản phẩm -->
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            <li><a href="ProductDetail?id=${x.cageID}"><i class="fa-solid fa-circle-info"></i></a></li>
                                        </ul>
                                    </div>

                                    <div class="featured__item__text">
                                        <h6><a href="#" title="View Product">${x.cageName}</a></h6>
                                        <h5>${x.priceNew} VNĐ</h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </section>

            <!-- end featured -->
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
                        <div class="col-lg-4 col-md-4 col-sm-6" >
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="static/img/blog1.png" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <h5><a href="https://nguoiyeuchimcanh.blogspot.com/2023/09/nuoi-chao-mao.html">10 Bí quyết nuôi chim chào mào hót hay</a></h5>
                                    <p>Việc nuôi chim chào mào và làm cho chúng hót hay đòi hỏi kiên nhẫn, hiểu biết về loài chim này và sự quan tâm đều đặn. Dưới đây là một số bí quyết để </p>
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
            
    </body>
</html>
