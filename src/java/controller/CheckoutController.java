/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.ProductDTO;
import model.User;

@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        List<Cart> cart;
        cart = (List<Cart>) session.getAttribute("cart");
        session.setAttribute("cart", cart);
        User u = (User) session.getAttribute("LOGIN_USER");
        if (u == null) {
            request.getRequestDispatcher("login.jsp").
                    forward(request, response);
        } else {
            request.getRequestDispatcher("checkout.jsp").
                    forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public String createSHA256Signature(String data) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(data.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String payment = request.getParameter("paymentMethod");
        if (payment.equals("vnpay")) {
            String merchantId = "CLJU4DQJ";
            String secretKey = "PVKZTQRUYJTUWAGEMSTSSDEWNRPLJGBT";
            String returnUrl = "http://localhost:8081/Fall2023SWP391_NET1703_Group6/SuccessOrder.jsp/return";
            String ipAddress = request.getRemoteAddr(); // Địa chỉ IP của khách hàng

            // Tạo mã đơn hàng duy nhất
            String orderId = UUID.randomUUID().toString();

            // Số tiền cần thanh toán
            long amount = 100000; // Ví dụ 100,000 VND

            // Tạo thời gian Unix timestamp hiện tại
            long timestamp = System.currentTimeMillis() / 1000;

            // Tạo dữ liệu chuỗi cần ký
            String data = merchantId + orderId + amount + returnUrl + ipAddress + timestamp + secretKey;

            // Tạo chữ ký ký số SHA256
            String signature = createSHA256Signature(data);

            // Tạo request parameters
            Map<String, String> params = new HashMap<>();
            params.put("vnp_Version", "2.1.0");
            params.put("vnp_TmnCode", merchantId);
            params.put("vnp_Amount", String.valueOf(amount));
            params.put("vnp_Command", "pay");
            params.put("vnp_CreateDate", String.valueOf(timestamp));
            params.put("vnp_CurrCode", "VND");
            params.put("vnp_IpAddr", ipAddress);
            params.put("vnp_Locale", "vn");
            params.put("vnp_OrderInfo", "Thanh toan don hang");
            params.put("vnp_OrderType", "billpayment");
            params.put("vnp_ReturnUrl", returnUrl);
            params.put("vnp_TxnRef", orderId);
            params.put("vnp_SecureHashType", "SHA256");
            params.put("vnp_SecureHash", signature);

            String redirectUrl = "http://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
            // Tạo URL thanh toán
            String paymentUrl = redirectUrl + "?vnp_Version=2.0.0&vnp_TmnCode=" + merchantId + "&vnp_Amount=" + amount
                    + "&vnp_Command=pay&vnp_CreateDate=" + timestamp + "&vnp_CurrCode=VND&vnp_IpAddr=" + ipAddress
                    + "&vnp_Locale=vn&vnp_OrderInfo=Thanh+toan+don+hang&vnp_OrderType=billpayment&vnp_ReturnUrl=" + returnUrl
                    + "&vnp_TxnRef=" + orderId + "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + signature;
            response.sendRedirect(paymentUrl);
        } else {
            HttpSession session = request.getSession();
            OrderDAO od = new OrderDAO();
            ProductDAO pd = new ProductDAO();
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            double shipCost = Double.parseDouble(request.getParameter("shipCost"));
            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
            java.util.Date currentDate = new java.util.Date();
            java.sql.Date orderDate = new java.sql.Date(currentDate.getTime());
            int length = 4;
            Random random = new Random();
            char[] text = new char[length];
            for (int i = 0; i < length; i++) {
                text[i] = (char) (random.nextInt(26) + 'a');
            }
            String orderID = new String(text);
            User u = (User) session.getAttribute("LOGIN_USER");
            if (u == null) {
                request.getRequestDispatcher("login.jsp").
                        forward(request, response);
            }
            if (phone.trim().isEmpty() || address.trim().isEmpty()) {
                request.setAttribute("ERROR", "Vui lòng điền đầy đủ thông tin."); // Thông báo lỗi
                request.getRequestDispatcher("checkout.jsp").forward(request, response); // Giữ người dùng ở lại trang thanh toán
            } else {
                List<Cart> cart;
                cart = (List<Cart>) session.getAttribute("cart");
                int check = 0;
                String cageError = "";
                for (Cart item : cart) {
                    ProductDTO p = pd.getProductByID(item.getCageID());
                    int quantity = p.getQuantity() - item.getQuantity();
                    if (quantity < 0) {
                        check = 1;
                        cageError += p.getCageName() + " , ";
                    }
                }
                if (check == 1) {
                    request.setAttribute("ERROR", cageError + ": vượt quá số lượng có sẵn");
                    request.getRequestDispatcher("checkout.jsp").
                            forward(request, response);
                }
                if (check == 0) {
                    od.insertOrder(orderID, u.getUserID(), phone, address, orderDate, "1", "", shipCost, totalPrice);
                    for (Cart item : cart) {
                        od.insertOrderDetail(orderID, item.getCageID(), item.getCageName(), item.getPrice(), item.getQuantity());
                    }
                    session.removeAttribute("cart");
                    response.sendRedirect("SuccessOrder?orderId=" + orderID);
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
