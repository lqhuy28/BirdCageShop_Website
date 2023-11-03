<%-- 
    Document   : ProductExcept
    Created on : Oct 31, 2023, 3:03:33 AM
    Author     : Acer
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <body>
        <jsp:include page="header.jsp" />
        <section class="featured spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>CHỌN SẢN PHẨM SO SÁNH </h2>
                        </div>
                    </div>
                </div>
                <div class="container-swiper">
                    <div class="swiper-button-prev"  style="top: 190px;left: -60px;"></div>
                    <div class="swiper-button-next" style="top: 190px;right: -60px;"></div>
                    <div class="row featured__filter swiper">
                        <div class="swiper-wrapper">
                            <% String id1 = (String)request.getAttribute("id1"); %>
                            <c:set var="listS" value="${requestScope.listS}" />
                            <c:forEach items="${listS}" var="x">
                                <c:if test="${x.status eq '1'}">
                                    <div class="col-lg-3 col-md-4 col-sm-6 swiper-slide">
                                        <div class="featured__item " data-aos="fade-up">
                                            <div class="featured__item__pic set-bg">
                                                <img src="${x.image}" alt="">

                                                <ul class="featured__item__pic__hover">
                                                    <!-- ảnh sản phẩm -->
                                                    <li><a href="CompareCage?id1=<%=id1%>&id2=${x.cageID}"><i class="fa-solid fa-code-compare"></i></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="featured__item__text">
                                                    <h6><strong><a href="#" title="View Product">${x.cageName}</a></strong></h6>
                                                    <div>
                                                        <span class="amount-old"><fmt:formatNumber value="${x.priceOld}" pattern="###,###"/> VNĐ</span> 
                                                    </div>
                                                    <span class="pro-price"><fmt:formatNumber value="${x.priceNew}" pattern="###,###"/> VNĐ</span>
                                                </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp" />
    </body>
    <script src="static/js/index.js"></script>
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
</html>
