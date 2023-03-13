/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.angel.javaweb.UConexion;
import java.sql.*;

/**
 *
 * @author whoangel
 */
@WebServlet(name = "Empleados", urlPatterns = {"/Empleados"})
public class Empleados extends HttpServlet {

    Connection conn = UConexion.getConnection();
    Statement st = null;
    ResultSet rs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        try ( PrintWriter out = response.getWriter()) {
            st = conn.createStatement();
            String query = "SELECT * FROM empleados ";
            String where = " where 1=1 ";
            String nombre = request.getParameter("nombre");
            if(nombre!=null || nombre==""){
                where = where + " and nombre='"+ nombre +"';";
            }
            query = query + where;
            rs = st.executeQuery(query);
            while (rs.next()) {
                try {
                    out.print("<tr>"
                            + "<th scope = \"row\" >" + rs.getString(1) + " </th> "
                            + "<td>" + rs.getString(2) + " </td>"
                            + "<td>" + rs.getString(3) + "</td>"
                            + "<td>" + rs.getString(4) + " </td>"
                            + "<td>"
                            + "<div class=\"d-flex justify-content-around\">"
                            + "<a href=\"Editar.jsp?id=" + rs.getString(1) + "\" class=\"btn btn-primary\">"
                            + "<i class=\" fa-solid fa-user-pen\"></i>"
                            + "</a>"
                            + "<a href=\"Borrar.jsp?id=" + rs.getString(1) + "\" type=\"button\" class=\"btn btn-danger\">"
                            + "<i class=\" fa-solid fa-user-minus\"></i>"
                            + "</a>"
                            + "</div>"
                            + "</td>"
                            + "</tr>");
                } catch (Exception e) {
                    out.print("error:" + e.getMessage());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
