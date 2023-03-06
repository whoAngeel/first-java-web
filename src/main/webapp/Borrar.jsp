<%-- 
    Document   : Borrar.jsp
    Created on : 5 mar 2023, 17:10:54
    Author     : whoangel
--%>

<%@page import="com.angel.javaweb.UConexion"%>
<%@page import="javax.management.RuntimeErrorException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = UConexion.getConnection();
            PreparedStatement pstm = null;
            out.print(request.getParameter("id"));
            try {
                String deleteQuery = "delete from empleados where id=?";
                pstm = con.prepareStatement(deleteQuery);
                pstm.setInt(1, Integer.parseInt(request.getParameter("id")));
                int rtdo = pstm.executeUpdate();
                if (rtdo > 1) {
                    throw new RuntimeException("Error: " + rtdo +" filas eliminadas...");
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
