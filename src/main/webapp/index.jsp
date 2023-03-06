<%-- 
    Document   : index
    Created on : 3 mar 2023, 23:29:52
    Author     : whoangel
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://kit.fontawesome.com/43486f88a1.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/43486f88a1.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js" integrity="sha384-THPy051/pYDQGanwU6poAc/hOdQxjnOEXzbT+OuUAFqNqFjL+4IGLBgCJC3ZOShY" crossorigin="anonymous"></script>

        <title>Lista de empleados</title>
    </head>
    <body>  
        <%
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/cursojava";
            String user = "root";
            String pass = "admin";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
        <div class="container mt-5 mx-auto w-75">
            <div class="row mb-2 mx-auto">
                <!-- Button trigger modal -->
                <a href="crear.jsp" type="button" class="btn btn-primary w-100">
                    Agregar usuario
                </a>

            </div>
            <div class="row">
                <div class="col-sm">
                    <table class="table table-hover table-sm">
                        <thead>
                            <tr class="text-center bg-primary text-light">
                                <th scope="col" colspan="4" >Empleados</th>
                                <th scope="col">
                                    <i class="fa-solid fa-users"></i>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">telefono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                try {
                                    st = conn.createStatement();
                                    String sql = "SELECT * FROM cursojava.empleados;";
                                    rs = st.executeQuery(sql);
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"> <%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td>
                                    <div class="d-flex justify-content-around">
                                        <a href="Editar.jsp?id=<%=rs.getString(1)%>"
                                           class="btn btn-primary">
                                            <i class=" fa-solid fa-user-pen"></i>    
                                        </a>
                                        <a href="Borrar.jsp?id=<%=rs.getString(1)%>"
                                           type="button" 
                                           class="btn btn-danger">
                                            <i class=" fa-solid fa-user-minus"></i>
                                        </a>


                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>


                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm">

                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

    </body>
</html>
