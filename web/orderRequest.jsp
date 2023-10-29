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
        <link rel="stylesheet" href="static/css/root.css">
        <title>Đặt lồng theo yêu cầu</title>
    </head>
    <body class="fade-in">
        <jsp:include page="header.jsp" />
        <%
            List<Material> list = (List<Material>) request.getAttribute("listM");
        %>
        <div class="main">
            <div class="sm-container">
                <div class="row">
                    <div class="title-main">
                        <h3>  
                            <i class="fa fa-ticket" aria-hidden="true"></i>
                             Thiết kế lồng chim theo yêu cầu 
                        </h3>
                    </div>
                    <form action="OrderRequest" method="post">
                        <div class="row">
                        <div class="col-md-6 ">
                                <div class="selectcage add-material">
                                    <strong class='form-title '>Chọn Loại Lồng:</strong>
                                    <select class="form-control" name="cageType" id="cageType">
                                        <option value="" selected disabled>Loại lồng...</option>
                                        <option value="CageType1">Lồng tre</option>
                                        <option value="CageType2">Lồng sắt</option>
                                        <option value="CageType3">Lồng gỗ</option>
                                    </select>
                                    <div class="materialSuggestion mt-3" id="materialSuggestion" style="display: none;">
                                        <strong>Gợi ý số liệu thiết kế:</strong>
                                        <ul id="suggestedMaterials" class="mt-2"></ul>
                                    </div>
                                </div>
                                <div class="quantitycage mt-3 add-material">
                                        <strong class="form-title">Số lượng lồng cần thiết kế: </strong>
                                        <div class="detail-quantity ">
                                                    <button type="button" id="minus-quantity">
                                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                                    </button>
                                                    <input class="form-control" type="number" value="1" name="cageQuantity" id="cageQuantity" required />
                                                    <button type="button" id="add-quantity">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                                    </button>
                                        </div>
                                </div>
                                <div class="mt-3 add-material">
                                    <h5  class="form-title">CUNG CẤP NGUYÊN LIỆU</h5> 
                                    <div class="selectmate">
                                        <strong>Chọn Nguyên Liệu:</strong>
                                        <select class="form-control mt-2" name="material" id="material">
                                            <option value="" selected disabled>Nguyên liệu...</option>
                                            <% for (Material m : list) {
                                                    int price = (int) m.getPrice();
                                            %> 
                                            <option value="<%=m.getMaterialName()%>-<%=price%>">
                                                <%=m.getMaterialName()%> - <span id="materialPrice"><%=price%></span> VND</option>
                                                <% }%>
                                        </select>
                                    </div>
                                    <div class="quantitymate mt-3">
                                        <strong>Số lượng:</strong>
                                         <div class="detail-quantity mt-2 ">
                                                    <button type="button" id="me-minus-quantity">
                                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                                    </button>
                                                    <input class="form-control" type="number" value="1" name="quantity" id="quantity" required />
                                                    <button type="button" id="me-add-quantity">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                                    </button>
                                        </div>

                                    </div>
                                    <div class="mt-3 button-addmate">
                                        <button id="add" class="btn btn-danger">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                        Thêm Nguyên Liệu</button>
                                    </div>
                                </div>
                        </div>


                        <div class="col-md-6 ">
                            <div class="material">
                                <div class="form-title">
                                   TÓM TẮT ĐƠN HÀNG
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
                                    <textarea class="form-control" type="text" name="description" placeholder="Nhập ghi chú của bạn" rows="4" id="des" required></textarea>
                                </div>
                                <div class="checkout">
                                    <p class="checkout-item">
                                        <span class="money">Tiền công:</span>
                                        <span>
                                            <span id="ship">100000</span> VND
                                        </span>
                                    </p>
                                    <p class="checkout-item">
                                        <span class="money">Thành tiền:</span> 
                                        <span>
                                            <span id="total"></span> VND
                                        </span>
                                    </p>
                                </div>

                                <input type="hidden" id="totalPrice" name="totalPrice">
                                <input type="hidden" id="shipCost" name="shipCost">

                                <div class="sendrequest">  
                                    <button type="submit" id="checkout" class="btn btn-success ">
                                    <i class="fa fa-check" aria-hidden="true"></i>
                                    Gửi yêu cầu</button>
                                </div>
                            </div>
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
            const checkoutBtn = document.getElementById('checkout');
            const materialSelect = document.getElementById('material');
            const quantityInput = document.querySelector('input[name="quantity"]');
            const quantityChange = document.getElementById('cageQuantity');
            const des = document.getElementById('des');
            const tableBody = document.querySelector('table tbody');
            const cageQuantity = document.querySelector('input[name="cageQuantity"]');
            const shipItem = document.getElementById("ship");

            const cageTypeSelect = document.getElementById('cageType');
            const materialSuggestionDiv = document.getElementById('materialSuggestion');
            const suggestedMaterialsList = document.getElementById('suggestedMaterials');

            const suggestedMaterials = {
                CageType1: [{mat: "Số lượng móc: ", quan: 3}, {mat: "Số lượng trụ: ", quan: 5}, {mat: "Số lượng nan: ", quan: 40}, {mat: "Số lượng đáy: ", quan: 2}, {mat: "Số lượng cửa: ", quan: 1}, {mat: "Số lượng cốc: ", quan: 2}],
                CageType2: [{mat: "Số lượng móc: ", quan: 2}, {mat: "Số lượng trụ: ", quan: 3}, {mat: "Số lượng nan: ", quan: 28}, {mat: "Số lượng đáy: ", quan: 2}, {mat: "Số lượng cửa: ", quan: 2}, {mat: "Số lượng cốc: ", quan: 2}],
                CageType3: [{mat: "Số lượng móc: ", quan: 2}, {mat: "Số lượng trụ: ", quan: 3}, {mat: "Số lượng nan: ", quan: 30}, {mat: "Số lượng đáy: ", quan: 2}, {mat: "Số lượng cửa: ", quan: 2}, {mat: "Số lượng cốc: ", quan: 2}]
            };

            cageTypeSelect.addEventListener('change', function () {
                suggestedMaterialsList.innerHTML = '';

                const selectedCageType = cageTypeSelect.value;
                let count = 1;
                if (suggestedMaterials[selectedCageType]) {
                    suggestedMaterials[selectedCageType].forEach(material => {
                        const li = document.createElement('li');
                        const liId = "li" + count;
                        const spanId = "span" + count;
                        li.id = liId;
                        const span = document.createElement('span');
                        span.id = spanId;
                        span.textContent = material.quan;
                        li.textContent = material.mat;
                        li.appendChild(span);
                        suggestedMaterialsList.appendChild(li);
                        count += 1;
                    });
                    materialSuggestionDiv.style.display = 'block';
                } else {
                    materialSuggestionDiv.style.display = 'none';
                }
            });

            checkoutBtn.addEventListener('click', function () {
                let msg = "";
                document.querySelectorAll('table td:first-child').forEach(item => {
                    if (item.textContent === "móc") {
                        const hangerQuantity = parseInt(item.parentNode.querySelector('td:nth-child(2)').textContent);
                        if (hangerQuantity < parseInt(document.getElementById("span1").textContent)) {
//                            alert("Số móc phải đạt tối thiểu!");
                            msg += "móc ";
//                            event.preventDefault();
                        }
                    } else if (item.textContent === "trụ") {
                        const hangerQuantity = parseInt(item.parentNode.querySelector('td:nth-child(2)').textContent);
                        if (hangerQuantity < parseInt(document.getElementById("span2").textContent)) {
//                            alert("Số trụ phải đạt tối thiểu!");
                            msg += "trụ ";
//                            event.preventDefault();
                        }
                    } else if (item.textContent === "nan") {
                        const hangerQuantity = parseInt(item.parentNode.querySelector('td:nth-child(2)').textContent);
                        if (hangerQuantity < parseInt(document.getElementById("span3").textContent)) {
//                            alert("Số nan phải đạt tối thiểu!");
                            msg += "nan ";
//                            event.preventDefault();
                        }
                    } else if (item.textContent === "đáy") {
                        const hangerQuantity = parseInt(item.parentNode.querySelector('td:nth-child(2)').textContent);
                        if (hangerQuantity < parseInt(document.getElementById("span4").textContent)) {
//                            alert("Số đáy phải đạt tối thiểu!");
                            msg += "đáy ";
//                            event.preventDefault();
                        }
                    } else if (item.textContent === "cửa") { 
                        const hangerQuantity = parseInt(item.parentNode.querySelector('td:nth-child(2)').textContent);
                        if (hangerQuantity < parseInt(document.getElementById("span5").textContent)) {
//                            alert("Số cửa phải đạt tối thiểu!");
                            msg += "cửa ";
//                            event.preventDefault();
                        }
                    } else if (item.textContent === "cốc") {
                        const hangerQuantity = parseInt(item.parentNode.querySelector('td:nth-child(2)').textContent);
                        if (hangerQuantity < parseInt(document.getElementById("span6").textContent)) {
//                            alert("Số cốc phải đạt tối thiểu!");
                            msg += "cốc ";
//                            event.preventDefault();
                        }
                    }
                });
                if(msg !== ""){
                    alert(msg + ": not enough quantity");
                    event.preventDefault();
                }
                if (quantityChange.value === null) {
                    alert("Vui lòng cung cấp số lượng lồng!");
                    event.preventDefault();
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
                    let matName = "";
                    if(material==="trụ"){
                        matName="tru";
                    }else if(material==="móc"){
                        matName="moc";
                    }else if(material==="đáy"){
                        matName="day";
                    }else if(material==="cửa"){
                        matName="cua";
                    }else if(material==="nan"){
                        matName="nan";
                    }else if(material==="cốc"){
                        matName="coc";
                    }
                    tableBody.innerHTML += "<tr>" +
                            "<td>" + material + "</td>" +
                            "<td>" + quantity + "</td>" +
                            "<td>" + total + "</td>" +
                            "</tr>"+
                            "<input type="+"hidden"+" name="+matName+" value="+quantity+">";
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
        <script>
            
            // quantity control button
            const addQuantityBtn = document.getElementById('add-quantity');
            const minusQuantityBtn = document.getElementById('minus-quantity');
            const quantityInput2 = document.getElementById('cageQuantity');
            addQuantityBtn.addEventListener('click', function () {
                quantityInput2.value = parseInt(quantityInput2.value) + 1;
                var event = new Event('change');
                quantityInput2.dispatchEvent(event);
            });
            minusQuantityBtn.addEventListener('click', function () {
                if (parseInt(quantityInput2.value) > 1) {
                    quantityInput2.value = parseInt(quantityInput2.value) - 1;
                    var event = new Event('change');
                    quantityInput2.dispatchEvent(event);
                }
            });
            // quantity control button
            const addQuantityBtn2 = document.getElementById('me-add-quantity');
            const minusQuantityBtn2 = document.getElementById('me-minus-quantity');
            const quantityInput3 = document.getElementById('quantity');
            addQuantityBtn2.addEventListener('click', function () {
                quantityInput3.value = parseInt(quantityInput3.value) + 1;
            });
            minusQuantityBtn2.addEventListener('click', function () {
                if (parseInt(quantityInput3.value) > 1) {
                    quantityInput3.value = parseInt(quantityInput3.value) - 1;
                }
            });
        </script>
    </body>
</html>
