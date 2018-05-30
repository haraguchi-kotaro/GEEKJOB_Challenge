/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package systemBack;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ko-taro
 */
public class LoginForm extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>在庫管理システムログインフォーム</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>在庫管理システムログインフォーム</h1>");
            
            
            HttpSession session = request.getSession(true);
            
            Object status = session.getAttribute("status");
            
            if(status != null){
                out.println("<p>認証に失敗しました</p>");
                out.println("<p>再度ユーザー名とパスワードを入力して下さい</p>");
            }
            
            session.setAttribute("status",null);
            
            out.println("<form action =\"./LoginCheck\" method =\"post\">");
            out.println("<table>");
            out.println("<tr>");
            out.println("<td>ID</td>");
            out.println("<td><input type = \"text\" name = \"txtID\"></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td>パスワード</td>");
            out.println("<td><input type = \"text\" name = \"txtPass\"></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td><input type = \"submit\" name =\"bntSubmit\" value = \"ログイン\"></td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</form>");

            out.println("</body>");
            out.println("</html>");
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
