<%-- 
    Document   : test
    Created on : Oct 6, 2023, 11:08:33 PM
    Author     : QUANG HUY
--%>

<%@page import="model.Material"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="static/css/orderRequest.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Material> list = (List<Material>) request.getAttribute("listM");
        %>
        
        <form action="OrderRequest" method="post">
            <strong>Chọn nguyên liệu</strong>
            <select name="material" id="material">
                <% for (Material m : list) {
                        int price = (int) m.getPrice();
                %>
                <option value="<%=m.getMaterialName()%>-<%=price%>"><%=m.getMaterialName()%> -------- <span id="materialPrice"><%=price%></span> VND</option>
                <% }%>
            </select>
            <strong>Chọn số lượng</strong>
            <input type="number" name="quantity" min="1" value="1">
            <button id="add">Thêm nguyên liệu</button>

            <br>

            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <br>
            <strong>Chọn số lượng lồng</strong>
            <input type="number" name="cageQuantity" id="cageQuantity" min="1" value="1">
            <h2>Ghi chú</h2>
            <input type="text" name="description" placeholder="Nhập ghi chú của bạn">

            <p>Tiền công: <span id="ship">100000</span>VND</p>
            <p>Thành tiền: <span id="total"></span>VND</p>
            <input type="hidden" id="totalPrice" name="totalPrice">
            <input type="hidden" id="shipCost" name="shipCost">
            <button type="submit" id="checkout" >Checkout</button>
        </form>

        <script>
            // Lấy giá trị các phần tử
            const addBtn = document.getElementById('add');
            const materialSelect = document.getElementById('material');
            const quantityInput = document.querySelector('input[name="quantity"]');
            const quantityChange = document.getElementById('cageQuantity');
            const tableBody = document.querySelector('table tbody');
            const cageQuantity = document.querySelector('input[name="cageQuantity"]');
            const shipItem = document.getElementById("ship");
            
            addBtn.addEventListener('click', function () {
                event.preventDefault();
                const materialAndPrice = materialSelect.value;
                const arr = materialAndPrice.split('-');
                const material = arr[0];
                const price = parseInt(arr[1]);
                const quantity = quantityInput.value;

                console.log(material);
                console.log(quantity);
                console.log(price);
                const total = quantity * price;
                console.log(total);
                tableBody.innerHTML += "<tr>"+
                          "<td>"+material+"</td>"+
                          "<td>"+quantity+"</td>"+
                          "<td>"+total+"</td>"+
                        "</tr>";
                calculateTotal();
                
            });
            
            quantityChange.addEventListener("change", function (){
                document.getElementById("ship").textContent = cageQuantity.value * 100000;
                document.getElementById("shipCost").value = document.getElementById("ship").textContent;
                calculateTotal();
            });
            quantityChange.addEventListener("click", function (){
                document.getElementById("ship").textContent = cageQuantity.value * 100000;
                document.getElementById("shipCost").value = document.getElementById("ship").textContent;
                calculateTotal();
            });
            quantityChange.addEventListener("input", function (){
                document.getElementById("ship").textContent = cageQuantity.value * 100000;
                document.getElementById("shipCost").value = document.getElementById("ship").textContent;
                calculateTotal();
            });
            
            function calculateTotal() {

                // Lấy tổng giá trị
                let total = 0;
                document.querySelectorAll('table td:last-child').forEach(item => {
                    total += parseInt(item.textContent);
                    
                });
                total = total * cageQuantity.value + parseInt(shipItem.textContent);
                // Hiển thị tổng lên UI
                document.getElementById('total').textContent = total;
                document.getElementById("totalPrice").value = document.getElementById("total").textContent;
            }

        </script>
    </body>
</html>
