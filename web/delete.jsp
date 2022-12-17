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
//   String username = request.getParameter("username");
    String email = request.getParameter("email");
   



    Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/asap", "root", "Software1159");
                 Statement st = con.createStatement();

                 try{
//                 int i=st.executeUpdate("DELETE FROM users WHERE id="+id);
                 st.executeUpdate("delete from verify where Email =" +email);

           %>
                   <div class="alert alert-success text-center" role="alert">
        Data  deleted successfully
  
</div>
           <%        }
                     
catch(Exception e){
%>

  
   
   <div class="alert alert-success text-center" role="alert">
      Data is not deleted
  
</div>
              <%       }
    
                 %>
                 
          
                
    </body>
</html>