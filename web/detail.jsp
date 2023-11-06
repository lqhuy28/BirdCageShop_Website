<%-- 
    Document   : detail
    Created on : Sep 22, 2023, 10:26:55 PM
    Author     : HOANGDUC
--%>


<%@page import="java.text.DecimalFormat"%>
<%@page import="model.User"%>
<%@page import="model.FeedBack"%>
<%@page import="model.CageMaterial"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/detail.css">
        <link rel="stylesheet" href="static/css/root.css">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
        <title>Document</title>
    </head>
    <body class="fade-in">
        <%
            ProductDTO product = (ProductDTO) request.getAttribute("product");
            int quantityCart = (int) session.getAttribute("quantityCart");
            List<CageMaterial> cm = (List<CageMaterial>) request.getAttribute("cageMaterial");
            List<FeedBack> lF = (List<FeedBack>) request.getAttribute("feedback");
            User user = (User) session.getAttribute("LOGIN_USER");
            String userId = (String) request.getAttribute("userIDFeedback");
        %>
        <jsp:include page="header.jsp" />
        <div class="container bootdey">
            <div class="col-md-12">
                <%!
                    public String formatCurrency(double amount) {
                        DecimalFormat decimalFormat = new DecimalFormat("#,###");
                        return decimalFormat.format(amount) + " VNĐ";
                    }
                %>
                <section class="panel">
                    <div class="panel-body">
                        <div class="col-md-6">
                            <div class="pro-img-details">
                                <img src="<%=product.getImage()%>" alt="">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="pro-detail">
                                <h4 class="pro-d-title">
                                    <strong><%=product.getCageName()%> </strong>
                                </h4>
                                <div class="rate-container">
                                    <div class="rate-avg">
                                        3.9
                                    </div>
                                    <div class="star-rating">
                                        <span>★★★★☆</span>
                                    </div>
                                    <div>
                                        20 đánh giá
                                    </div>
                                </div>
                                <div class="m-bot15 detail-price mt-3 ">
                                    <span class="amount-old"><%= formatCurrency(product.getPriceOld())%></span>  
                                    <span class="pro-price" style="font-size: 35px"><%= formatCurrency(product.getPriceNew())%></span>
                                </div>    
                                <div class="mt-2">
                                    <strong>Mô tả sản phẩm: </strong>
                                    <p ><%=product.getCageDetails()%></p>
                                </div>
                                <div class="product_meta">
                                </div>

                                <form action="CartController" method="post" class="mt-3" id="buynow">
                                    <div class="form-group mt-3 detail-quantity-container">
                                        <label for="quantity">Số lượng</label>
                                        <div class="detail-quantity">
                                            <button type="button" id="minus-quantity">
                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                            </button>
                                            <input class="form-control" type="number" value="1" name="quantity" id="numberInput" readonly/>
                                            <button type="button" id="add-quantity">
                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                        <span id="quantityAvailable" class="mt-1"><%=product.getQuantity()%> sản phẩm sẳn có sẳn</span>
                                    </div>

                                </form>
                                <span hidden="true" id="quantityCart"><%=quantityCart%></span>
                                <form action="CartController" method="get" id="addcart">
                                    <input type="hidden" value="" name="quantity" id="hiddenInput">
                                    <input type="hidden" value="<%=product.getCageID()%>" name="id">
                                </form>
                                <form action="ProductExcept" method="get" id="compare">

                                    <input type="hidden" value="<%=product.getCageID()%>" name="id1">
                                </form>
                                <div class="buy-btn-group">

                                    <button type="submit" id="checkout" name="id" 
                                            form="buynow" value="<%=product.getCageID()%>" 
                                            class="btn  action-btn btn-round btn-danger"> 
                                        <i class="fa fa-credit-card" aria-hidden="true"></i>
                                        Mua ngay
                                    </button>

                                    <button id="addCart" type="submit"
                                            form="addcart" 
                                            class="btn  action-btn btn-round btn-warning">
                                        <i class="fa fa-shopping-cart"></i>
                                        Thêm vào giỏ hàng
                                    </button>

                                    <button type="submit" id="compare"
                                            form="compare" 
                                            class="btn  action-btn btn-round btn-success">
                                        <i class="fa-solid fa-code-compare"></i>
                                        So sánh
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="material " data-aos="fade-up">
                <h4 class="pro-d-title">
                    <strong>Thành phần lồng chim </strong>
                </h4>                <div class="table-responsive">
                    <table class="table material-table">
                        <thead>
                            <tr>
                                <th class="text-center">Nguyên liệu</th>
                                <th class="text-center">Số lượng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (CageMaterial c : cm) {
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

            <div class="table-responsive"  data-aos="fade-up">
                <div class="feedback-section">
                    <h4 class="pro-d-title">
                        <strong><i class="fa-solid fa-comment"></i> Đánh giá sản phẩm</strong>
                    </h4>   
                    <% for (FeedBack f : lF) {%>
                    <div class="feedback-item">
                        <p><%=f.getFeedbackDate()%></p>
                        <div class="feedback-header">
                            <div class="feedback-user">
                                <%=f.getFullName()%>
                            </div>

                            <div class="star-rating">
                                <div class="stars">
                                    <% int rate = Integer.parseInt(f.getRating()); %>
                                    <% for (int i = 0; i < rate; i++) {
                                    %>
                                    <span class="starD">&#9733;</span>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                        <div class="feedback-content">
                            <%=f.getComment()%>
                        </div>
                    </div>
                    <% }%>
                    <%
                        int check = 0;
                        if (userId != null) {
                            if (user.getUserID().equals(userId)) {
                                check = 1;
                            }
                        }%>

                    <% if (check == 1) {%>
                    <form action="FeedbackController" method="post">
                        <div class="stars">
                            <span class="star" onclick="rate(1)">&#9733;</span>
                            <span class="star" onclick="rate(2)">&#9733;</span>
                            <span class="star" onclick="rate(3)">&#9733;</span>
                            <span class="star" onclick="rate(4)">&#9733;</span>
                            <span class="star" onclick="rate(5)">&#9733;</span>
                        </div>
                        <input type="hidden" value="<%=product.getCageID()%>" name="id">
                        <input type="hidden" value="0" name="rate" id="rate">
                        <input type="text" value="" name="feedback"><input type="submit" value="Gửi phản hồi">
                    </form>
                    <% }%>

                </div>
            </div>

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
        </div>
        <jsp:include page="footer.jsp" />
    </body>
    <script>
        const checkoutItem = document.getElementById("checkout");
        const addCartItem = document.getElementById("addCart");

        const numberInput = document.getElementById('numberInput');

        const hiddenInput = document.getElementById('hiddenInput');
        hiddenInput.value = numberInput.value;
        numberInput.addEventListener('input', function () {

            let newValue = this.value;

            hiddenInput.value = newValue;
        });


        checkoutItem.addEventListener("click", function () {
            location.reload();
            const quantityAvailableItem = document.getElementById("quantityAvailable");
            const quantityCartItem = document.getElementById("quantityCart");
            const quantityAvailable = parseInt(quantityAvailableItem.innerText);
            const quantityCart = parseInt(quantityCartItem.innerText);
            const quantityOrdered = document.getElementsByName("quantity")[0];
            const quantityOrder = quantityOrdered.value;

            if (parseInt(quantityOrder) < 1) {
                alert("Invalid amount");
                event.preventDefault();
            }
            if ((parseInt(quantityOrder) + quantityCart) > quantityAvailable) {
                alert("Not enough in stock");
                event.preventDefault();
            }

        });

        const addQuantity = document.getElementById("add-quantity");
        const minusQuantity = document.getElementById("minus-quantity");
        const quantityAvailableItem = document.getElementById("quantityAvailable");
        const quantityAvailable = parseInt(quantityAvailableItem.innerText);
        const quantityOrdered = document.getElementsByName("quantity")[0];
        const quantityOrder = quantityOrdered.value;
        addQuantity.addEventListener("click", function () {
            if (parseInt(quantityOrdered.value) < quantityAvailable) {
                quantityOrdered.value = parseInt(quantityOrdered.value) + 1;
                hiddenInput.value = quantityOrdered.value;
            }
        });
        minusQuantity.addEventListener("click", function () {
            if (parseInt(quantityOrdered.value) > 1) {
                quantityOrdered.value = parseInt(quantityOrdered.value) - 1;
                hiddenInput.value = quantityOrdered.value;
            }
        });


//        window.addEventListener('pageshow', function (event) {
//            if (event.persisted) {
//                location.reload();
//                // page loaded after back navigation
//            } else {
//                // normal page load
//            }
//        });
//        window.addEventListener('popstate', () => {
//            window.location = '/ProductDetail';
//        });
    </script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
        $('.carousel').carousel({
            interval: 5000
        })
    </script>
    <script>
        var currentRating = 0;

        function rate(stars) {
            currentRating = stars;
            document.getElementById('rate').value = currentRating;

            // Đặt màu sáng cho các sao được chọn
            for (var i = 1; i <= 5; i++) {
                var starElement = document.getElementsByClassName('star')[i - 1];
                if (i <= stars) {
                    starElement.classList.add('checked');
                } else {
                    starElement.classList.remove('checked');
                }
            }
        }
    </script>
</html>