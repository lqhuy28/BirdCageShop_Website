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
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
        <title>Đặt lồng theo yêu cầu</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <%
            List<Material> list = (List<Material>) request.getAttribute("listM");
        %>
        <div class="main">
            <div class="container">
                <div class="row">
                    <div class="title-main">
                        <h3> Thiết kế lồng chim theo yêu cầu </h3>
                    </div>
                    <div class="col-md-6 add-material">
                        <form action="OrderRequest" method="post">
                            <div class="selectcage">
                                <strong>Chọn Loại Lồng:</strong>
                                <select class="form-control" name="cageType" id="cageType">
                                    <option value="" selected disabled>Loại lồng...</option>
                                    <option value="CageType1">Lồng tre</option>
                                    <option value="CageType2">Lồng sắt</option>
                                    <option value="CageType3">Lồng gỗ</option>
                                </select>
                            </div>
                            <div class="materialSuggestion" id="materialSuggestion" style="display: none;">
                                <strong>Gợi ý số liệu thiết kế:</strong>
                                <ul id="suggestedMaterials"></ul>
                            </div>
                            <div class="quantitycage">
                                <strong>Số lượng lồng cần thiết kế: </strong>
                                <input class="form-control" type="number" name="cageQuantity" id="cageQuantity" min="1" value="1">
                            </div>   
                            <div class="titlemat">
                                <h5>CUNG CẤP NGUYÊN LIỆU</h5>
                            </div>
                            <div class="selectmate">
                                <strong>Chọn Nguyên Liệu:</strong>
                                <select class="form-control" name="material" id="material">
                                    <option value="" selected disabled>Nguyên liệu...</option>
                                    <% for (Material m : list) {
                                            int price = (int) m.getPrice();
                                    %> 
                                    <option value="<%=m.getMaterialName()%>-<%=price%>">
                                        <%=m.getMaterialName()%> - <span id="materialPrice"><%=price%></span> VND</option>
                                        <% }%>
                                </select>
                            </div>
                            <div class="quantitymate">
                                <strong>Số lượng:</strong>
                                <input class="form-control" type="number" name="quantity" min="1" value="1">
                            </div>
                            <div class="button-addmate">
                                <button id="add" class="btn btn-danger">Thêm Nguyên Liệu</button>
                            </div>
                                </div>
                    

                    <div class="col-md-5 material">
                        <div class="mat-tab-title">
                            <h5>TỔNG HỢP NGUYÊN LIỆU: </h5>
                        </div>
                        <div class="mat-tab">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tên nguyên liệu</th>
                                        <th>Số lượng</th>
                                        <th>Thành tiền </th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="note">
                            <strong>Ghi chú:</strong>
                            <textarea class="form-control" type="text" name="description" placeholder="Nhập ghi chú của bạn" rows="4"></textarea>
                        </div>
                        <div class="checkout">
                            <p>Tiền công: <span id="ship">100000</span> VND</p>
                            <p>Thành tiền: <span id="total"></span> VND</p>
                        </div>
                        <input type="hidden" id="totalPrice" name="totalPrice">
                        <input type="hidden" id="shipCost" name="shipCost">

                        <div class="sendrequest">  
                            <button type="submit" id="checkout" class="btn btn-success ">Gửi yêu cầu</button>
                        </div>
                    </div>
                                                        </form>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
            // Lấy giá trị các phần tử
            const addBtn = document.getElementById('add');
            const materialSelect = document.getElementById('material');
            const quantityInput = document.querySelector('input[name="quantity"]');
            const quantityChange = document.getElementById('cageQuantity');
            const tableBody = document.querySelector('table tbody');
            const cageQuantity = document.querySelector('input[name="cageQuantity"]');
            const shipItem = document.getElementById("ship");

            const cageTypeSelect = document.getElementById('cageType');
            const materialSuggestionDiv = document.getElementById('materialSuggestion');
            const suggestedMaterialsList = document.getElementById('suggestedMaterials');

            const suggestedMaterials = {
                CageType1: ['Số lượng móc: 3', 'Số lượng trụ: 5', 'Số lượng nan: 40', 'Số lượng đáy: 2', 'Số lượng cửa: 1', 'Số lượng cốc: 2'],
                CageType2: ['Số lượng móc: 2', 'Số lượng trụ: 3', 'Số lượng nan: 28', 'Số lượng đáy: 2', 'Số lượng cửa: 2', 'Số lượng cốc: 2'],
                CageType3: ['Số lượng móc: 2', 'Số lượng trụ: 3', 'Số lượng nan: 30', 'Số lượng đáy: 2', 'Số lượng cửa: 2', 'Số lượng cốc: 2']
            };

            cageTypeSelect.addEventListener('change', function () {
                suggestedMaterialsList.innerHTML = '';

                const selectedCageType = cageTypeSelect.value;

                if (suggestedMaterials[selectedCageType]) {
                    suggestedMaterials[selectedCageType].forEach(material => {
                        const li = document.createElement('li');
                        li.textContent = material;
                        suggestedMaterialsList.appendChild(li);
                    });
                    materialSuggestionDiv.style.display = 'block';
                } else {
                    materialSuggestionDiv.style.display = 'none';
                }
            });

            addBtn.addEventListener('click', function () {
                event.preventDefault();
                const materialAndPrice = materialSelect.value;
                const arr = materialAndPrice.split('-');
                const material = arr[0];
                const price = parseInt(arr[1]);
                const quantity = quantityInput.value;

                let existingRow = null;
                document.querySelectorAll('table td:first-child').forEach(item => {
                    if (item.textContent === material) {
                        existingRow = item.parentNode;
                    }
                });

                if (existingRow) {
                    const existingQuantity = parseInt(existingRow.querySelector('td:nth-child(2)').textContent);
                    const newQuantity = existingQuantity + parseInt(quantity);
                    existingRow.querySelector('td:nth-child(2)').textContent = newQuantity;
                    const total = newQuantity * price;
                    existingRow.querySelector('td:last-child').textContent = total;
                } else {
                    const total = quantity * price;
                    tableBody.innerHTML += "<tr>" +
                            "<td>" + material + "</td>" +
                            "<td>" + quantity + "</td>" +
                            "<td>" + total + "</td>" +
                            "</tr>";
                }
                calculateTotal();

            });

            quantityChange.addEventListener("change", function () {
                document.getElementById("ship").textContent = cageQuantity.value * 100000;
                document.getElementById("shipCost").value = document.getElementById("ship").textContent;
                calculateTotal();
            });
            quantityChange.addEventListener("click", function () {
                document.getElementById("ship").textContent = cageQuantity.value * 100000;
                document.getElementById("shipCost").value = document.getElementById("ship").textContent;
                calculateTotal();
            });
            quantityChange.addEventListener("input", function () {
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
