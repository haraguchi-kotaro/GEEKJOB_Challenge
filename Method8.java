/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.myprofile;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ko-taro
 */
public class Method8 extends HttpServlet {

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
            String [] array1 =userProfile(1);
            String [] array2 =userProfile(2);
            String [] array3 =userProfile(3);

            for(String str : array1){
                if(str == array1[0]){
                    continue;
                }
                out.print(str);
            }
            out.print("<br>");
            for(String str : array2){
                if(str == array2[0]){
                    continue;
                }
                out.print(str);
            }
            out.print("<br>");
            for(String str : array3){
                if(str == array3[0]){
                    continue;
                }
                out.print(str);
            }
        }
        
    }
        String [] userProfile (int num){
            
            String [] value1 = {"1","技育太郎","東京",null,"プログラマー"};
            String [] value2 = {"2","技育花子",null,"女","システムエンジニア"};
            String [] value3 = {"3","技育三郎","大阪","男",null};
            
            if(num == Integer.parseInt(value1[0])){
                return value1;
            }else if (num == Integer.parseInt(value2[0])){
                return value2;
            }else if (num == Integer.parseInt(value3[0])){
                return value3;
            }
            return null;
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
