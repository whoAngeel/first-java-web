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
        <link href="https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://kit.fontawesome.com/43486f88a1.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/43486f88a1.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js" integrity="sha384-THPy051/pYDQGanwU6poAc/hOdQxjnOEXzbT+OuUAFqNqFjL+4IGLBgCJC3ZOShY" crossorigin="anonymous"></script>

        <title>Lista de empleados</title>
    </head>
    <body>  
        <%

            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado").equals("0") || session.getAttribute("logueado") == null) {
                response.sendRedirect("Login.jsp");
            }


        %>
        <nav class="navbar bg-body-tertiary bg-primary-subtle">
            <div class="container-fluid justify-content-around">
                <a class="navbar-brand">Empleados</a>
                <form class="d-flex justify-content-around align-items-center" 
                      role="search"
                      action="Logout.jsp">
                    <a href="DatosUsuario.jsp" class="d-flex px-3 fs-3 text-decoration-none">
                        <i class="fa-solid fa-user-ninja mx-2"></i>  
                        <label class=" fs-5">
                            <%= sesion.getAttribute("user")%>
                        </label>
                    </a>

                    <button class="btn btn-danger ml-3" type="submit">Cerrar sesión</button>
                </form>
            </div>
        </nav>
        <div class="container mt-5 mx-auto w-75">
            <div class="row mb-2 mx-auto">
                <!-- Button trigger modal -->
                <a href="crear.jsp" type="button" class="btn btn-primary w-100">
                    Agregar usuario
                </a>

            </div>
            <div class="row">
                <div class="col-sm">
                    <form action="index.jsp">

                        <table class="table table-hover table-sm">
                            <thead>
                                <tr class="text-center bg-primary text-light my-auto">
                                    <th scope="col"  >
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </th>
                                    <th scope="col">
                                        <input type="text" n
                                               name="nombre" 
                                               class="form-control"
                                               placeholder="Nombre"
                                               autocomplete="off">
                                    </th>
                                    <th>
                                        <input type="submit" value="Buscar" class="btn btn-light" name="buscar">
                                    </th>
                                    <th></th>
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
                                <jsp:include page="Empleados"/>
                            </tbody>
                        </table>
                    </form>   
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
