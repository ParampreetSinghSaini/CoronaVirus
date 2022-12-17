<%-- 
    Document   : login
    Created on : 20-Apr-2022, 3:31:30 pm
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%! String uname, pass;%>
        <% 
uname = request.getParameter("em");
pass = request.getParameter("pass");
    if(uname.equals("Param@gmail.com") && pass.equals("123"))
    {%>
    <jsp:forward page = "retrive.jsp"/>
    <%} else
   {%>
    wrong UserName/Password, Try Again!!!
    <jsp:include page = "adminlogin.html"/>
    <%} %>

            

           
    </body>
</html>