/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.ProductDTO;

/**
 *
 * @author Acer
 */
@WebServlet(name = "SearchProduct", urlPatterns = {"/search"})
public class SearchProduct extends HttpServlet {

    private static final String ERROR = "category.jsp";
    private static final String SUCCESS = "category.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        request.setCharacterEncoding("UTF-8");
        try {
            String search = request.getParameter("search");
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listProduct = dao.SearchProduct(search);
            List<Category> listC = dao.getAllCategory();
//            if (listProduct.size() >0) {
//                request.setAttribute("listS", listProduct);
//                request.setAttribute("listCC", listC);
//                url = SUCCESS;
//            }
            if (listProduct.isEmpty() || listC.isEmpty()) {
                request.setAttribute("ERROR", "CageName is not found!");
            } else {
                request.setAttribute("listS", listProduct);
                url = SUCCESS;
            }
            request.setAttribute("listCC", listC);
        } catch (SQLException e) {
            log("Error at SearchProduct: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
