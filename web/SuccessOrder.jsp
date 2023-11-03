<%-- 
    Document   : Show
    Created on : Sep 21, 2023, 5:45:14 PM
    Author     : Acer
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="model.OrderSuccess"%>
<%@page import="model.OrderDetail"%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/SuccessOrder.css">
        <link rel="stylesheet" href="static/css/root.css">
        <title>Đặt hàng thành công</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="success__order">
            <div class="logo__success">
                <i class="fa-solid fa-circle-check fa-2xl" style="color: #00ff04;"></i>
            </div>  
            <div class="title__success">  
                <h2>Đặt hàng thành công</h2>
            </div>
            <% String orderId = (String)request.getAttribute("orderId"); %>
            <div class="order__id">
                Mã giao dịch: <%=orderId%>
            </div>
            <% List<OrderSuccess> ls = (List<OrderSuccess>)request.getAttribute("listOrder"); %>
            <div class="table__success">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center">Thời gian</th>
                            <th class="text-center">Tên sản phẩm</th>
                            <th class="text-center">Số lượng</th>
                            <th class="text-center">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (OrderSuccess od : ls) {
                                
                            
                        %>
                        <tr>
                            <td class="text-center"><%=od.getOrderDate()%></td>
                            <td class="text-center"><%=od.getCageName()%></td>
                            <td class="text-center">x<%=od.getQuantity()%></td>
                            <td class="text-center"><fmt:formatNumber value="<%=od.getPrice()*od.getQuantity()%>" pattern="###,###"/> VNĐ</td>
                       <tr>
             <% } %>
                    </tbody>
                </table>
            </div>  
            <div class="contact__success">
                <div>Chúng tôi sẽ liên hệ với bạn ngay sau khi nhận được đơn đặt hàng này</div>
                <div>Mọi thắc mắc xin vui lòng liên hệ hotline: <strong>0123 456 789</strong></div>
            </div>
            <div class="buton__success">
                <a class="btn btn-success " href="MainController"><i class="fa-solid fa-house" style="color: #ffffff;"></i> Trở về trang chủ</a>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>


</html>
