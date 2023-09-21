<%-- 
    Document   : product
    Created on : Sep 15, 2023, 10:17:19 PM
    Author     : HOANGDUC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>Danh sách sản phẩm</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Hình ảnh </th>
                <th>Mô tả</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Chức năng</th>
            </tr>
        </thead>
<!--        <tbody>
             Sử dụng JSTL hoặc vòng lặp để hiển thị danh sách sản phẩm 
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td>
                        <a href="update?id=${product.id}">Cập nhật</a>
                        <a href="delete?id=${product.id}">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>-->
    </table>

    <!-- Biểu mẫu thêm sản phẩm mới -->
    <form action="add" method="post">
        <!-- Thêm các trường để nhập thông tin sản phẩm -->
        <input type="submit" value="Thêm sản phẩm">
    </form>
</body>
</html>

