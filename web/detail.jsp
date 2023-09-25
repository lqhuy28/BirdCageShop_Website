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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- css link -->
        <link rel="stylesheet" href="static/css/detail.css">
        <title>Document</title>
    </head>
    <body>
        <!-- start header -->
        body class="main-layout">
        <!--loader-->  
        <div class="loader_bg">
            <div class="loader"><img src="static/images/loading.gif" alt="#" /></div>
        </div>
        <!-- end loader -->
        <!-- header -->
        <section style="background-color: #eee;">
            <div class="container py-5">
                <%@ include file="headerProfile.jsp" %> 
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="my-3"></h5>
                                <p class="text-muted mb-0">Số dư:</p>
                                <a href="./VNPAY/index.jsp"><button class="btn btn-primary">Nạp tiền</button></a>
                                <button id="s5" class="btn btn-primary" >Cập nhật thông tin</button>
                                <div class="d-flex justify-content-center mb-2">
                                    <!-- <button type="button" class="btn btn-primary">Follow</button>
                                         <button type="button" class="btn btn-outline-primary ms-1">Message</button> -->
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="col-lg-8">

                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Họ và Tên</p>
                                    </div>
                                    <form id="updateUser" action="./UpdateProfile" method="post"></form>
                                    
                                    <div class="col-sm-9">
                                        <p id="s1" class="text-muted mb-0"></p>
                                        <p><input pattern="^[\p{L}\s]+" title="Tên không được chữa ký tự đặc biệt" name="name" form="updateUser" id="a1" style="display: none" type="text" class="form-control" required value=""/></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p> 
                                    </div>
                                    <div class="col-sm-9">
                                        <p id="s2" class="text-muted mb-0"></p>
                                        <p><input id="a2" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" form="updateUser" style="display: none"  type="text" class="form-control" readonly value=""/></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row"
                                    <div class="col-sm-3">
                                        <p  class="mb-0">Số điện thoại</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p id="s3" class="text-muted mb-0"></p>
                                        <p><input name="phone" id="a3" pattern="[0-9]{10,11}" form="updateUser" style="display: none" type="text" class="form-control" required value="$"/></p>
                                    </div>
                                </div> 
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p  class="mb-0">Địa chỉ</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p id="s4" class="text-muted mb-0"></p>
                                        <p><input name="address" id="a4" pattern="[a-zA-ZÀ-ỹ0-9\s,'-]{3,}" form="updateUser" style="display: none" type="text" class="form-control" required value=""/></p>
                                    </div>
                                </div><hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                    </div>
                                    <div class="col-sm-9">
                                        <button id="a5" form="updateUser" style="display: none" class="btn btn-primary" type="submit">Cập nhật</button>

                                    </div>
                                </div>

                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </section>
                
    </body>
</html>
