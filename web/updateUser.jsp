<%-- 
    Document   : updateUser
    Created on : Sep 20, 2023, 2:07:27 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updateUser" method="post">
            <table>
                <tr>
                    <td>UserID</td>
                    <td>
                        <input value="${us.userID}" type="text" name="userID" readonly>
                    </td>
                </tr>
                <tr>
                    <td>FullName</td>
                    <td>
                           <input value="${us.fullName}" type="text" name="fullName">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input value="${us.password}" type="text" name="password">
                    </td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input value="${us.phone}" type="text" name="phone"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input value="${us.email}" type="text" name="email"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input value="${us.address}" type="text" name="address"></td>
                </tr>
                <tr>
                    <td>RoleID</td>
                    <td><input value="${us.roleID}" type="text" name="roleID" readonly=""></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button name="updateUser" type="submit">Update</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
