<%-- 
    Document   : aive
    Created on : 09-Jun-2022, 4:19:22 pm
    Author     : sukhpreetsingh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.Connection"%>
<%--<%@page import = "Project.ConnectionProvider" %>--%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
 
    String email = request.getParameter("email");

try{
   
       Class.forName("com.mysql.jdbc.Driver").newInstance();
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/asap", "root", "Software1159");
                 Statement st = con.createStatement(); 
                    st.executeUpdate("delete from verify where Email ='" +email+ "'");
                    response.sendRedirect("retrive.jsp?msg=deleted");

           
        
        }
        
        catch(Exception e){
        response.sendRedirect("retrive.jsp?msg=not deleted");
        }
         %>
    </body>
</html>
