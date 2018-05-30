/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package systemBack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ko-taro
 */
public class LoginCheck extends HttpServlet {

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
            response.setContentType("text/html; charset=Shift_JIS");
            
            //フォームから値受け取り
            request.setCharacterEncoding("UTF-8");
            String user = request.getParameter("txtID");
            String pass = request.getParameter("txtPass");
            
            HttpSession session = request.getSession(true);
            
            //ログインチェック・dbへアクセス
            Connection db_con = null;
            PreparedStatement db_st = null;
            ResultSet db_data = null;
            try
                    {
                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                        db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

                        db_st = db_con.prepareStatement("select userID from user where userID = '" + user + "';");
                        
                        db_data = db_st.executeQuery();
                        //ログインあってるか判定、あってなければフォーム送り
                        String strid = null;
                        while (db_data.next()){
                            strid = db_data.getString("userID");
                            if(strid.equals(user) ){
                                session.setAttribute( "login_user", user );
                                response.sendRedirect("./mainmenu.jsp");
                            }else{
                                session.setAttribute("status", "Not login");
                                response.sendRedirect("LoginForm");
                            }   
                        }
                        
                        db_data.close();
                        db_st.close();
                        db_con.close();
                        //ログイン失敗処理
                        session.setAttribute("status", "Not login");
                        response.sendRedirect("LoginForm");
                        
                    }catch(SQLException e_sql){
                        out.println("接続時にエラーが発生しました："+e_sql.toString());
                    }catch(Exception e){
                        out.println("接続時にエラーが発生しました："+e.toString());
                    }finally {
                        if(db_con != null){
                            try{
                                db_con.close();
                            } catch (Exception e_con){
                                out.println(e_con.getMessage());
                            }
                        }
                    }

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
