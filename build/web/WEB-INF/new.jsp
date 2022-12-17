<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@ page language= "java" contentType ="text/html; charset-150-8859-1" pageEncoding= "ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%@page import ="java.sql.*" %>
        <%@ page import = "javax.sql.*"%>
        <%
    String username = null;
    String email = null;
    String mobile = null;    
    String textarea = null;
    
    Map<String, String> map = new HashMap<String, String>();
    
    String contentType = request.getContentType();
    
    if ((contentType.indexOf("multipart/form-data") >= 0)) {
    	File file;
    	int maxFileSize = 5000 * 1024;
    	int maxMemSize = 5000 * 1024;
        String filePath = getServletContext().getRealPath("/") + "/uploads/";
        System.out.println(filePath);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File(filePath));
        
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
    
        try { 
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(new ServletRequestContext(request));

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            while ( i.hasNext () ) {
               FileItem fi = (FileItem)i.next();
               if ( fi.isFormField () ) {
            	   map.put(fi.getFieldName(), fi.getString());
                  
               } else {
            	// Get the uploaded file parameters
                   String fieldName = fi.getFieldName();
                   String fileName = fi.getName();
                   boolean isInMemory = fi.isInMemory();
                   long sizeInBytes = fi.getSize();
                   
                
                   // Write the file
                   if( fileName.lastIndexOf("\\") >= 0 ) {
                      file = new File( filePath + 
                      fileName.substring( fileName.lastIndexOf("\\"))) ;
                   } else {
                      file = new File( filePath + 
                      fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                   }
                   fi.write( file ) ;
               }
            }

         } catch(Exception ex) {
            System.out.println(ex);
         }
    }


    Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/asap", "root", "Software1159");
                 Statement st = con.createStatement();

                 try{
                 st.executeUpdate("insert into contact (Username, Email,mobile, symptomes) values('"+map.get("username")+"', '"+map.get("email")+"','"+map.get("mobile")+"', '"+map.get("msg")+"')");

           %>
                   <div class="alert alert-success text-center" role="alert">
      Data  inserted successfully!
  
</div>
           <%        }
                     
catch(Exception e){
%>

  
   
   <div class="alert alert-success text-center" role="alert">
      Data  already exist
  
</div>


              <%       }
    
                 %>
                 
     <br/>
	<div class="container mx-auto">
		<div class="row">
			<div class="col-12 text-center">
				<a href="index.html">Go to Home</a>
			</div>
		</div>
	</div>     
                
    </body>
</html>