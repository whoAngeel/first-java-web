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
            <div class="row">
                <div class="col-sm">
                    <table class="table table-hover table-sm">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">telefono</th>
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

    </body>
</html>
