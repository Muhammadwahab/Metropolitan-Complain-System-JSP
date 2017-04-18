
package smtp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
@WebServlet(name = "Reset", urlPatterns = {"/Reset"})
public class Reset extends HttpServlet {
    Statement statement;
    Connection connection;

    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out=response.getWriter();
        
        try {
           
            connection=connection();
            String reset=request.getParameter("resetText");
            statement=connection.createStatement();
            String CheckQuery="Select email from login_registration where email='"+reset+"' or displayname='"+reset+"'";
            ResultSet rs=statement.executeQuery(CheckQuery);
            
            
            
            if(rs.next())
            {
                out.print("Reset email valid");
                HttpSession session=request.getSession();
            session.setAttribute("resetEmail", reset);
           
            
            }
            else
            {
             out.print("reset not valid");
            }
           
            
            connection=connection();
        } catch (Exception ex) {
            out.print(ex);
        }
        
        
        
        
       
    }
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
