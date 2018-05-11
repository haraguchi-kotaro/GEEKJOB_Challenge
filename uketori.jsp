<%-- 
    Document   : uketori
    Created on : 2018/05/11, 15:23:13
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
out.print(request.getParameter("txtName"));
out.print(request.getParameter("rdoSample"));
out.print(request.getParameter("mulText"));




%>
