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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Material> list = (List<Material>) request.getAttribute("listM");
            for (Material m : list) {


        %>
        <%                if (m.getMaterialName().equals("CageType1")) {
                double cageType1 = m.getPrice();
        %>
        <input type="hidden" type="text" id="CageType1A" value="<%=cageType1%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("CageType2")) {
                double cageType2 = m.getPrice();
        %>
        <input type="hidden" id="CageType2A" value="<%=cageType2%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("CageType3")) {
                double cageType3 = m.getPrice();
        %>
        <input type="hidden" id="CageType3A" value="<%=cageType3%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("pillar")) {
                double pillar = m.getPrice();
        %>
        <input type="hidden" id="pillarA" value="<%=pillar%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("door")) {
                double door = m.getPrice();
        %>
        <input type="hidden" id="doorA" value="<%=door%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("bottom")) {
                double bottom = m.getPrice();
        %>
        <input type="hidden" id="bottomA" value="<%=bottom%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("hanger")) {
                double hanger = m.getPrice();
        %>
        <input type="hidden" id="hangerA" value="<%=hanger%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("spokes")) {
                double spokes = m.getPrice();
        %>
        <input type="hidden" id="spokesA" value="<%=spokes%>">
        <%
            }
        %>
        <%
            if (m.getMaterialName().equals("cup")) {
                double cup = m.getPrice();
        %>
        <input type="hidden" id="cupA" value="<%=cup%>">
        <%
            }
        %>
        <%
            }
        %>
        <h1>Chọn lồng</h1>
        <form action="OrderRequest" method="post">
            <label for="cageType">Loại lồng:</label>
            <select name="cageType" id="cageType">
                <option value="CageType1">Lồng loại 1</option>
                <option value="CageType2">Lồng loại 2</option>
                <option value="CageType3">Lồng loại 3</option>
            </select>

            <h2>Chọn trụ:</h2>
            <label for="quantity">Số lượng:</label>
            <input type="number" name="pillar" id="pillar" min="1" value="1">

            <h2>Chọn móc:</h2>
            <label for="quantity">Số lượng:</label>
            <input type="number" name="hanger" id="hanger" min="1" value="1">

            <h2>Chọn nan:</h2>
            <label for="quantity">Số lượng:</label>
            <input type="number" name="spokes" id="spokes" min="1" value="1">

            <h2>Chọn đáy:</h2>
            <label for="quantity">Số lượng:</label>
            <input type="number" name="bottom" id="bottom" min="1" value="1">

            <h2>Chọn cửa:</h2>
            <label for="quantity">Số lượng:</label>
            <input type="number" name="door" id="door" min="1" value="1">

            <h2>Chọn cốc thức ăn & nước:</h2>
            <label for="quantity">Số lượng:</label>
            <input type="number" name="cup" id="cup" min="1" value="1">

            </br>
            <h2>Số lượng lồng</h2>
            <input type="number" name="cageQuantity" id="cageQuantity" value="1" placeholder="Số lượng lồng bạn muốn tạo">

            </br>
            <h2>Ghi chú</h2>
            <input type="text" name="description" placeholder="Nhập ghi chú của bạn">
            </br>
            <p>Loại lồng đã chọn: <span id="loailong"></span> </p>
            <p>Số lượng: <span id="soluong"></span></p>
            <p>Trụ: <span id="tru"></span></p>
            <p>Móc <span id="moc"></span></p>
            <p>Nan: <span id="nan"></span></p>
            <p>Đáy: <span id="day"></span></p>
            <p>Cửa: <span id="cua"></span></p>
            <p>Cốc thức ăn & nước: <span id="coc"></span></p>
            <p>Tiền công: <span id="ship">100</span></p>
            <p>Thành tiền: <span id="total"></span></p>
            <input type="hidden" id="totalPrice" name="totalPrice">
            <button type="submit" >Checkout</button>
        </form>

        <script>
            const cageTypeSelect = document.getElementById("cageType");
            const totalPrice = document.getElementById("totalPrice");
            const total = document.getElementById("total");
            const pillar = document.getElementById("pillar");
            const hanger = document.getElementById("hanger");
            const spokes = document.getElementById("spokes");
            const bottom = document.getElementById("bottom");
            const door = document.getElementById("door");
            const cup = document.getElementById("cup");

            const loailong = document.getElementById("loailong");
            const soluong = document.getElementById("soluong");
            const ship = document.getElementById("ship");
            const tru = document.getElementById("tru");
            const moc = document.getElementById("moc");
            const nan = document.getElementById("nan");
            const day = document.getElementById("day");
            const cua = document.getElementById("cua");
            const coc = document.getElementById("coc");

            const cageType1A = document.getElementById("CageType1A");
            const cageType2A = document.getElementById("CageType2A");
            const cageType3A = document.getElementById("CageType3A");
            const pillarA = document.getElementById("pillarA");
            const hangerA = document.getElementById("hangerA");
            const spokesA = document.getElementById("spokesA");
            const bottomA = document.getElementById("bottomA");
            const doorA = document.getElementById("doorA");
            const cupA = document.getElementById("cupA");

            const cageQuantity = document.getElementById("cageQuantity");

            const cageType1Price = parseFloat(cageType1A.value);
            const cageType2Price = parseFloat(cageType2A.value);
            const cageType3Price = parseFloat(cageType3A.value);
            const pillarPrice = parseFloat(pillarA.value);
            const hangerPrice = parseFloat(hangerA.value);
            const spokesPrice = parseFloat(hangerA.value);
            const bottomPrice = parseFloat(hangerA.value);
            const doorPrice = parseFloat(hangerA.value);
            const cupPrice = parseFloat(hangerA.value);



            tru.innerText = pillar.value;
            moc.innerText = hanger.value;
            nan.innerText = spokes.value;
            day.innerText = bottom.value;
            cua.innerText = door.value;
            coc.innerText = cup.value;

            function calculateTotal() {
                tru.innerText = pillar.value;
                moc.innerText = hanger.value;
                nan.innerText = spokes.value;
                day.innerText = bottom.value;
                cua.innerText = door.value;
                coc.innerText = cup.value;
                let cageTypePrice = 0;
                const selectedCage = cageTypeSelect.value;
                if (selectedCage === 'CageType1') {
                    cageTypePrice = cageType1Price;
                } else if (selectedCage === 'CageType2') {
                    cageTypePrice = cageType2Price;
                } else if (selectedCage === 'CageType3') {
                    cageTypePrice = cageType3Price;
                }

                const totalPillar = parseInt(pillar.value) * pillarPrice;
                const totalHanger = parseInt(hanger.value) * hangerPrice;
                const totalSpokes = parseInt(spokes.value) * spokesPrice;
                const totalBottom = parseInt(bottom.value) * bottomPrice;
                const totalDoor = parseInt(door.value) * doorPrice;
                const totalCup = parseInt(cup.value) * cupPrice;

                const subTotal = totalPillar + totalHanger + totalSpokes + totalBottom + totalDoor + totalCup + cageTypePrice;
                const shipFee = parseFloat(ship.innerHTML) * parseInt(cageQuantity.value);
                let total1 = (subTotal * parseInt(cageQuantity.value)) + shipFee;
                total.innerHTML = total1;
                totalPrice.value = total1;
            }

            pillar.addEventListener('input', calculateTotal);
            hanger.addEventListener("input", calculateTotal);
            spokes.addEventListener("input", calculateTotal);
            bottom.addEventListener("input", calculateTotal);
            door.addEventListener("input", calculateTotal);
            cup.addEventListener("input", calculateTotal);
            cageQuantity.addEventListener("input", calculateTotal);
            cageTypeSelect.addEventListener('change', calculateTotal);


//            let pillarPrice = pillar.addEventListener("input", function () {
//                let total1 = parseInt(pillar.value) * parseInt(pillarA.value);
//                tru.innerText = pillar.value;
//                total.innerText = total1 + parseInt(ship.innerHTML);;
//                return total1;
//            });
//            
//            let hangerPrice = hanger.addEventListener("input", function () {
//                let total = parseInt(hanger.value) * parseInt(hangerA.value);
//                moc.innerText = hanger.value;
//                
//                return total;
//            });
//            
//            let spokesPrice = spokes.addEventListener("input", function () {
//                let total = parseInt(spokes.value) * parseInt(spokesA.value);
//                nan.innerText = spokes.value;
//                return total;
//            });
//            
//            let bottomPrice = bottom.addEventListener("input", function () {
//                let total = parseInt(bottom.value) * parseInt(bottomA.value);
//                day.innerText = bottom.value;
//                return total;
//            });
//            
//            let doorPrice = door.addEventListener("input", function () {
//                let total = parseInt(door.value) * parseInt(doorA.value);
//                cua.innerText = door.value;
//                return total;
//            });
//            
//            let cupPrice = cup.addEventListener("input", function () {
//                let total = parseInt(cup.value) * parseInt(cupA.value);
//                coc.innerText = cup.value;
//                return total;
//            });
//            
//            let cageAmount = cageQuantity.addEventListener("input", function () {
//                soluong.innerText = cageQuantity.value;
//                ship.innerText = 100 * parseInt(cageQuantity.value);
//                return parseInt(cageQuantity.value);
////                makerCost = makerCost * cageQuantity.value;
////                return cageQuantity.value * (pillarPrice + hangerPrice +  spokesPrice + bottomPrice + doorPrice + cupPrice);
//            });
//
//            let cageTypePrice = document.querySelector('#cageType').addEventListener('change', (event) => {
//                const method = event.target.value;
//                loailong.innerText = method;
//                let totalPrice;
//                if (method === 'CageType1') {
//                    totalPrice += cageType1A;
//                } else if (method === 'CageType2') {
//                    totalPrice += cageType2A;
//                } else if (method === 'CageType3') {
//                    totalPrice += cageType3A;
//                }
//                
//                //total.innerHTML = totalPrice + pillarPrice + hangerPrice +  spokesPrice + bottomPrice + doorPrice + cupPrice + makerCost;
//            });



        </script>
    </body>
</html>
