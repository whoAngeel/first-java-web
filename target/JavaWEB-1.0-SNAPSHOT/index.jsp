<%-- 
    Document   : index
    Created on : 3 mar 2023, 23:29:52
    Author     : whoangel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5 mx-auto">
            <div class="row">
                <div class="col-sm">

                    <form >
                        <div class="form-group">
                            <label for="name">Nombre:</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="edad">Edad:</label>
                            <input type="number" class="form-control" name="edad">
                        </div>
                        <button type="submit" class="btn btn-primary" type="button">Enviar</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <%
                            String nombre = request.getParameter("name");
                            String edad = request.getParameter("edad");
                            String saludar = "Hola " + nombre;
                            out.println(saludar);
                        %>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
