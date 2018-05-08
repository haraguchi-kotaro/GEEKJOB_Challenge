<%-- 
    Document   : Currenttime
    Created on : 2018/05/08, 10:31:33
    Author     : ko-taro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
Date d = new Date();

SimpleDateFormat kadai = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

String kadaiString = kadai.format(d);
out.print(kadaiString);





%>
