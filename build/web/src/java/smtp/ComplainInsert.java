package smtp;




import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ComplainInsert")
@MultipartConfig(maxFileSize = 77777777)
public class ComplainInsert extends HttpServlet {
    private int Public_part;
    Part part;
    private int BUFFER_LENGTH;
    String Snaps,Video,Files,ComplainNumber;
    Connection con;
java.sql.Statement statement;
ResultSet rs;
Random random=new Random();
     
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        
        // insert in adminstrator
        String nic=request.getParameter("nic");
         String complain=request.getParameter("textarea");
         long codenumber=random.nextInt(100)*1327;
         String trackingCode=nic+"-"+codenumber;
         insert_into_Administration(nic,complain,trackingCode);
         
        
       
    
     // for uploading image
//        File file;
//        byte[ ] fileData = null ;
//         InputStream inputStream=null;
       Part part=request.getPart("files");
       int count=1;
FileOutputStream os=null;

// temporary

 for ( Part parti : request.getParts()) {
         //   InputStream is = request.getPart(parti.getName()).getInputStream();
            InputStream is = parti.getInputStream();
            String fileName = parti.getSubmittedFileName();
            if(fileName==null)
            {
            continue;
            }
            
            count++;
            StringBuilder builder=new StringBuilder(fileName);
            int index=builder.lastIndexOf(".");
            String extension=null;
            String Number=trackingCode;
            setComplainDirectory(Number);
            
           
            
          
            BUFFER_LENGTH=(int)parti.getSize();
            
            
           if(!fileName.equalsIgnoreCase(""))
           {
            // out.println(fileName + " was uploaded to " +"C:\\Users\\Engr.Uzma\\Desktop\\Game" );
                 extension=builder.substring(++index);
                 if(extension.equalsIgnoreCase("jpg")||extension.equalsIgnoreCase("jpeg")||extension.equalsIgnoreCase("gif"))
                 {
                     // os = new FileOutputStream("C:\\Users\\Engr.Uzma\\Desktop\\Complains" + fileName);
                     os = new FileOutputStream("C:\\Users\\Engr.Uzma\\Desktop\\Complains\\"+Number+"\\Snaps\\" + fileName);
                 }
                 else if(extension.equalsIgnoreCase("MP4"))
                 {
                 
                     os = new FileOutputStream("C:\\Users\\Engr.Uzma\\Desktop\\Complains\\"+Number+"\\Videos\\" + fileName);
                 }
                 else if(extension.equalsIgnoreCase("pdf"))
                 {
                 
                     os = new FileOutputStream("C:\\Users\\Engr.Uzma\\Desktop\\Complains\\"+Number+"\\Dacuments\\" + fileName);
                 }
            
            byte[] bytes = new byte[BUFFER_LENGTH];
            int read = 0;
            while ((read = is.read(bytes, 0, BUFFER_LENGTH)) != -1) {
                os.write(bytes, 0, read);
            }
           }
           // os.flush();
            is.close();
            os.close();
            out.println(fileName + " was uploaded to " + "C:\\Users\\Engr.Uzma\\Desktop\\Game"+index+"extension is "+extension);
        }
            response.sendRedirect("SuccessFull.jsp?code="+trackingCode+"&nic="+nic);

    }
    
    public void setComplainDirectory(String Number){
         if (new File("C:\\Users\\Engr.Uzma\\Desktop\\Complains\\"+Number+"\\Snaps").mkdirs() && new File("C:\\Users\\Engr.Uzma\\Desktop\\Complains\\"+Number+"\\Videos").mkdirs() && new File("C:\\Users\\Engr.Uzma\\Desktop\\Complains\\"+Number+"\\Dacuments").mkdirs()) {
            System.out.println("directory creates");
            
        }
        else
        {
        System.out.println("directory not creates");
        }
        
}
    public void insert_into_Administration(String nic,String complain,String Code) {
        
        try {
            con=connection();
            statement=con.createStatement();
            String insert="insert into administrator(complain,nic,TrackingCode) values ('"+complain+"','"+nic+"','"+Code+"')";
            statement.execute(insert);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
            
            
        }
      
    }
      public Connection connection() throws Exception
{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaincenter","root","");
return con;
}
}