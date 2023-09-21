/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author HOANGDUC
 */
public class MainController extends HttpServlet {
    
    private static final String USERMANAGER = "userManager.jsp";
    
    private static final String SEARCHUSER = "Search";
    private static final String SEARCHUSER_CONTROLLLER = "SearchUserController";
    
    private static final String DELETEUSER = "deleteUser";
    private static final String DELETEUSER_CONTROLLER = "DeleteUserController";
    
    private static final String UPDATEUSER = "updateUser";
    private static final String UPDATEUSER_CONTROLLLER = "UpdateUserController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String url = USERMANAGER;
            UserDAO dao = new UserDAO();
            try {
            String action = request.getParameter("action");
            if (action == null) {
                url = USERMANAGER;
            }
            else if(SEARCHUSER.equals(action)){
                url = SEARCHUSER_CONTROLLLER;
            }else if(UPDATEUSER.equals(action)){
                url = UPDATEUSER_CONTROLLLER;
            }
             
        } catch (Exception e) {
        }finally{
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
