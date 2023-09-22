<%-- 
    Document   : Update
    Created on : Sep 21, 2023, 5:45:14 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="update" method="post">
            <table>
                <tr>
                    <td>ProductID</td>
                    <td>
                        <input value="${st.productID}" type="text" name="ProductID" readonly>
                    </td>
                </tr>
                
                <tr>
                    <td>ProductName</td>
                    <td>
                        <input value="${st.productName}" type="text" name="ProductName">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductDetails</td>
                    <td>
                        <input value="${st.productDetails}" type="text" name="ProductDetails">
                    </td>
                </tr>
                
                
                <tr>
                    <td>ProductPrice</td>
                    <td>
                        <input value="${st.productPrice}" type="text" name="ProductPrice">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductImage</td>
                    <td>
                        <input value="${st.productImage}" type="text" src="" name="ProductImage">
                    </td>
                </tr>
                
                <tr>
                    <td>Quantity</td>
                    <td>
                        <input value="${st.quantity}" type="text" name="Quantity">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductStatus</td>
                    <td>
                        <input value="${st.productStatus}" type="text" name="ProductStatus">
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><button type="submit">Update</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
