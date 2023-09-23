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

        <jsp:include page="footer.jsp" />
        <!-- end item -->
        

        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script src="static/js/index.js"></script>
</body>
</html>
