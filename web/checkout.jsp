<%-- 
    Document   : test1
    Created on : Oct 7, 2023, 12:44:33 AM
    Author     : QUANG HUY
--%>

<%@page import="model.User"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="static/css/checkout.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="static/css/root.css">
        <title>Trang thanh toán</title>
    </head>
    <body class="fade-in ">
        <jsp:include page="header.jsp"/>
        <div class="sm-container">
            <div class="container">
                <h3 class="title">
                    <i class="fa-solid fa-shopping-cart"></i>
                    Thanh toán Đơn Hàng
                </h3>
            </div>
            <div class="container mt-2 mb-3">
                <div class="row form__container">

                    <div class="col-md-6 ">
                        <form action="CheckoutController" method="post" id="myForm">
                            <%
                                User u = (User) session.getAttribute("LOGIN_USER");
                            %>
                            <div class="add-material">
                                <div style="grid-column: span 2;">
                                    <h4 class="title1"><i class="fa-solid fa-user fa-sm"></i> Thông tin khách hàng:</h4>
                                </div>
                                <div class="form-container">
                                    <label>Họ và tên:</label> 
                                    <span class="form-name"><%= u.getFullName()%></span>
                                </div>
                                <div class="form-container">
                                    <label>Số điện thoại:</label> 
                                    <input class="form-control" type="text" value="<%= u.getPhone()%>" name="phone">
                                </div>
                                <div class="form-container">
                                    <label>Địa chỉ:</label> 
                                    <input class="form-control" type="text" value="<%= u.getAddress()%>" name="address">
                                </div>
                            </div>

                            <div class="add-material">
                                <h4 for="shippingMethod" class="title1"><i class="fa-solid fa-truck-fast fa-sm"></i> Đơn vị vận chuyển:</h4>
                                <select id="shippingMethod" class="form-control" name="shippingMethod">
                                    <option value="standard">Giao hàng tiết kiệm</option>
                                    <option value="express">Giao hàng nhanh</option>
                                    <option value="self_pickup">Nhận hàng tại shop</option>
                                </select>
                            </div>

                            <div class="add-material">
                                <h4 class="title1"><i class="fa-regular fa-credit-card fa-sm"></i> Phương thức thanh toán:</h4>
                                <div class="form-group form-check">
                                    <label class="beauty-checkbox">
                                        <input class="form-check-input" type="checkbox" id="cash" name="paymentMethod" value="cash" checked>
                                        <span class="checkmark"></span>
                                    </label>
                                    <label  class="check-label "><span for="cash">Thanh toán khi nhận hàng</span></label><br>
                                </div>
                                <div class="form-group form-check">
                                     <label class="beauty-checkbox">
                                        <input  class="form-check-input" type="checkbox" id="paypal" name="paymentMethod" value="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label  class="check-label "><span for="paypal">VNPAY</span></label><br>
                                </div>
                            </div>
                            <input type="hidden" id="totalPrice" name="totalPrice">
                            <input type="hidden" id="shipCost" name="shipCost" value="">

                        </form>
                    </div>

                    <div class="col-md-6 ">
                        <div class="material">
                            <div class="material-list">
                                <%
                                    double total = 0.0;
                                    double price = 0.0;
                                    List<Cart> cart = (List<Cart>) session.getAttribute("cart");
                                    if (!cart.isEmpty()) {
                                %>
                                <h4 class="title1" >TÓM TẮT ĐƠN HÀNG:</h4>
                                <div class="">
                                    <div style="width: 100%;" class="order-item">
                                        <%
                                            for (Cart item : cart) {
                                                price = (item.getPrice() * item.getQuantity());
                                                total += price;
                                        %>
                                        <div class="price-item">
                                            <div class="price-item-name">
                                            <span><%= item.getQuantity()%></span>
                                            x
                                            <span><%= item.getCageName()%></span>
                                            </div>
                                            <span class="price-item-total"><%= (item.getPrice() * item.getQuantity())%> VNĐ</span>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="ship">
                                <div class="bold-left">
                                    <label id="shipping-fee">Phí giao hàng:</label>
                                    <span>
                                        <span id="shipping-fee-value">10</span>
                                        <span>VNĐ</span>
                                    </span>
                                </div>
                                <div class="bold-left">
                                    <label id="total-payment">Tổng thanh toán:</label>
                                    <span>
                                        <span id="totalP"><%=(int) total%></span>
                                        <span>
                                            VNĐ
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <div class="but-check mt-3"">
                                <button id="submitBtn" class="btn btn-success custom-button" value="Thanh toán">
                                    <i class="fas fa-shopping-cart"></i>
                                    <span class=" button-text">Thanh toán</span>
                                </button>
                            </div>
                        </div>
                    </div>
                  
                </div>

            </div>
        </div>

        <jsp:include page="footer.jsp"/>               
        <script>
            const submitBtn = document.getElementById('submitBtn');
            const myForm = document.getElementById('myForm');

            submitBtn.addEventListener('click', function () {
                myForm.submit();

            });

            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function () {
                    // Loại bỏ lựa chọn tất cả các checkboxes trừ checkbox hiện tại
                    checkboxes.forEach(otherCheckbox => {
                        if (otherCheckbox !== checkbox) {
                            otherCheckbox.checked = false;
                        }
                    });
                });
            });

            // Lấy element chứa tổng số tiền
            const totalElement = document.getElementById('totalP');
            const feeElement = document.getElementById('shipping-fee-value');
            const total = totalElement.innerText;
            const select = document.getElementById('shippingMethod');
            
            document.getElementById("shipCost").value = 30000;
            
            if (select.value === 'standard') {
                // option standard được chọn
                let totalNumber = parseInt(total);
                let total1 = totalNumber + 30000;
                console.log(total1);
                feeElement.innerText = 30000;
                totalElement.innerText = total1;
                document.getElementById("totalPrice").value = totalElement.innerText;
            } else {
                // option khác được chọn
                console.log('Option khác được chọn');
            }
            // Lắng nghe sự kiện thay đổi giá trị của select shippingMethod
            document.querySelector('#shippingMethod').addEventListener('change', (event) => {
                // Lấy giá trị được chọn
                const method = event.target.value;
                // Xác định phụ phí tương ứng
                let fee;
                if (method === 'standard') {
                    fee = 30000;
                } else if (method === 'express') {
                    fee = 40000;
                } else {
                    fee = 0;
                }
                feeElement.innerText = fee;
                const totalNumber = parseInt(total);
                // Tính lại tổng số tiền và cập nhật DOM
                const total1 = totalNumber + fee;
                totalElement.innerText = total1;
                document.getElementById("totalPrice").value = totalElement.innerText;
                document.getElementById("shipCost").value = fee;
            });
        </script>       


    </body>
</html>
