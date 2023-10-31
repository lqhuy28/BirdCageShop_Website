
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bird Cage Shop</title>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
            />
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/index.css">
        <link rel="stylesheet" href="static/css/root.css">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
    </head>
    <body class="fade-in">
        <!-- header -->
        <!-- Kiểm tra và hiển thị thông báo thành công nếu có -->
        <c:if test="${not empty sessionScope.SUCCESS_MESSAGE}">
            <div style="color: green;">
                ${sessionScope.SUCCESS_MESSAGE}
            </div>
        </c:if>

        <div class="content">
            <!-- Sử dụng thẻ jsp:include để bao gồm header và footer -->
            <jsp:include page="header.jsp" />
            <!-- end header -->

            <!--start home section-->
            <!-- start hero -->
            <section class="hero  ">
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
                            <div class="hero__item set-bg" >
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

                                    <div class="carousel-inner">
                                        <div class="carousel-item active" style="background-image: url(https://c4.wallpaperflare.com/wallpaper/404/390/382/cages-cityscape-window-digital-art-wallpaper-preview.jpg);">
                                            <div class="hero__text" >
                                                <span>BIRD CAGE 3</span>
                                                <h2>Lồng chim <br>số 1 Việt Nam </h2>
                                                <p>Lồng chim luôn có sẳn để hỗ trợ khạch hàng</p>
                                                <a href="#" class="primary-btn">SHOP NOW</a>
                                            </div>
                                        </div>
                                        <div class="carousel-item" style="background-image: url(https://images.unsplash.com/photo-1680971661953-476b0c800faa?auto=format&fit=crop&q=80&w=1976&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);">
                                            <div class="hero__text" >
                                                <span>BIRD CAGE 1</span>
                                                <h2>Lồng chim <br>số 1 Việt Nam </h2>
                                                <p>Lồng chim luôn có sẳn để hỗ trợ khạch hàng</p>
                                                <a href="#" class="primary-btn">SHOP NOW</a>
                                            </div>
                                        </div>
                                        <div class="carousel-item"  style="background-image: url(https://images.unsplash.com/photo-1540818767417-e2437dc12c3d?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);"> 
                                            <div class="hero__text">
                                                <span>BIRD CAGE 2</span>
                                                <h2>Lồng chim <br>số 1 Việt Nam </h2>
                                                <p>Lồng chim luôn có sẳn để hỗ trợ khạch hàng</p>
                                                <a href="#" class="primary-btn">SHOP NOW</a>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
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
                                <h2> PHỤ KIỆN LỒNG CHIM </h2>
                            </div>
                        </div>
                    </div>
                    <div class="container-swiper">
                        <div class="row featured__filter swiper">
                            <% if (request.getAttribute("ERROR") != null) {%>
                            <p> Không tìm thấy kết quả </p>

                            <% } else {%> 
                            <div class="swiper-wrapper">

                                <c:set var="listS" value="${requestScope.listS}" />
                                <c:forEach items="${listS}" var="x">
                                    <c:if test="${x.status eq '1'}">
                                        <div class="col-lg-3 col-md-4 col-sm-6 swiper-slide">
                                            <div class="featured__item " data-aos="fade-up">
                                                <div class="featured__item__pic set-bg">
                                                    <img src="${x.image}" alt="">

                                                    <ul class="featured__item__pic__hover">
                                                        <!-- ảnh sản phẩm -->
                                                        <li><a href="WishlistServlet?id=${x.cageID}&type=home"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="CartController?id=${x.cageID}&quantity=1&type=home"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a href="ProductDetail?id=${x.cageID}"><i class="fa-solid fa-circle-info"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="featured__item__text">
                                                    <h6><strong><a href="#" title="View Product">${x.cageName}</a></strong></h6>
                                                    <div>
                                                        <span class="amount-old">${x.priceOld} VNĐ</span> 
                                                    </div>
                                                    <span class="pro-price"> ${x.priceNew} VNĐ</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>        
                            <% }%>
                        </div>
                    </div>
            </section>
            <section class="featured spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <h2> LỒNG CHIM CHÀO MÀO  </h2>
                            </div>
                        </div>
                    </div>
                    <div class="container-swiper">
                        <div class="row featured__filter swiper">
                            <% if (request.getAttribute("ERROR") != null) {%>
                            <p> Không tìm thấy kết quả </p>

                            <% } else {%> 
                            <div class="swiper-wrapper">

                                <c:set var="listS" value="${requestScope.listS}" />
                                <c:forEach items="${listS}" var="x">
                                    <c:if test="${x.status eq '1'}">
                                        <div class="col-lg-3 col-md-4 col-sm-6 swiper-slide">
                                            <div class="featured__item " data-aos="fade-up">
                                                <div class="featured__item__pic set-bg">
                                                    <img src="${x.image}" alt="">

                                                    <ul class="featured__item__pic__hover">
                                                        <!-- ảnh sản phẩm -->
                                                        <li><a href="WishlistServlet?id=${x.cageID}&type=home"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="CartController?id=${x.cageID}&quantity=1&type=home"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a href="ProductDetail?id=${x.cageID}"><i class="fa-solid fa-circle-info"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="featured__item__text">
                                                    <h6><strong><a href="#" title="View Product">${x.cageName}</a></strong></h6>
                                                    <div>
                                                        <span class="amount-old">${x.priceOld} VNĐ</span> 
                                                    </div>
                                                    <span class="pro-price"> ${x.priceNew} VNĐ</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>        
                            <% }%>
                        </div>
                    </div>
            </section>
            <section class="featured spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <h2>LỒNG CU GÁY  </h2>
                            </div>
                        </div>
                    </div>
                    <div class="container-swiper">

                        <div class="row featured__filter swiper">
                            <% if (request.getAttribute("ERROR") != null) {%>
                            <p> Không tìm thấy kết quả </p>

                            <% } else {%> 
                            <div class="swiper-wrapper">

                                <c:set var="listS" value="${requestScope.listS}" />
                                <c:forEach items="${listS}" var="x">
                                    <c:if test="${x.status eq '1'}">
                                        <div class="col-lg-3 col-md-4 col-sm-6 swiper-slide">
                                            <div class="featured__item " data-aos="fade-up">
                                                <div class="featured__item__pic set-bg">
                                                    <img src="${x.image}" alt="">

                                                    <ul class="featured__item__pic__hover">
                                                        <!-- ảnh sản phẩm -->
                                                        <li><a href="WishlistServlet?id=${x.cageID}&type=home"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="CartController?id=${x.cageID}&quantity=1&type=home"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a href="ProductDetail?id=${x.cageID}"><i class="fa-solid fa-circle-info"></i></a></li>
                                                    </ul>
                                                </div>

                                                <div class="featured__item__text">
                                                    <h6><strong><a href="#" title="View Product">${x.cageName}</a></strong></h6>
                                                    <div>
                                                        <span class="amount-old">${x.priceOld} VNĐ</span> 
                                                    </div>
                                                    <span class="pro-price"> ${x.priceNew} VNĐ</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>        
                            <% }%>
                        </div>
                    </div>
            </section>
            <section class="featured spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <h2> LỒNG CU GÁY   </h2>
                            </div>
                        </div>
                    </div>
                    <div class="container-swiper">
                        <div class="row featured__filter swiper">
                            <% if (request.getAttribute("ERROR") != null) {%>
                            <p> Không tìm thấy kết quả </p>

                            <% } else {%> 
                            <div class="swiper-wrapper">

                                <c:set var="listS" value="${requestScope.listS}" />
                                <c:forEach items="${listS}" var="x">
                                    <c:if test="${x.status eq '1'}">
                                        <div class="col-lg-3 col-md-4 col-sm-6 swiper-slide">
                                            <div class="featured__item " data-aos="fade-up">
                                                <div class="featured__item__pic set-bg">
                                                    <img src="${x.image}" alt="">

                                                    <ul class="featured__item__pic__hover">
                                                        <!-- ảnh sản phẩm -->
                                                        <li><a href="WishlistServlet?id=${x.cageID}&type=home"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="CartController?id=${x.cageID}&quantity=1&type=home"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a href="ProductDetail?id=${x.cageID}"><i class="fa-solid fa-circle-info"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="featured__item__text">
                                                    <h6><strong><a href="#" title="View Product">${x.cageName}</a></strong></h6>
                                                    <div>
                                                        <span class="amount-old">${x.priceOld} VNĐ</span> 
                                                    </div>
                                                    <span class="pro-price"> ${x.priceNew} VNĐ</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>        
                            <% }%>
                        </div>
                    </div>
            </section>
            <!-- Slider main container -->
            <%-- <div class="swiper">
            <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                    <!-- Slides -->
                    <div class="swiper-slide">Slide 1</div>
                    <div class="swiper-slide">Slide 2</div>
                    <div class="swiper-slide">Slide 3</div>
                    
                </div>

                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div> --%>


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
                        <div class="col-lg-4 col-md-4 col-sm-6" data-aos="zoom-in-up" >
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
                        <div class="col-lg-4 col-md-4 col-sm-6" data-aos="zoom-in-up">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="https://images.unsplash.com/photo-1444464666168-49d633b86797?auto=format&fit=crop&q=80&w=2069&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <h5><a href="#">10 Loài chim cảnh đẹp nhất Việt Nam</a></h5>
                                    <p>Việt Nam là một trong những quốc gia có nhiều loài chim cảnh đẹp nhất thế giới. Dưới đây là 10 loài chim cảnh đẹp nhất Việt Nam mà bạn nên biết.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6" data-aos="zoom-in-up">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="https://images.unsplash.com/photo-1497206365907-f5e630693df0?auto=format&fit=crop&q=80&w=2080&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <h5><a href="#">Hạt giống chim cảnh</a></h5>
                                    <p>Chim cảnh là những loài chim được nuôi để thưởng thức vẻ đẹp của chúng. Để có được những chú chim cảnh đẹp, người nuôi cần phải chọn những hạt giống chim cảnh tốt nhất.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end bloog -->

            <jsp:include page="footer.jsp" />
            <!-- end item -->



            <!--            <script src="static/js/index.js"></script>-->
            <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script>
                AOS.init();
                $('.carousel').carousel({
                    interval: 5000
                })
                new Swiper('.swiper', {
                    direction: 'horizontal',
                    loop: true,
                    spaceBetween: 24,
                    slidesPerView: 4,

                    // If we need pagination
                    pagination: {
                        el: '.swiper-pagination',
                    },

                    // Navigation arrows
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },

                    // And if we need scrollbar
                    scrollbar: {
                        el: '.swiper-scrollbar',
                    },
                });

            </script>
    </body>
</html>
