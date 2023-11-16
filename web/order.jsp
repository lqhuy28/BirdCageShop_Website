<%-- 
    Document   : order
    Created on : Oct 18, 2023, 2:10:07 AM
    Author     : HOANGDUC
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
        <!-- font awesome cnd link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="static/css/order.css"/>
        <link rel="stylesheet" href="static/css/root.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body class="fade-in">
        <jsp:include page="header.jsp" />
        <% List<Order> listOrder = (List<Order>) request.getAttribute("listOrder"); %>
        <div class="mainOder" >
            <h2>Đơn hàng của bạn</h2>
            <div class="container padding-bottom-3x mb-1">
                <!-- Shopping Cart-->
                <div class="table-responsive shopping-cart">
                    <div id="table__paging">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center">Mã đơn hàng</th>
                                    <th class="text-center">Loại lồng</th>
                                    <th class="text-center">Ngày đặt hàng</th>
                                    <th class="text-center">Số điện thoại</th>
                                    <th class="text-center">Địa chỉ</th>
                                    <th class="text-center">Phí khác</th>
                                    <th class="text-center">Tổng Tiền</th>
                                    <th class="text-center">Tình Trạng</th>
                                    <th class="text-center">Chi tiết 1</th>
                                    <th class="text-center">Chi tiết 2</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Order o : listOrder) {
                                %>
                                <tr>
                                    <td class="text-center text-lg text-medium"><%=o.getOrderID()%></td>
                                    <td class="text-center text-lg text-medium"><%=o.getCageName().equals("Lồng yêu cầu") ? "Lồng yêu cầu" : "Lồng có sẵn"%></td>
                                    <td class="text-center text-lg text-medium"><%=o.getOrderDate()%></td>   
                                    <td class="text-center text-lg text-medium"><%=o.getPhone()%></td>
                                    <td class="text-center text-lg text-medium"><%=o.getAddress()%></td>
                                    <td class="text-center text-lg text-medium"><fmt:formatNumber value="<%=o.getShipCost()%>" pattern="###,###"/> VNĐ</td>
                                    <td class="text-center text-lg text-medium"><fmt:formatNumber value="<%=o.getTotal()%>" pattern="###,###"/> VNĐ</td>
                                    <td class="text-center text-lg text-medium"><%=o.isStatus() ? "Đã duyệt" : "Chờ phản hồi"%></td>
                                    <td class="text-center text-lg text-medium"><a href="DetailOrder?orderId=<%=o.getOrderID()%>&cageId=<%=o.getCageID()%>"><i class="fa-solid fa-eye" style="color: red;"></i></a></td>
                                            <% if (o.isStatus() == true) {%>
                                    <td class="text-center text-lg text-medium"><a href="OrderController?orderId=<%=o.getOrderID()%>">Hủy Đơn Hàng</a></td>
                                    <% } %>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">

                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
        <script>
            $(document).ready(function () {
                var itemsPerPage = 10; // Number of items to display per page
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
    </body>
</html>