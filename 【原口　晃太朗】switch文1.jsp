<%-- 
    Document   : switch1
    Created on : 2018/04/17, 14:14:18
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  int num = 1;
  switch(num){
      case 1 :
      out.print("one");
      break;
      case 2 :
      out.print("two");
      break;
      default:
      out.print("想定外");
      break;
            
  }  

%>
