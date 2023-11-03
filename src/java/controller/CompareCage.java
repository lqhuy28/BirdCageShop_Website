/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MaterialDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CageMaterial;
import model.ProductDTO;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Acer
 */
@WebServlet(name = "CompareCage", urlPatterns = {"/CompareCage"})
public class CompareCage extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CompareCage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompareCage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
//        processRequest(request, response);
          ProductDAO dao = new ProductDAO();
          String pid1 = request.getParameter("id1");
          String pid2 = request.getParameter("id2");
          ProductDTO product1 = dao.getProductByID(pid1);
          ProductDTO product2 = dao.getProductByID(pid2);
          request.setAttribute("product1", product1);
          request.setAttribute("product2", product2);
          MaterialDAO md = new MaterialDAO();
          List<CageMaterial> cm1 = md.getCageMaterialByID(pid1);
          List<CageMaterial> cm2 = md.getCageMaterialByID(pid2);
          request.setAttribute("cageMaterial1", cm1);
          request.setAttribute("cageMaterial2", cm2);
          
          request.getRequestDispatcher("compareCage.jsp").
                forward(request, response);
    }
    
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
