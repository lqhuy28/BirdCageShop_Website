<%-- 
    Document   : orderManager
    Created on : Oct 17, 2023, 12:55:58 AM
    Author     : QUANG HUY
--%>
<%@page import="model.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/showProduct.css">
        <link rel="stylesheet" href="static/css/root.css">
    </head>
    <body class="fade-in">
        <header>
            <div class="logo">
                <img src="static/img/logoheadb.png">
            </div>

            <div class="login">
                <a class="fas fa-sign-out-alt " href ="MainController?action=Logout"></a>
            </div>
        </header>
        <div class="bodya">
            <div class="row">
                <div class="col-md-2">
                    <aside class=" dashboard__sider" >
                        <div class="admin">
                            <img src="static/img/admin1.png" width="200px">
                            <div>
                                <p>
                                    <b>${sessionScope.LOGIN_USER.fullName}</b>
                                    <br>Chào mừng bạn quay trở lại
                                </p>
                            </div>
                        </div>
                        <hr>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <div class="icon-integration" style="margin-left: 18px;">
                                    <div class="icon">
                                        <i class="fa-solid fa-weight-hanging" style="color: #ffffff;"></i>                            
                                    </div>

                                    <div class="title">
                                        <a class="nav-link" href="DashboardManager"><span>Quản lí sản phẩm</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i>                            
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="ManagerOrderManager"><span>Quản lí đơn hàng</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-comments" style="color: #ffffff;"></i>                            
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="FeedbackManagerManager"><span>Kiểm tra phản hồi</span></a>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </aside>
                </div>

                <main class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="breadcrumb">
                                <a href="ShowProduct.jsp"><b>Danh sách sản phẩm</b></a>
                            </div>
                            <div id="clock"></div>
                        </div>


                    </div>

                    <div class="container">
                        <%
                            ProductDAO dao = new ProductDAO();
                            List<ProductDTO> listS = (List<ProductDTO>) request.getAttribute("listS");
                            if (listS == null) {
                                listS = dao.SearchProduct("");
                                request.setAttribute("listS", listS);

                            }
                        %>
                        <div class="add">

                            <div class="search-container">
                                <form action="SearchProductDashboard" method="POST" class="form-inline">
                                    <div class="form-group">
                                        <input type="text" name="search" class="form-control"/>
                                    </div>
                                    <button type="submit" name="action" value="Search" class="fa fa-solid fa-magnifying-glass"> </button>
                                </form>
                            </div>
                            <div class="addpro">
                                <a href="AddProduct.jsp">Tạo sản phẩm</a>  
                            </div>
                        </div>
                        <% if (request.getAttribute("ERROR") != null) {%>
                        <p> Không tìm thấy kết quả </p>
                        <% } else {%>
                        <c:set var="listS" value="${requestScope.listS}" />
                        <c:if test="${not empty listS}">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Mã sản phẩm</th>
                                        <th scope="col">Danh mục</th>
                                        <th scope="col">Tên sản phẩm</th>
                                        <th scope="col">Thông tin sản phẩm</th>
                                        <th scope="col">Giá mới</th>
                                        <th scope="col">Giá cũ</th>
                                        <th scope="col">Hình ảnh</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Tình trạng</th>
                                        <th scope="col">Chức năng</th>


                                    </tr>
                                </thead>
                                <c:forEach items="${listS}" var="x">
                                    <tr>
                                        <td>${x.cageID}</td>
                                        <td>${x.categoryID}</td>
                                        <td>${x.cageName}</td>
                                        <td>${x.cageDetails}</td>
                                        <td><fmt:formatNumber value="${x.priceNew}" pattern="###,###"/> VNĐ</td>
                                        <td><fmt:formatNumber value="${x.priceOld}" pattern="###,###"/> VNĐ</td>
                                        <td><img src="${x.image}" style="width: 100px; height: auto;"></td>
                                        <td>${x.quantity}</td>
                                        <td>${x.status}</td>


                                        <td>
                                            <div class="btn-group">
                                                <a href="update?sid=${x.cageID}" class="btn btn-success"><i class="fa-solid fa-file-pen"></i></a>
                                                <a href="delete?sid=${x.cageID}" class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
                                                <form action="cart" method="POST">
                                                    <input type="hidden" name="id" value="${x.cageID}"/>
                                                    <input type="hidden" name="quantity" value="1"/>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </nav>
                        </c:if>
                        <% }%>
                    </div>
                </main>
            </div>
    </body>
</html>