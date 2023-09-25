<%-- 
    Document   : Add
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
        <form action="add" method="post">
            <table>
                
                <tr>
                    <td>ProductID</td>
                    <td>
                        <input type="text" name="ProductID">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductName</td>
                    <td>
                        <input type="text" name="ProductName">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductDetails</td>
                    <td>
                        <input type="text" name="ProductDetails">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductPriceNew</td>
                    <td>
                        <input type="text" name="ProductPriceNew">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductPriceOld</td>
                    <td>
                        <input type="text" name="ProductPriceOld">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductImage</td>
                    <td>
                        <input type="text" src="" name="ProductImage">
                    </td>
                </tr>
                
                <tr>
                    <td>Quantity</td>
                    <td>
                        <input type="text" name="Quantity">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductStatus</td>
                    <td>
                        <input type="text" name="ProductStatus">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductType</td>
                    <td>
                        <input type="text" name="ProductType">
                    </td>
                </tr>
                
                <tr>
                    <td>ProductMaterial</td>
                    <td>
                        <input type="text" name="ProductMaterial">
                    </td>
                </tr>
                
                <tr>
                    <td>OtherRequest</td>
                    <td>
                        <input type="text" name="OtherRequest">
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><button type="submit">Add ProductDTO</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
