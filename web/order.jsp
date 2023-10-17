<%-- 
    Document   : order
    Created on : Oct 18, 2023, 2:10:07 AM
    Author     : HOANGDUC
--%>

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
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <h2>Đơn hàng của bạn</h2>
        <div class="container padding-bottom-3x mb-1">
            <!-- Shopping Cart-->
            <div class="table-responsive shopping-cart">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="text-center">Mã đơn hàng</th>
                            <th class="text-center">Ngày mua</th>
                            <th class="text-center">Hình thức GD</th>
                            <th class="text-center">Địa chỉ</th>
                            <th class="text-center">SĐT</th>
                            <th class="text-center">Tổng đơn</th>
                            <th class="text-center">Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center text-lg text-medium">aaaa</td>
                            <td class="text-center text-lg text-medium">aaaa</td>
                            <td class="text-center text-lg text-medium">aaaaa</td>
                            <td class="text-center text-lg text-medium">aaaaa</td>
                            <td class="text-center text-lg text-medium">aaaaa</td>   
                            <td class="text-center text-lg text-medium">aaaa</td>
                            <td class="text-center text-lg text-medium">aaaa</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>