<%-- 
    Document   : loginresult
    Created on : 2018/06/22, 17:08:31
    Author     : ko-taro
--%>
<%@page import="kagoyume.JumsHelper"%>
<%
JumsHelper jh = JumsHelper.getInstance();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ログイン</title>
    </head>
    <body>
        <h1>ログインしました</h1>
        <%=jh.home()%>
    </body>
</html>
