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
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");

    String symptomes = request.getParameter("sym");
    

    String treat = request.getParameter("treat");


    Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/asap", "root", "Software1159");
                 Statement st = con.createStatement();

                 try{
                 st.executeUpdate("insert into verify (Username, Email,mobile, symptomes, Treatment) values('"+username+"', '"+email+"','"+mobile+"', '"+symptomes+"' ,   '"+treat+"'    )");

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