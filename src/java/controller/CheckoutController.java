/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.ProductDTO;
import model.User;

/**
 *
 * @author trand
 */
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
        HttpSession session = request.getSession();
        List<Cart> cart;
        cart = (List<Cart>) session.getAttribute("cart");
        session.setAttribute("cart", cart);
        User u = (User)session.getAttribute("LOGIN_USER");
        if(u == null){
            request.getRequestDispatcher("login.jsp").
                forward(request, response);
        }else{
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        User u = (User)session.getAttribute("LOGIN_USER");
        od.insertOrder(orderID, u.getUserID(), phone, address, orderDate, "", "",shipCost,totalPrice);
        List<Cart> cart;
        cart = (List<Cart>) session.getAttribute("cart");
        for (Cart item : cart) {
            od.insertOrderDetail(orderID, item.getCageID(), item.getCageName(), String.valueOf(item.getPrice()), item.getQuantity());
            ProductDTO p = pd.getProductByID(item.getCageID());
            int quantity = p.getQuantity() - item.getQuantity();
            pd.updateQuantityProduct(item.getCageID(), quantity);
        }
        session.removeAttribute("cart");
        request.getRequestDispatcher("SuccessOrder.jsp").
                forward(request, response);
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
