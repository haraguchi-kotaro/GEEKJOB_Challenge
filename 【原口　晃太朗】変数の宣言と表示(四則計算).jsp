<%-- 
    Document   : declare a variable and arithmetic
    Created on : 2018/04/16, 15:46:12
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
  int alpha = 336;
  final int age = 26;
  final double twntax = 1.04;
  int beta = 10600;
  out.println(alpha+beta);out.print(" ");
  out.println(age-alpha);
  out.println(beta*twntax);
  out.println(beta/alpha);
  out.println(alpha%twntax);
  
  
  



%>