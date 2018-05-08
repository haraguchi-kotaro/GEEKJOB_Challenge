<%-- 
    Document   : TheNumberOfBytesAndLetters
    Created on : 2018/05/08, 14:02:39
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String name = "原口　晃太朗";
out.print(name.length()+"<br>");
out.print(name.getBytes().length);












%>