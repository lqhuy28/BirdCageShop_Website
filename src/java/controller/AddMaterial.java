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
import model.Material;

/**
 *
 * @author trand
 */
@WebServlet(name = "AddMaterial", urlPatterns = {"/AddMaterial"})
public class AddMaterial extends HttpServlet {

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
            out.println("<title>Servlet AddMaterial</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMaterial at " + request.getContextPath() + "</h1>");
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
        String cageId = request.getParameter("sid");
        MaterialDAO md = new MaterialDAO();
        List<CageMaterial> listM = md.getCageMaterialByID(cageId);
        request.setAttribute("listM", listM);
        request.setAttribute("cageId", cageId);
        request.getRequestDispatcher("AddMaterial.jsp").forward(request, response);
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
        String cageId = request.getParameter("cageId");
        int pillar = Integer.parseInt(request.getParameter("tru"));
        int hanger = Integer.parseInt(request.getParameter("moc"));
        int spokes = Integer.parseInt(request.getParameter("nan"));
        int bottom = Integer.parseInt(request.getParameter("day"));
        int door = Integer.parseInt(request.getParameter("cua"));
        int cup = Integer.parseInt(request.getParameter("coc"));
        MaterialDAO md = new MaterialDAO();
        List<Material> list = md.getAllMaterial();
        for (Material material : list) {
            if (material.getMaterialName().equals("trụ")) {
                md.updateQuantityMaterial(cageId, material.getMaterialID(), pillar);
            } else if (material.getMaterialName().equals("móc")) {
                md.updateQuantityMaterial(cageId, material.getMaterialID(), hanger);
            } else if (material.getMaterialName().equals("nan")) {
                md.updateQuantityMaterial(cageId, material.getMaterialID(), spokes);
            } else if (material.getMaterialName().equals("đáy")) {
                md.updateQuantityMaterial(cageId, material.getMaterialID(), bottom);
            } else if (material.getMaterialName().equals("cửa")) {
                md.updateQuantityMaterial(cageId, material.getMaterialID(), door);
            } else if (material.getMaterialName().equals("cốc")) {
                md.updateQuantityMaterial(cageId, material.getMaterialID(), cup);
            }
        }
        response.sendRedirect("DashboardManager");
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
