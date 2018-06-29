<%-- 
    Document   : mydeleteresult
    Created on : 2018/06/19, 14:56:55
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
        <title>会員情報削除完了</title>
    </head>
    <body>
        <h1>会員情報削除完了</h1>
        削除しました。<br>
        <a href="Login?logout=yes" style="text-decoration:none;">トップへ戻る</a>
    </body>
</html>
