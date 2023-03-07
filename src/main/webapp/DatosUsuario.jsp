<%-- 
    Document   : DatosUsuario
    Created on : 6 mar 2023, 20:42:54
    Author     : whoangel
--%>

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
        %>
        <div class="container ">
            <div class="row align-items-center justify-content-center vh-100 ">
                <h3 class="text-center fixed-top mt-5">Editando información del usuario</h3>
                <form action="" 
                      class="mx-auto bg-light p-3 rounded"
                      style="width: 25%;">
                    <h2 class="text-center fs-2 mb-3"><i class="fa-solid fa-user"></i> <%= session.getAttribute("user")%></h2>
                    <div class="form-group">
                        <label for="">Nombre de usuario:</label>
                        <input name="user" 
                               class="form-control" 
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

        %>
    </body>
</html>
