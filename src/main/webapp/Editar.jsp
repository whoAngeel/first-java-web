<%-- 
    Document   : Editar
    Created on : 5 mar 2023, 11:29:22
    Author     : whoangel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://kit.fontawesome.com/43486f88a1.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/43486f88a1.js" crossorigin="anonymous"></script>

        <title>Editar Usuario</title>
    </head>
    <body>
        <%
            String nombre = "";
            String direccion = "";
            String telefono = "";
            String id = request.getParameter("id");
            Connection con = null;
            Statement st = null;
            PreparedStatement pst = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/cursojava", "root", "admin");
            try {
                st = con.createStatement();
                rs = st.executeQuery("select * from empleados where id=" + id + ";");
                while (rs.next()) {
                    nombre = rs.getString(2);
                    direccion = rs.getString(3);
                    telefono = rs.getString(4);
                }
            } catch (SQLException e) {
        %>
        <div class="alert alert-danger"><%= e%></div> 
        <%
            }
        %>
        <div class="container mt-5">
            <h2 class="text-center">Editar Usuario</h2>
            <div class=" d-flex justify-content-center align-items-center">
                <form
                    actions="Editar.jsp"
                    method="get"
                    class="w-50">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input 
                            type="text" 
                            class="form-control" 
                            id="nombre"
                            name="nombre"
                            placeholder="Nombre"
                            value="<%= nombre%>"/>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Direccion:</label>
                        <input type="text" 
                               class="form-control" 
                               id="direccion" 
                               name="direccion"
                               placeholder="Direccion"
                               value="<%= direccion%>"/>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Telefono:</label>
                        <input type="number" 
                               class="form-control" 
                               id="telefono" 
                               name="telefono"
                               placeholder="Telefono"
                               value="<%= telefono%>"/>
                    </div>
                    <div class="d-flex justify-content-end">
                        <a href="index.jsp" class="btn">Cancelar</a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar cambios</button>
                        <input type="hidden" name="id" value="<%= id%>">
                    </div>
                </form>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                nombre = request.getParameter("nombre");
                direccion = request.getParameter("direccion");
                telefono = request.getParameter("telefono");
                try {
                    String updateQuery = "update empleados set nombre='" + nombre + "', direccion='" + direccion + "', telefono='" + telefono + "' where id=" + request.getParameter("id")+";";
                    st = con.createStatement();
                    int isExecuted = st.executeUpdate(updateQuery);
                    if (isExecuted<=0) {
                        %>
                        <div class="alert alert-danger">No se ha podido actualizar el registro</div> 
                        <%
                    } else {
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
        } catch (Exception e) {
        %>
        <div class="alert alert-danger"><% out.println(e.getMessage());%></div> 
        <%
                }
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

    </body>
</html>
