
package smtp;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Engr.Uzma
 */
@WebServlet(name = "updatePassword", urlPatterns = {"/updatePassword"})
public class updatePassword extends HttpServlet {


   
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            HttpSession session=request.getSession();
            String email=String.valueOf(session.getAttribute("resetEmail"));
            String password=request.getParameter("newPass");
            
            String insert="update login_registration set password=? where email=?";
            PreparedStatement statement1;
            Connection con=connection();
            statement1=con.prepareStatement(insert);
            statement1.setString(1, password);
            statement1.setString(2, email);
             statement1.executeUpdate();
             con.close();
             response.sendRedirect("resetPasswordProcessDone.jsp");
        } catch (Exception ex) {
            out.print(ex);
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
     public Connection connection() throws Exception
{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}

}
