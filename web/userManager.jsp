<%-- 
    Document   : userManager
    Created on : Sep 18, 2023, 9:05:10 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="searchUser" method="POST">
            Search<input type="text" name="search"" />
        <input type="submit" name="action" value="Search" />
        <% int count = 1;%>
        <c:set var="listU" value="${requestScope.listU}"/>
        <c:if test="${not empty listU}">
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>UserID</th>
                    <th>FullName</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>RoleID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listU}" var="x" >
                    <tr>
                    <td><%=count++%></td>
                    <td>${x.userID}</td>
                    <td>${x.fullName}</td>
                    <td>${x.password}</td>
                    <td>${x.phone}</td>
                    <td>${x.email}</td>
                    <td>${x.address}</td>
                    <td>${x.roleID}</td>
                    
                    <td>
                        <a href="updateUser?userID=${x.userID}">update</a>
                        <a href="deleteUser?userID=${x.userID}">delete</a>
                    </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
</form>
    </body>
</html>
