<%-- 
    Document   : TheNumberOfLetters
    Created on : 2018/05/08, 14:13:30
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String myAdress = "haraguchi.kmji@gmail.com";

String trimMyAdress = myAdress.substring(myAdress.indexOf("@"));
out.print(trimMyAdress.length());












%>
