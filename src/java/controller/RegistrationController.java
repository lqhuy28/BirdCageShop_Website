/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import model.UserError;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author QUANHONG
 */
public class RegistrationController extends HttpServlet {

    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            UserDAO dao = new UserDAO();
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String phone = request.getParameter("Phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String roleID = request.getParameter("roleID");

            boolean checkValidation = true;
            if (userID.length() > 10 || userID.length() < 3) {
                userError.setUserIDError("Tên đăng nhập phải từ 3-10 kí tự");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                userError.setUserIDError("Tên đăng nhập đã tồn tại");
                checkValidation = false;
            }
            if (fullName.length() > 50 || fullName.length() < 2) {
                userError.setFullNameError("Tên phải từ 2 tới 50 chữ");
                checkValidation = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmError("Hai password không giống nhau");
                checkValidation = false;
            }

            //kiem tra data da validation hay chua
            if (checkValidation) {
                User user = new User(userID, fullName, password, phone, email, address, roleID);
                //boolean checkCreate = dao.create2(user);
                boolean checkLogin = dao.insert(user);
                if (checkLogin) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }

        } catch (Exception e) {
            log("Error at RegistrationController" + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("Trung ID roi kia");
                request.setAttribute("USER_ERROR", userError);
            }

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
