<%-- 
    Document   : ReplaceOfLetter
    Created on : 2018/05/08, 14:37:45
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String kadai = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";

out.print(kadai.replace("I","い").replace("U","う"));





%>
