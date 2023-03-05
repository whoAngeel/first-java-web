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
        %>
        <div class="container mt-5 mx-auto">
            <div class="row mb-2 mx-auto">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Agregar usuario
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Usuario</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="nombre"
                                               class="col-form-label">Nombre: </label>
                                        <input type="text" 
                                               class="form-control" 
                                               id="nombre"
                                               name="nombre"
                                               placeholder="Nombre">
                                    </div>
                                    <div class="mb-3">
                                        <label for="direccion"
                                               class="col-form-label">Direccion </label>
                                        <input type="text" 
                                               class="form-control" 
                                               id="direccion"
                                               name="direccion"
                                               placeholder="Direccion">
                                    </div> 
                                    <div class="mb-3">
                                        <label for="telefono"
                                               class="col-form-label">Telefono </label>
                                        <input type="text" 
                                               class="form-control" 
                                               id="telefono"
                                               name="telefono"
                                               placeholder="Telefono">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Salir</button>
                                        <button type="submit" class="btn btn-primary">Guardar usuario</button>
                                    </div>
                                </form>
                            </div>
                            
                        </div>
                    </div>
                </div>

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
                            <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection(url, user, pass);
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
                                        <i class="btn btn-primary fa-solid fa-user-pen"></i>
                                        <i class="btn btn-danger fa-solid fa-user-minus"></i>
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
