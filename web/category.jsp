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
                                    <li><a href="category.jsp">Lồng chim chào mào </a></li>
                                    <li><a href="category.jsp">Lồng chim cu</a></li>
                                    <li><a href="category.jsp">Lồng chim khuyên </a></li>
                                    <li><a href="category.jsp">Lồng khướu</a></li>
                                    <li><a href="category.jsp">Lồng vẹt</a></li>
                                    <li><a href="category.jsp">Lồng chim sâu</a></li>
                                    <li><a href="category.jsp">Lồng chim họa mi</a></li>
                                    <li><a href="category.jsp">Lồng chim sơn ca</a></li>
                                    <li><a href="category.jsp">Lồng chim sáo </a></li>
                                    <li><a href="category.jsp">Lồng chim chích chòe</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="hero__search">
                                <div class="hero__search__form">
                                    <form action="#">
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
                           
                            <section class="">
                                <div class="container">
                                    <div class="row">
                                    </div>
                                    <div class="row featured__filter">
                                        <div class="col-lg-3 col-md-4 col-sm-6">
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
                        </div>
                    </div>
            </section>
            <!-- end hero -->

            <jsp:include page="footer.jsp" />
            <!-- end item -->


            <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
            <script src="static/js/index.js"></script>
    </body>
</html>
