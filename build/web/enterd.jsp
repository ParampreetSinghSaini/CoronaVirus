<%-- 
    Document   : retrive
    Created on : 09-Jun-2022, 8:05:52 am
    Author     : sukhpreetsingh
--%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link rel="stylesheet" href="afterlogin.css"> 

    </head>
    <body>
        
         
      <div class="navbar">
  <a href="insert.html">INSERT NEW DATA</a>
  <a href ="enterd.jsp" > UserDetails</a>
  <!--<a href="delete.html">DELETE</a>-->
   <a href="index.html" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out
 
</div>

        
        
        
        
        
        
        
        
        
        
        
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
     String username = request.getParameter("username");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");

    String symptomes = request.getParameter("sym");
  String treat = request.getParameter("treat");

    
    
    
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "asap";
String userId = "root";
String password = "Software1159";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<div style="margin: 320px 400px; "> 
<!--<h2 align="center"><font><strong>Data</strong></font></h2>-->
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>UserName</b></td>
<td><b>Email</b></td>
<td><b>Mobile</b></td>
<td><b>Message</b></td>



</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM contact";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("mobile") %></td>
<td><%=resultSet.getString("symptomes") %></td>


<!--<td>
   
   
    <a href ="aive.jsp" class ="btn btn-danger"></a>
    
</td>    <a href ="aive.jsp?email=<%=resultSet.getString("email")%>" class="btn btn-danger"></a> 
    
    <a href ="aive.jsp" class ="btn btn-danger"></a>
    
</td>-->

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        </table>
    </center>
        
</div>
        
    </body>
</html>
