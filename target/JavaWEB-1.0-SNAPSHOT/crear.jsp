<%-- 
    Document   : crear
    Created on : 5 mar 2023, 01:33:11
    Author     : whoangel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://kit.fontawesome.com/43486f88a1.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/43486f88a1.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center">Agregar Usuario</h2>
            <div class=" d-flex justify-content-center align-items-center">
                <form
                    actions="crear.jsp"
                    method="post"
                    class="w-50">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input 
                            type="text" 
                            class="form-control" 
                            id="nombre"
                            name="nombre"/>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Direccion:</label>
                        <input type="text" 
                               class="form-control" 
                               id="direccion" 
                               name="direccion"/>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Telefono:</label>
                        <input type="number" 
                               class="form-control" 
                               id="telefono" 
                               name="telefono"/>
                    </div>
                    <div class="d-flex justify-content-end">
                        <a href="index.jsp" class="btn">Cancelar</a>
                        <button type="submit" name="enviar" class="btn btn-primary">Agregar usuario</button>
                    </div>
                </form>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String nombre = request.getParameter("nombre");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/cursojava", "root", "admin");
                    st = con.createStatement();
                    String sql = String.format("insert into empleados (nombre, direccion, telefono) values ('%s','%s','%s');", nombre, direccion, telefono);
                    st.executeUpdate(sql);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
</html>
