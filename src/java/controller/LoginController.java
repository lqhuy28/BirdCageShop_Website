/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author QUANHONG
 */
public class LoginController extends HttpServlet {
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String HOMEPAGE = "homePage.jsp";
    private static final String DASHBOARD = "dashboard.jsp";
    private static final String US = "User";
    private static final String AD = "Admin";
    private static final String T = "1";
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            User loginUser = dao.checkLogin(userID, password);
            if (loginUser == null) {
                request.setAttribute("ERROR", "Tên đăng nhập hoặc mật khẩu không đúng !");
            } else {
                String roleID = loginUser.getRoleID();
                String status = loginUser.getStatus();
                HttpSession session = request.getSession();
                if (AD.equals(roleID)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = DASHBOARD;
                } else if (US.equals(roleID) && T.equalsIgnoreCase(status)) {
                    session.setAttribute("LOGIN_USER", loginUser);
                    url = HOMEPAGE;
                } else {
                    request.setAttribute("ERROR", "Tài khoản của bạn không được hỗ trợ !");
                }
                        
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
//            response.sendRedirect(url);
            if(url == HOMEPAGE ){
                response.sendRedirect("MainController");
            }else{
                request.getRequestDispatcher(url).forward(request, response);
            }
            
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
