
import dao.UserDAO;
import java.sql.SQLException;
import java.util.List;
import model.User;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Acer
 */
public class test {
    public static void main(String[] args) throws SQLException {
        UserDAO dao = new UserDAO();
        User user = dao.getUserByuserID("manh");
        System.out.println(user);
    }
}
