<%-- 
    Document   : TimestampDisplay2
    Created on : 2018/05/08, 13:18:59
    Author     : ko-taro
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
SimpleDateFormat kadai = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date dataKadai = kadai.parse("2015-01-01 00:00:00");


SimpleDateFormat kadai2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date dataKadai2 = kadai2.parse("2015-12-31 23:59:59");

out.print(dataKadai2.getTime()-dataKadai.getTime());


%>