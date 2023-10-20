<%-- 
    Document   : detail
    Created on : Sep 22, 2023, 10:26:55 PM
    Author     : HOANGDUC
--%>

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
        <title>Document</title>
    </head>
    <body>
        <%
            ProductDTO product = (ProductDTO) request.getAttribute("product");
            int quantityCart = (int) session.getAttribute("quantityCart");
            List<CageMaterial> cm = (List<CageMaterial>)request.getAttribute("cageMaterial");
        %>
        <jsp:include page="header.jsp" />
        <div class="container bootdey">
            <div class="col-md-12">
                <section class="panel">
                    <div class="panel-body">
                        <div class="col-md-6">
                            <div class="pro-img-details">
                                <img src="<%=product.getImage()%>" alt="">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <h4 class="pro-d-title">
                                <strong><%=product.getCageName()%> </strong>
                            </h4>
                            <p>
                                <%=product.getCageDetails()%>
                            </p>
                            <div class="product_meta">
                            </div>
                            <div class="m-bot15"> <strong>Price : </strong> <span class="amount-old"><%=product.getPriceOld()%></span>  <span class="pro-price"> <%=product.getPriceNew()%></span></div>
                            <strong>Cage Material : </strong>
                            <% for (CageMaterial c : cm) {
                            %>
                            <p><%=c.getMaterialName()%> : <%=c.getQuantity()%></p>
                                <% } %>
                            <form action="CartController" method="post">
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <input class="form-control" type="number" value="1" name="quantity" id="numberInput">
                                </div>
                                </br>
                                <span id="quantityAvailable"><%=product.getQuantity()%> sản phẩm sẳn có sẳn</span>
                                <p>
                                    <button type="submit" id="checkout" name="id" value="<%=product.getCageID()%>" class="btn btn-round btn-danger"> Mua ngay</button>
                                </p>
                            </form>
                            <span hidden="true" id="quantityCart"><%=quantityCart%></span>
                            <form action="CartController" method="get">
                                <input type="hidden" value="" name="quantity" id="hiddenInput">
                                <input type="hidden" value="<%=product.getCageID()%>" name="id">
                                <button id="addCart" type="submit" class="btn btn-round btn-warning"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
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
    });




</script>
</html>
