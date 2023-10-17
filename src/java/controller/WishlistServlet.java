/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.ProductDTO;

/**
 *
 * @author trand
 */
@WebServlet(name = "WishlistServlet", urlPatterns = {"/WishlistServlet"})
public class WishlistServlet extends HttpServlet {

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
            out.println("<title>Servlet WishlistServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WishlistServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("wishlist.jsp").
                    forward(request, response);
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
        String sid = request.getParameter("id");
        String squantity = request.getParameter("quantity");
        int quantity = Integer.parseInt(squantity);
        ProductDAO dao = new ProductDAO();
        ProductDTO p = dao.getProductByID(sid);
        if (p != null) {
            List<Cart> cart;
            // check xem đã có session Cart chưa ?
            if (session.getAttribute("cart") != null) {
                cart = (List<Cart>) session.getAttribute("cart");
            } else {
                // chưa có cart trong session => tạo mới
                cart = new ArrayList<>();
            }
            Cart item = null;
            for (Cart c : cart) {
                if (c.getCageID().equals(p.getCageID())) {
                    // sp đã có trong cart => tăng quantity
                    // save sp vào item
                    item = c;
                    break;
                }
            }
            if (item != null) {
                item.setQuantity(item.getQuantity() + quantity);
            } else {
                // chưa có sp trong cart, tạo mới và thêm vào cart
                item = new Cart(p.getCageID(),
                        p.getCageName(),
                        p.getPriceNew(),
                        quantity,
                        p.getImage());
                cart.add(item);
            }
//            // update lại giỏ hàng
            session.setAttribute("cart", cart);
//
            request.getRequestDispatcher("viewCart.jsp").
                    forward(request, response);
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