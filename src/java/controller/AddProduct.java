/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/add"})
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddControl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddControl at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String sProductID = request.getParameter("ProductID");
        String sCategoryID = request.getParameter("CategoryID");
        String sProductName = request.getParameter("ProductName");
        String sProductDetails = request.getParameter("ProductDetails");
        double sProductPriceNew = Double.parseDouble(request.getParameter("ProductPriceNew"));
        double sProductPriceOld = Double.parseDouble(request.getParameter("ProductPriceOld"));
        String sProductImage = request.getParameter("ProductImage");
        int sQuantity = Integer.parseInt(request.getParameter("Quantity"));
        String sProductStatus = request.getParameter("ProductStatus");
        String sProductType = request.getParameter("ProductType");
        String sProductMaterial = request.getParameter("ProductMaterial");
        String sOtherRequest = request.getParameter("OtherRequest");
        
        
        ProductDAO dao = new ProductDAO();
        dao.insertProduct(sProductID, sCategoryID, sProductName, sProductDetails, sProductPriceNew, sProductPriceOld, sProductImage, sQuantity, sProductStatus, sProductType, sProductMaterial, sOtherRequest);
        response.sendRedirect("load");
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
