/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.myprofile;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ko-taro
 */
public class argumentAndReturnValue2Resubmit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    ArrayList<String> regular(String id){
        ArrayList<String> sakamoto =new ArrayList<String>();
            sakamoto.addAll(Arrays.asList("坂本勇人","6","1988/12/14","兵庫"));
        ArrayList<String> okamoto = new ArrayList<String>();
            okamoto.addAll(Arrays.asList("岡本和真","25","1996/06/30","null"));
        ArrayList<String> kobayashi = new ArrayList<String>();
            kobayashi.addAll(Arrays.asList("小林誠司","22","1989/06/07","大坂"));
            
        switch (id){
            case "6":
                return sakamoto;
               
            case "25":
                return okamoto;
                
            case "22":
                return kobayashi;
                
        }
        return null;
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet argumentAndReturnValue2Resubmit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
            
            for(int i = 0; i<regular("6").size();i++){
                if (regular("6").contains("null")){
                    continue;
                }
                out.print(regular("6").get(i)+"<br>");
            }
            for(int i = 0; i<regular("25").size();i++){
                if (regular("25").contains("null")){
                    continue;
                }
                out.print(regular("25").get(i)+"<br>");
            }
            for(int i = 0; i<regular("22").size();i++){
                if (regular("22").contains("null")){
                    continue;
                }
                out.print(regular("22").get(i)+"<br>");
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
