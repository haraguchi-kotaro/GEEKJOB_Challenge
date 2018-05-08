<%-- 
    Document   : Timestamp
    Created on : 2018/05/08, 10:28:03
    Author     : ko-taro
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
Calendar kadai = Calendar.getInstance();
kadai.set(2016,00,01,00,00,00);

out.print(kadai.getTime());



%>