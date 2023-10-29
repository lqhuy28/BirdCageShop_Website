<%-- 
    Document   : viewCart
    Created on : Sep 27, 2023, 12:11:32 AM
    Author     : Admin
--%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/viewCart.css">       
        <link rel="stylesheet" href="static/css/root.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body class="fade-in">
        <jsp:include page="header.jsp"/>
        <%
            List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        %>
        <div class="container mt-3">
            <h2>Giỏ hàng</h2>
            <% if (cart == null) { %>
            <div class="cart__container">
                < GIỎ HÀNG TRỐNG >
            </div>
            <% } %>
        </div>

        <% if (cart != null) { %>
        <div class="padding-bottom-3x my-3 container cart__container" >
            <!-- Shopping Cart-->
            <div class="table-responsive shopping-cart">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th class="text-center">Số lượng</th>
                            <th class="text-center">Đơn giá</th>
                            <th class="text-center">Thành tiền</th>
                            <th class="text-center"><a class="btn btn-sm btn-outline-danger" href="RemoveCart?action=deleteAll">Xóa tất cả</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            double total = 0.0;
                            if (cart != null) {
                                NumberFormat nf = NumberFormat.getNumberInstance(Locale.US);

                                for (Cart item : cart) {
                                    double price = item.getPrice();
                                    double totalPrice = price * item.getQuantity();

                                    String formattedPrice = nf.format(price);
                                    String formattedTotalPrice = nf.format(totalPrice);
                                    total += totalPrice;
                        %>
                        <tr>
                            <td>
                                <div class="product-item">
                                    <a class="product-thumb" href="#"><img src="<%= item.getImage()%>" alt="Product"></a>
                                    <div class="product-info">
                                        <h4 class="product-title"><a href="#"><%= item.getCageName()%></a></h4><span><em>Mã: </em><%= item.getCageID()%></span>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center text-lg text-medium  ">
                                <div class="detail-quantity-container ">
                                    <div class="detail-quantity">
                                       <button type="button" id="minus-quantity">
                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                        </button>
                                        <input class="form-control" type="number" value="<%= item.getQuantity()%>" name="quantity" id="numberInput" required="">
                                        <input type="hidden" id="id" name="id" value="<%= item.getCageID()%>">
                                         <button type="button" id="add-quantity">
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                    </div>

                                </div>
                            </td>
                            <td class="text-center text-lg text-medium"><%= formattedPrice%> VNĐ</td>
                            <td class="text-center text-lg text-medium"><%= formattedTotalPrice%> VNĐ</td>
                            <td class="text-center">
                                <a class="remove-from-cart" href="RemoveCart?id=<%= item.getCageID()%>" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="shopping-cart-footer">

                <h5 class="column text-lg cart__total" ">
                    Tổng thanh toán: <span class="text-medium cart__price__total" ><%= nf.format(total)%> VNĐ</span>
                </h5>

            </div>
            <div class="shopping-cart-footer cart__bottom">
                <div class=""><a class="btn btn-warning btn-action" href="MainController"><i class="fas fa-sharp fa-light fa-right-to-bracket"></i> Tiếp tục mua hàng</a></div>
                <% if (!cart.isEmpty()) { %>
                <div class=""><a class="btn btn-success btn-action" href="CheckoutController"><i class="fas fa-shopping-cart"></i>  Thanh toán</a></div>
                <% } %>
            </div>
            <%
                }
            %> 

        </div>
        <% }%>
        <jsp:include page="footer.jsp" />
        <script>
            const addQuantityBtn = document.getElementById('add-quantity');
            const minusQuantityBtn = document.getElementById('minus-quantity');
            const quantityInput2 = document.getElementById('numberInput');
            const id = document.getElementById('id');
            addQuantityBtn.addEventListener('click', function () {
                quantityInput2.value = parseInt(quantityInput2.value) + 1;
                var event = new Event('change');
                quantityInput2.dispatchEvent(event);
                window.location.href = "ReloadCart?id=" + id.value + "&quantity=" + quantityInput2.value;
            });
            minusQuantityBtn.addEventListener('click', function () {
                if (parseInt(quantityInput2.value) > 1) {
                    quantityInput2.value = parseInt(quantityInput2.value) - 1;
                    var event = new Event('change');
                    quantityInput2.dispatchEvent(event);
                    window.location.href = "ReloadCart?id=" + id.value + "&quantity=" + quantityInput2.value;
                }
            });
        </script>
    </body>
</html>