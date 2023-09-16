

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
                        <input value="${up.userID}" type="text" name="userID" readonly>
                    </td>
                </tr>
                <tr>
                    <td>FullName</td>
                    <td>
                        <input value="${up.fullName}" type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input value="${up.password}" type="text" name="password">
                    </td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input value="${up.phone}" type="text" name="phone"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input value="${up.email}" type="text" name="email"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input value="${up.address}" type="text" name="address"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit">Update</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
