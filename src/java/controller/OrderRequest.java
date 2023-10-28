/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MaterialDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Material;
import model.User;

/**
 *
 * @author trand
 */
@WebServlet(name = "OrderRequest", urlPatterns = {"/OrderRequest"})
public class OrderRequest extends HttpServlet {

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
            out.println("<title>Servlet OrderRequest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderRequest at " + request.getContextPath() + "</h1>");
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
        MaterialDAO dao = new MaterialDAO();
        List<Material> list = dao.getAllMaterial();
        request.setAttribute("listM", list);
        request.getRequestDispatcher("orderRequest.jsp").
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
        try {
            int pillar = Integer.parseInt(request.getParameter("tru"));
            int hanger = Integer.parseInt(request.getParameter("moc"));
            int spokes = Integer.parseInt(request.getParameter("nan"));
            int bottom = Integer.parseInt(request.getParameter("day"));
            int door = Integer.parseInt(request.getParameter("cua"));
            int cup = Integer.parseInt(request.getParameter("coc"));
            HttpSession session = request.getSession();
            int cageQuantity = Integer.parseInt(request.getParameter("cageQuantity"));
            String description = request.getParameter("description");
            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
            double shipCost = Double.parseDouble(request.getParameter("shipCost"));

            MaterialDAO md = new MaterialDAO();
            List<Material> list = md.getAllMaterial();

            int length = 7;
            Random random = new Random();
            char[] text = new char[length];

            for (int i = 0; i < length; i++) {
                text[i] = (char) (random.nextInt(26) + 'a');
            }

            String cageID = new String(text);
            ProductDAO dao = new ProductDAO();
            OrderDAO od = new OrderDAO();

            dao.insertProductRequest(cageID, "7", "Lồng yêu cầu", description, 0, 0, "", 0, "1");
            int length1 = 4;
            Random random1 = new Random();
            char[] text1 = new char[length1];
            for (int i = 0; i < length1; i++) {
                text1[i] = (char) (random1.nextInt(26) + 'a');
            }
            String orderID = new String(text1);

            User u = (User) session.getAttribute("LOGIN_USER");
            java.util.Date currentDate = new java.util.Date();
            java.sql.Date orderDate = new java.sql.Date(currentDate.getTime());
            od.insertOrder(orderID, u.getUserID(), u.getPhone(), u.getAddress(), orderDate, "1", "", shipCost, totalPrice);

            for (Material material : list) {
                if (material.getMaterialName().equals("trụ")) {
                    dao.insertMaterialRequest(cageID, material.getMaterialID(), pillar, "");
                } else if (material.getMaterialName().equals("móc")) {
                    dao.insertMaterialRequest(cageID, material.getMaterialID(), hanger, "");
                } else if (material.getMaterialName().equals("nan")) {
                    dao.insertMaterialRequest(cageID, material.getMaterialID(), spokes, "");
                } else if (material.getMaterialName().equals("đáy")) {
                    dao.insertMaterialRequest(cageID, material.getMaterialID(), bottom, "");
                } else if (material.getMaterialName().equals("cửa")) {
                    dao.insertMaterialRequest(cageID, material.getMaterialID(), door, "");
                } else if (material.getMaterialName().equals("cốc")) {
                    dao.insertMaterialRequest(cageID, material.getMaterialID(), cup, "");
                }
            }
            od.insertOrderDetail(orderID, cageID, "Lồng yêu cầu", totalPrice, cageQuantity);
            //dao.insertMaterialRequest(cageID, "4", pillar, description);
            request.getRequestDispatcher("SuccessOrder.jsp").
                    forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("Error.jsp").
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
