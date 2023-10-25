/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;

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
 * @author Admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        String sid = request.getParameter("id");
        String squantity = request.getParameter("quantity");
        try {
            String type = request.getParameter("type");
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
                String pid = request.getParameter("id");
                ProductDTO product = dao.getProductByID(pid);
                int quantityCart = 0;
                for (Cart cd : cart) {
                    if (cd.getCageID().equals(product.getCageID())) {
                        quantityCart = cd.getQuantity();
                    }
                }
                session.setAttribute("quantityCart", quantityCart);
                request.setAttribute("product", product);
                response.sendRedirect("MainController");
            }
        } catch (Exception e) {
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
                String pid = request.getParameter("id");
                ProductDTO product = dao.getProductByID(pid);
                int quantityCart = 0;
                for (Cart cd : cart) {
                    if (cd.getCageID().equals(product.getCageID())) {
                        quantityCart = cd.getQuantity();
                    }
                }
                session.setAttribute("quantityCart", quantityCart);
                request.setAttribute("product", product);
                request.getRequestDispatcher("detail.jsp").
                        forward(request, response);
            }
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
