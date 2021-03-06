/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

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
public class MyUpdateResult extends HttpServlet {

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
        // セッション開始
        HttpSession session = request.getSession();
        try {
            // リクエストパラメータの文字コードをUTF-8に変更
            request.setCharacterEncoding("UTF-8");
            // 更新情報をJavaBeansに格納
            UserDataBeans userBeans = new UserDataBeans();
            userBeans.setName(request.getParameter("name"));
            userBeans.setPassword(request.getParameter("password"));
            userBeans.setMail(request.getParameter("mail"));
            userBeans.setAdress(request.getParameter("address"));            
            // JavaBeansをDB専用のパラメータに変換
            UserDataDTO userDTO = new UserDataDTO();
            userBeans.UD2DTOMapping(userDTO);
            userDTO.setUserID(Integer.parseInt(request.getParameter("id")));
            // DBに接続し、会員情報更新を実行
            UserDataDAO .getInstance().userUpdate(userDTO);
            // 更新結果をセッション登録
            session.setAttribute("loginUser", userDTO);
            
            // フォワード
            request.getRequestDispatcher("/myupdateresult.jsp").forward(request, response);
        }catch(Exception e) {
            // 例外発生時、エラー画面にフォワード
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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
