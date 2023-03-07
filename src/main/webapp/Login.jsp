<%-- 
    Document   : Login
    Created on : 5 mar 2023, 18:39:21
    Author     : whoangel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.angel.javaweb.UConexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://kit.fontawesome.com/43486f88a1.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/43486f88a1.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            boolean errorSesion = false;
        %>
        <style>
            label {
                margin-bottom: 5px;
            }
            form {
                width: 30%;
            }
        </style>
        <div class="container ">
            <div class="row align-items-center justify-content-center vh-100 ">

                <form method="post" 
                      action="Login.jsp"
                      class="mx-auto bg-body-secondary p-3 rounded"
                      style="width: 25%;">
                    <h2 class="text-center fs-2 mb-3">Inicio de sesión</h2>
                    <div class="form-group">
                        <label for="">Nombre de usuario:</label>
                        <input name="user" 
                               class="form-control" 
                               placeholder="Usuario"
                               autocomplete="off"
                               type="text">
                    </div>
                    <div class="form-group">
                        <label for="">Contraseña:</label>
                        <input type="password"
                               name="password"
                               placeholder="Contraseña"
                               class="form-control">
                    </div>
                    <button class="btn btn-primary mt-3"
                            name="login">
                        Ingresar
                    </button>
                </form>
            </div>
        </div>
    </body>

    <%
        Connection conn = UConexion.getConnection();
        Statement stm = null;
        ResultSet rs = null;
        if (request.getParameter("login") != null) {
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            HttpSession sesion = request.getSession();
            try {
                stm = conn.createStatement();
                String sql = String.format("SELECT * FROM cursojava.user where user='%s' and password='%s';", user, password);
                rs = stm.executeQuery(sql);
                while (rs.next()) {
                    sesion.setAttribute("logueado", 1);
                    sesion.setAttribute("user", rs.getString("user"));
                    sesion.setAttribute("id", rs.getString("id"));
                    response.sendRedirect("index.jsp");
                }
    %>
    <div class="alert alert-danger rounded fixed-top w-50 mx-auto mt-2 text-center">
        Usuario no valido
    </div>
    <%
    } catch (Exception e) {
    %>
    <div class="alert alert-warning rounded fixed-top w-50 mx-auto mt-2 text-center">
        <%= e.getMessage() %>
    </div>
    <%
            }
        }
        /*   
if (request.getParameter("login") != null) {
String user = request.getParameter("user");
            
if (user.equals("admin") && password.equals("admin")) {
    session.setAttribute("logueado", "1");
    session.setAttribute("user", user);
    errorSesion = false;
    response.sendRedirect("index.jsp");
} else {
    errorSesion = true;
}
}
         */
    %>
</html>
