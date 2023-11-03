<%-- 
    Document   : compareCage
    Created on : Oct 28, 2023, 2:31:51 AM
    Author     : QUANG HUY
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page import="model.CageMaterial"%>
<%@page import="model.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/compareCage.css">

        <title>So sánh sản phẩm</title>
    </head>
    <jsp:include page="header.jsp" />

    <body>
        <%
            ProductDTO product1 = (ProductDTO) request.getAttribute("product1");
            ProductDTO product2 = (ProductDTO) request.getAttribute("product2");
            List<CageMaterial> cm1 = (List<CageMaterial>) request.getAttribute("cageMaterial1");
            List<CageMaterial> cm2 = (List<CageMaterial>) request.getAttribute("cageMaterial2");
        %>
        </br>
        <h2><strong><i class="fa-solid fa-code-compare"></i> So sánh lồng chim</strong></h2>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="info__Cage1">   
                        <div class="pro-img-details">
                            <img src="<%=product1.getImage()%>" alt="" style="width: 30%;">
                        </div>
                        <h4 class="pro-d-title">
                            <strong><%=product1.getCageName()%></strong>
                        </h4>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <div class="rate-container">
                            <div class="rate-avg">
                                3
                            </div>
                            <div class="star-rating">
                                <span>★★★☆☆</span>
                            </div>
                            
                        </div>
                        <div class="m-bot15 detail-price mt-3 ">
                            <span class="amount-old"><fmt:formatNumber value="<%=product1.getPriceOld()%>" pattern="###,###"/> VNĐ</span>  
                            <br>
                            <span class="pro-price"><fmt:formatNumber value="<%=product1.getPriceNew()%>" pattern="###,###"/> VNĐ</span>
                        </div> 
                        <div class="detail__cage1">
                            <strong>Mô tả sản phẩm: <span><%=product1.getCageDetails()%></span> </strong>
                        </div>
                    </div>

                    <div class="mate__Cage1">
                        <h4>Nguyên liệu lồng chim</h4>
                        <hr><!-- comment -->
                        <!-- Hiển thị nguyên liệu lồng chim từ cageMaterial1 -->
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Nguyên liệu</th>
                                    <th>Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (CageMaterial c : cm1) {
                                %>
                                <tr>
                                    <td class="text-center text-lg text-medium"><%=c.getMaterialName()%></td>
                                    <td class="text-center text-lg text-medium"><%=c.getQuantity()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="info__Cage2">
                        <div class="pro-img-details">
                            <img src="<%=product2.getImage()%>" alt="" style="width: 30%;">
                        </div>
                        <h4 class="pro-d-title">
                            <strong><%=product2.getCageName()%></strong>
                        </h4>
                        <!-- Hiển thị thông tin sản phẩm -->
                        <div class="rate-container">
                            <div class="rate-avg">
                                4.0
                            </div>
                            <div class="star-rating">
                                <span>★★★★☆</span>
                            </div>
                            
                        </div>
                        <div class="m-bot15 detail-price mt-3 ">
                            <span class="amount-old"><fmt:formatNumber value="<%=product2.getPriceOld()%>" pattern="###,###"/> VNĐ</span>  
                            <br>
                            <span class="pro-price"><fmt:formatNumber value="<%=product2.getPriceNew()%>" pattern="###,###"/> VNĐ</span>
                        </div> 
                        <div class="detail__cage2">
                            <strong>Mô tả sản phẩm: <span><%=product2.getCageDetails()%></span> </strong>
                        </div>
                    </div>
                    <div class="mate__Cage2">
                        <h4>Nguyên liệu lồng chim</h4>
                        <hr>
                        <!-- Hiển thị nguyên liệu lồng chim từ cageMaterial1 -->
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Nguyên liệu</th>
                                    <th>Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (CageMaterial c : cm2) {
                                %>
                                <tr>
                                    <td class="text-center text-lg text-medium"><%=c.getMaterialName()%></td>
                                    <td class="text-center text-lg text-medium"><%=c.getQuantity()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
                            <div class="btn__buy">
        <button id="goBack2StepsButton" type="submit"  
                class="btn action-btn btn-round btn-success backtwo"><i class="fa-solid fa-cart-shopping"></i> Tiếp tục mua hàng</button>
        </div>
        <script>
            const goBack2StepsButton = document.getElementById("goBack2StepsButton");
            goBack2StepsButton.addEventListener("click", function () {
                window.history.go(-2);
            });
        </script>   
    </body>
    <jsp:include page="footer.jsp" />

</html>