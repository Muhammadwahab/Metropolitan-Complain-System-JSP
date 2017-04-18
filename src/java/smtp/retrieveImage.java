package smtp;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class retrieveImage extends HttpServlet {
           private String imagePath="C:\\Users\\Engr.Uzma\\Desktop\\Complains";
           private String reset=imagePath;
	private String pic;
    private boolean check;
    private String checkValue;


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     // PrintWriter out=response.getWriter();
//       out.close();
        String value=request.getParameter("value");
        checkValue="";
        String type=request.getParameter("type");
		File f1=new File(imagePath);
		
		if(f1.isDirectory())
		{
			String store[]=f1.list();
			
			
			for(int i=0;i<store.length;i++)
			{
                             if(check==true)
                                    {
                                        check=false;
                                    break;
                                    }
				
			File newfile=new File(imagePath+"\\"+store[i]);
			if(newfile.isDirectory() && store[i].equalsIgnoreCase(value))
			{
				imagePath=imagePath+"\\"+store[i];
				
				String againStore[]=newfile.list();
				
				for(int j=0;j<againStore.length;j++)
				{
                                    if(check==true)
                                    {
                                        check=false;
                                    break;
                                    }
					File imageFile=new File(imagePath+"\\"+againStore[j]);
					if(imageFile.isDirectory() && againStore[j].equalsIgnoreCase(type)){
						imagePath=imagePath+"\\"+againStore[j];
						String Image[]=imageFile.list();
						for(int k=0;k<Image.length;k++)
						{
							File image=new File(imagePath+"\\"+Image[k]);
							if(!image.isDirectory())
							{
								//imagePath=imagePath+"\\"+Image[k]; // picture name
								pic=Image[k];
                                                                check=true;
                                                                checkValue=value;
								break;
							}
							
						}
						
					}
					
					
				}
				
				
			}
			
			}
		}
		
		
		if(value.equalsIgnoreCase(checkValue))
		{
			File file=new File(imagePath, pic);
			int size=0;
			size=(int)file.length();
			byte[] byt=new byte[size];
			OutputStream outputStream=response.getOutputStream();
			RandomAccessFile accessFile=new RandomAccessFile(file,"r");
			accessFile.read(byt);
			accessFile.close();
			outputStream.write(byt);
			outputStream.close();
                        imagePath=reset;
			
			
			
		}
		else
		{
			
			
		}
        
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
