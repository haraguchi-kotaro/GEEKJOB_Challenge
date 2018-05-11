<%-- 
    Document   : input
    Created on : 2018/05/11, 14:42:21
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>入力フィールド</title>
    </head>
    <body>
        <form action =" ./uketori.jsp"method ="post">
            <p>お名前:<input type = "text" name = "txtName"></p>
            <p>性別:<input type = "radio" name = "rdoSample">男 <input type = "radio" name = "rdoSample">女</p>
            <p>趣味:<textarea name = "mulText"></textarea></p>
            <input type = "submit" name ="bntSubmit">
        </form>
    </body>
</html>
