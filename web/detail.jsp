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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/index.css">
    <title>Document</title>
</head>
<body>
    <!-- start header -->
    
    <div class="content">
        <!-- Sử dụng thẻ jsp:include để bao gồm header và footer -->
        <jsp:include page="header.jsp" />
    <!-- end header -->
    <div class="container bootdey">
        <div class="col-md-12">
        <section class="panel">
              <div class="panel-body detail">
                  <div class="col-md-6">
                      <div class="pro-img-details">
                          <img src="https://www.bootdey.com/image/550x380/FFB6C1/000000" alt="">
                      </div>
                      <div class="pro-img-list">
                          <a href="#">
                              <img src="https://www.bootdey.com/image/115x100/87CEFA/000000" alt="">
                          </a>
                       
                          </a>
                      </div>
                  </div>
                  <div class="col-md-6">
                      <h4 class="pro-d-title">
                          <a href="" class=""></a>
                      </h4>
                      <p>
                          Praesent ac condimentum felis. Nulla at nisl orci, at dignissim dolor, The best product descriptions address your ideal buyer directly and personally. The best product descriptions address your ideal buyer directly and personally.
                      </p>
                      <div class="product_meta">
                          <span class="posted_in"> <strong>Chất liệu:</strong> <a rel="tag" href=""></a></span>
                          <span class="tagged_as"><strong>Kích thước:</strong> <a rel="tag" href=""></a></span>
                      </div>
                      <div class="m-bot15"> <span class="amount-old">$544</span>  <span class="pro-price"> $300.00</span></div>
                      <div class="form-group">
                          <label>Số lượng</label>
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
