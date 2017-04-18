package smtp;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet(name = "update", urlPatterns = {"/update"})
@MultipartConfig(maxFileSize = 77777777)
public class update extends HttpServlet {
    private int Public_part;
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
          PrintWriter writer=response.getWriter();
        
        
        
        HttpSession session=request.getSession();
        
        try {
            Connection con=connection();
            Statement statement=con.createStatement();
               String name=request.getParameter("name");
          
            String Email=String.valueOf(session.getAttribute("email"));
            if(name.equalsIgnoreCase("picture"))
            {
                String insert="update login_registration set "+name+"=? where email=?";
                PreparedStatement statement1;
                 statement1=con.prepareStatement(insert);
                // for uploading image
         InputStream inputStream=null;
        Part part=request.getPart("picture");
        String n=part.getName();
        n=part.getContentType();
        long sn=part.getSize();
        Public_part=(int)part.getSize();
        System.err.println(part.getName());
        System.err.println(part.getSize());
        System.err.println(part.getContentType());
        inputStream =part.getInputStream();
         statement1.setString(6, Email);
                 statement1.setBlob(8, inputStream,Public_part);
                  statement1.executeUpdate();
                con.close();
                 writer.print("1");
               
            
            }
            else {
            String dataValue=request.getParameter("value");
            String insert="update login_registration set "+name+"='"+dataValue+"' where email='"+Email+"'";
            writer.print("1");
            statement.execute(insert);
            con.close();
            }
             
            
        } catch (Exception ex) {
            writer.print("Exception Found "+ex);
        }
       
     }
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter writer=response.getWriter();
        
        
        
        HttpSession session=request.getSession();
        
        try {
            Connection con=connection();
            Statement statement=con.createStatement();
               String name=request.getParameter("name");
                 Part part=request.getPart("files[]");
          
            String Email=String.valueOf(session.getAttribute("email"));
            if(name.equalsIgnoreCase("picture"))
            {
                String insert="update login_registration set "+name+"=? where email=?";
                PreparedStatement statement1;
                 statement1=con.prepareStatement(insert);
                // for uploading image
         InputStream inputStream=null;
      
        String n=part.getName();
        n=part.getContentType();
        long sn=part.getSize();
        Public_part=(int)part.getSize();
        System.err.println(part.getName());
        System.err.println(part.getSize());
        System.err.println(part.getContentType());
        inputStream =part.getInputStream();
         statement1.setBlob(1, inputStream,Public_part);
         statement1.setString(2, Email);
                
                  statement1.executeUpdate();
                con.close();
                 response.sendRedirect("setting.jsp");
               
            
            }
            else {
            String dataValue=request.getParameter("value");
            String insert="update login_registration set "+name+"='"+dataValue+"' where email='"+Email+"'";
            writer.print("1");
            statement.execute(insert);
            con.close();
            }
             
            
        } catch (Exception ex) {
            writer.print("Exception Found "+ex);
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
