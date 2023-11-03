/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.ProductDTO;
import model.User;

/**
 *
 * @author HOANGDUC
 */
public class MainController extends HttpServlet {

    private static final String HOMEPAGE = "homePage.jsp";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGINPAGE = "LoginPage";
    private static final String LOGIN_PAGE = "login.jsp";
    
    private static final String VIEWCART = "ViewCart";
    private static final String VIEWCART_PAGE = "viewCart.jsp";

    private static final String SEARCHUSER = "Search";
    private static final String SEARCHUSER_CONTROLLLER = "SearchUserController";

    private static final String DELETEUSER = "deleteUser";
    private static final String DELETEUSER_CONTROLLER = "DeleteUserController";

    private static final String UPDATEUSER = "updateUser";
    private static final String UPDATEUSER_CONTROLLLER = "UpdateUserController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    private static final String REGISTRATION = "Register";
    private static final String REGISTRATION_CONTROLLER = "RegistrationController";

    private static final String ADDCONTROL = "AddControl";
    private static final String ADD_CONTROL = "AddControl";

    private static final String UPDATECONTROL = "UpdateControl";
    private static final String UPDATE_CONTROL = "UpdateControl";

    private static final String DELETECONTROL = "DeleteControl";
    private static final String DELETE_CONTROL = "DeleteControl";

    private static final String LOADCONTROL = "LoadControl";
    private static final String LOAD_CONTROL = "LoadControl";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = HOMEPAGE;
        UserDAO dao = new UserDAO();
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOMEPAGE;
            } else if (SEARCHUSER.equals(action)) {
                url = SEARCHUSER_CONTROLLLER;
            } else if (UPDATEUSER.equals(action)) {
                url = UPDATEUSER_CONTROLLLER;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (REGISTRATION.equals(action)) {
                url = REGISTRATION_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (LOGINPAGE.equals(action)) {
                url = LOGIN_PAGE;
            } else if (VIEWCART.equals(action)) {
                url = VIEWCART_PAGE;
            }
        } catch (Exception e) {
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ProductDAO dao = new ProductDAO();
        String action = request.getParameter("action");
        if (action == null) {
            List<Category> listC = dao.getAllCategory();
            int i =1;
            for (Category category : listC) {
                List<ProductDTO> list = dao.getProductByCategoryID(category.getCategoryID());
                request.setAttribute("listS"+i, list);
                i++;
            }
            request.setAttribute("listCC", listC);

            request.getRequestDispatcher("homePage.jsp").
                    forward(request, response);
        }else{
            processRequest(request, response);
        }

        //processRequest(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
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
