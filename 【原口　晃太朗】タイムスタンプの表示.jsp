<%-- 
    Document   : TimestampDisplay
    Created on : 2018/05/08, 10:54:56
    Author     : ko-taro
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
SimpleDateFormat kadai = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

Date dataKadai = kadai.parse("2016-11-04 10:0:0");
out.print(dataKadai.getTime()+"<br>");

SimpleDateFormat kadai2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String stringKadai = kadai2.format(dataKadai);
out.print(stringKadai);








%>