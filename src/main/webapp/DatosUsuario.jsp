<%-- 
    Document   : DatosUsuario
    Created on : 6 mar 2023, 20:42:54
    Author     : whoangel
--%>

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
        <title>Usuario</title>
    </head>
    <body>
        <%
            boolean errorUpdateUser = false;
            boolean passwordsNotEquals = false;
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado").equals("0") || session.getAttribute("logueado") == null) {
                response.sendRedirect("Login.jsp");
            }
            Connection conn = UConexion.getConnection();
            Statement stm = null;

        %>
        <div class="container ">
            <div class="row align-items-center justify-content-center vh-100 ">
                <h3 class="text-center fixed-top mt-5 pt-4">Editando información del usuario</h3>
                <form action="DatosUsuario.jsp"
                      method="post"
                      class="mx-auto bg-light p-3 rounded"
                      style="width: 25%;">
                    <h2 class="text-center fs-2 mb-3"><i class="fa-solid fa-user"></i> <%= session.getAttribute("user")%></h2>
                    <div class="form-group">
                        <label for="">Nombre de usuario:</label>
                        <input name="user" 
                               class="form-control"
                               value="<%= sesion.getAttribute("user")%>"
                               placeholder="Usuario"
                               type="text">
                    </div>
                    <div class="form-group mt-1">
                        <label for="">Contraseña:</label>
                        <input type="password"
                               name="password1"
                               placeholder="Contraseña"
                               class="form-control"> 
                    </div>
                    <div class="form-group mt-1">
                        <label for="">Confirmar contraseña:</label>
                        <input type="password"
                               name="password2"
                               placeholder="Contraseña"
                               class="form-control">
                    </div>
                    <div class="d-flex justify-content-end mt-3">
                        <a href="index.jsp" class="btn">Cancelar</a>
                        <button class="btn btn-primary "
                                name="guardar">
                            Guardar
                        </button> 
                    </div>

                </form>

            </div>
        </div>
        <%
            if (request.getParameter("guardar") != null && 
            request.getParameter("user") != "" && 
            request.getParameter("password1") != "" &&
            request.getParameter("password2") != "") {
                String user = request.getParameter("user");
                String pass1 = request.getParameter("password1");
                String pass2 = request.getParameter("password2");
                if (pass1.equals(pass2)) {
                    try {
                        stm = conn.createStatement();
                        String sql = String.format("update user set user='%s', password='%s' where id='%s';", user, pass1, sesion.getAttribute("id"));
                        int res = stm.executeUpdate(sql);
                        if (res >= 1) {
                            sesion.setAttribute("user", user);
                            response.sendRedirect("index.jsp");
                        }
        %>
        <div class="alert alert-warning rounded fixed-top w-50 mx-auto mt-2 text-center">
            No se pudo actualizar el usuario
        </div>
        <%
        } catch (Exception e) {
        %> 
        <div class="alert alert-danger rounded fixed-top w-50 mx-auto mt-2 text-center">
            <%= e.getMessage()%>
        </div>
        <%
            }
        } else {
        %> 
        <div class="alert alert-warning rounded fixed-top w-50 mx-auto mt-2 text-center">
            Las contraseñas no coinciden
        </div>
        <%
                }
            }
        %>
    </body>
</html>
