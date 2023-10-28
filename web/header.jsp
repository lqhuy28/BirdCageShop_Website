<%-- 
    Document   : header
    Created on : Sep 23, 2023, 1:46:24 AM
    Author     : HOANGDUC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page import="model.Wishlist"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/index.css">
    </head>
    <body>
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 d-flex justify-content-start align-items-center">
                            <div class="header__top__left p-0 py-4">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> birdcage@gmail.com</li>
                                    <li>Cửa hàng bán lồng chim số 1 Việt Nam</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6  d-flex justify-content-end align-items-center">
                            <div class="header__top__right">
                                <div class="header__top__right__social">
                                    <a href="#"><i class="fa fa-brands fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-brands fa-twitter" ></i></a>
                                    <a href="#"><i class="fa fa-brands fa-linkedin" ></i></i></a>
                                    <a href="#"><i class="fa fa-brands fa-telegram" ></i></i></a>
                                </div>
                                <div class="header__top__right__language">
                                    <div>English</div>
                                    <span class="arrow_carrot-down"></span>
                                    <ul>
                                        <li><a href="#">Tiếng Việt</a></li>
                                        <li><a href="#">English</a></li>
                                    </ul>
                                </div>
                                <div class="header__top__right__auth">
                                    <% if (session.getAttribute("LOGIN_USER") == null) { %>
                                    <a href="login.jsp"><i class="fa fa-user"></i> Login</a>  
                                    <% } else { %>
                                    <nav class="header__menu">
                                        <ul>
                                            <li>
                                                <a href="#">${sessionScope.LOGIN_USER.fullName}</a>
                                                <ul class="header__menu__dropdown">
                                                    <li><a href="changeProfile?userID=${sessionScope.LOGIN_USER.userID}">Thông tin cá nhân</a></li>
                                                    <li><a href="OrderController">Đơn mua</a></li>
                                                    <li><a href="LogoutController">Đăng xuất</a></li>
                                                </ul> 
                                            </li>
                                        </ul>
                                    </nav> 
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-menu">
                <div class="row px-3">
                    <div class="col-2">
                        <div class="header__logo">
                            <a href="MainController"><img src="/Fall2023SWP391_NET1703_Group6/static/img/logoheada.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-8 text-center d-flex align-items-center justify-content-center">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="MainController">Trang chủ</a></li>
                                <li><a href="policy/IntroduceShop.jsp">Giới thiệu</a></li>
                                <li><a href="#">Sản phẩm </a>
                                    <ul class="header__menu__dropdown">
                                        <c:forEach items ="${listCC}" var ="o">
                                        <li><a href="category?cid=${o.categoryID}">${o.categoryName}</a></li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li><a href="">Blog</a></li>
                                <li><a href="OrderRequest">Đặt lồng theo yêu cầu</a></li>
                                <li><a href="">Liên hệ</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-2 d-flex align-items-center justify-content-end">
                        <div class="header__cart">
                            <%
                                List<Cart> cart = (List<Cart>) session.getAttribute("cart");
                                int cartSize = (cart != null) ? cart.size() : 0;
                            %>
                            <%
                                List<Wishlist> w = (List<Wishlist>) session.getAttribute("wishlist");
                                int wlSize = (w != null) ? w.size() : 0;
                            %>
                            <ul>
                                <li><a href="WishlistServlet"><i class="fa fa-heart"></i> <span><%= wlSize%></span></a></li>
                                <li><a href="viewCart.jsp"><i class="fa fa-shopping-bag"></i> <span><%= cartSize%></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
    </body>
</html>
