<%-- 
    Document   : Show
    Created on : Sep 21, 2023, 5:45:14 PM
    Author     : Acer
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/showProduct.css">
        <link rel="stylesheet" href="static/css/root.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>Quản lí sản phẩm</title>
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
            <div class="row dashboard__container_admin">
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
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-network-wired" style="color: #ffffff;"></i>
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="DashboardController"><span>Bảng điều khiển</span></a>
                                    </div>
                            </li>
                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-users" style="color: #ffffff;"></i>
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="searchUser"><span>Quản lí khách hàng</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration" style="margin-left: 18px;">
                                    <div class="icon">
                                        <i class="fa-solid fa-weight-hanging" style="color: #ffffff;"></i>                            
                                    </div>

                                    <div class="title">
                                        <a class="nav-link" href="load"><span>Quản lí sản phẩm</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i>                            
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="OrderManager"><span>Quản lí đơn hàng</span></a>
                                    </div>
                                </div>
                            </li>

                            <li class="nav-item">
                                <div class="icon-integration">
                                    <div class="icon">
                                        <i class="fa-solid fa-comments" style="color: #ffffff;"></i>                            
                                    </div>
                                    <div class="title">
                                        <a class="nav-link" href="FeedbackManager"><span>Kiểm tra phản hồi</span></a>
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
                                <a href="load"><b>Danh sách sản phẩm</b></a>
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
                                <a href="add">Tạo sản phẩm</a>  
                            </div>
                        </div>
                        <% if (request.getAttribute("ERROR") != null) {%>
                        <p> Không tìm thấy kết quả </p>
                        <% } else {%>
                        <c:set var="listS" value="${requestScope.listS}" />
                        <c:if test="${not empty listS}">
                            <div id="table__paging">
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
                            </div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">

                                </ul>
                            </nav>
                        </c:if>
                        <% }%>
                    </div>
                </main>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            var itemsPerPage = 5; // Number of items to display per page
            var $tableContainer = $('#table__paging');
            var $table = $tableContainer.find('table');
            var $pagination = $('.pagination');

            var numRows = $table.find('tbody tr').length;
            var numPages = Math.ceil(numRows / itemsPerPage);

            // Create pagination links
            for (var i = 1; i <= numPages; i++) {
                var $li = $('<li class="page-item"><a class="page-link" href="#">' + i + '</a></li>');
                $li.data('page', i);
                $pagination.append($li);
            }

            // Show the first page and highlight its link
            $table.find('tbody tr:gt(' + (itemsPerPage - 1) + ')').hide();
            $pagination.find('li:first').addClass('active');

            // Handle pagination link click
            $pagination.find('li').click(function () {
                var $this = $(this);
                var page = $this.data('page');

                // Hide and show the appropriate rows
                var firstItem = (page - 1) * itemsPerPage;
                var lastItem = firstItem + itemsPerPage;

                $table.find('tbody tr').hide();
                $table.find('tbody tr:eq(' + (firstItem) + ')').show();
                $table.find('tbody tr:gt(' + (firstItem) + '):lt(' + (itemsPerPage - 1) + ')').show();

                // Highlight the clicked link
                $pagination.find('li').removeClass('active');
                $this.addClass('active');
            });
        });
    </script>
</html>
