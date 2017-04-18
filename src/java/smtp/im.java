package smtp;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.Math.random;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Engr.Uzma
 */
@WebServlet("/im")
@MultipartConfig(maxFileSize = 77777777)
public class im extends HttpServlet {
    String firstname,middlename,lastname,displayname,password,email,code,PhoneNumber;
    
 
Connection con;
//java.sql.Statement statement;
    PreparedStatement statement;
ResultSet rs;
boolean valid=false ,loginvalid=false;
Random random=new Random();
    private int Public_part;
public Connection connection() throws Exception
{
 
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}
public void insert_into_Database(String firstname,String middlename,String lastname,String displayname ,String password,String email,long code,InputStream Image_streem,String phone) {
        
        try {
            con=connection();
           // statement=con.createStatement();
            
           // String insert="insert into login_registration (firstname,middlename,lastname,displayname,password,email,code) values ('"+firstname+"','"+middlename+"','"+lastname+"','"+displayname+"','"+password+"','"+email+"',"+code+")";
           // statement.execute(insert);
            String insert="insert into login_registration (firstname,middlename,lastname,displayname,password,email,code,picture,PhoneNumber) values (?,?,?,?,?,?,?,?,?)";

            statement=con.prepareStatement(insert);
            statement.setString(1, firstname);
            statement.setString(2, middlename);
            statement.setString(3, lastname);
            statement.setString(4, displayname);
            statement.setString(5, password);
            statement.setString(6, email);
            statement.setLong(7, code);
            statement.setBlob(8, Image_streem,Public_part);
            statement.setString(9, phone);
            statement.executeUpdate();
            con.close();
        } catch (Exception e) {
            
            Exception a=e;
            a=e;
            
            
        }
    }


   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       
        
       
         firstname=request.getParameter("first_name");
    middlename=request.getParameter("middle_name");
    lastname=request.getParameter("last_name");
    displayname=request.getParameter("display_name");
    email=request.getParameter("email");
    password=request.getParameter("password");
    PhoneNumber=request.getParameter("Phone_Number");
    long codenumber=random.nextInt(100)*1000;
     // for uploading image
         InputStream inputStream=null;
        Part part=request.getPart("files[]");
        String n=part.getName();
        n=part.getContentType();
        long sn=part.getSize();
        Public_part=(int)part.getSize();
        System.err.println(part.getName());
        System.err.println(part.getSize());
        System.err.println(part.getContentType());
inputStream =part.getInputStream();
    insert_into_Database(firstname,middlename,lastname,displayname,password,email,codenumber,inputStream,PhoneNumber);
         new Email(email,codenumber);
         response.sendRedirect("verify.jsp");
       


    }
}