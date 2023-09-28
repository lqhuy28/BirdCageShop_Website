<%-- 
    Document   : detail
    Created on : Sep 22, 2023, 10:26:55 PM
    Author     : HOANGDUC
--%>

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
        <jsp:include page="header.jsp" />
        <div class="container bootdey">
            <div class="col-md-12">
                <section class="panel">
                    <div class="panel-body">
                        <div class="col-md-6">
                            <div class="pro-img-details">
                                <img src="https://www.bootdey.com/image/550x380/FFB6C1/000000" alt="">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4 class="pro-d-title">
                                <strong> tryền tên sản phẩm vào đây </strong>
                            </h4>
                            <p>
                                Praesent ac condimentum felis. Nulla at nisl orci, at dignissim dolor, The best product descriptions address your ideal buyer directly and personally. The best product descriptions address your ideal buyer directly and personally.
                            </p>
                            <div class="product_meta">
                                <span class="posted_in"> <strong>Chất liệu</strong> <a rel="tag" href="#">Jackets</a></span>
                                <span class="tagged_as"><strong>Tags:</strong><a rel="tag" href="#">Jackets</a> </span>
                            </div>
                            <div class="m-bot15"> <strong>Price : </strong> <span class="amount-old">$544</span>  <span class="pro-price"> $300.00</span></div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="quantiy" placeholder="1" class="form-control quantity">
                            </div>
                            <p>
                                <button class="btn btn-round btn-danger" type="button"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                            </p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
