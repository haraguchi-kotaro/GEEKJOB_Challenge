<%-- 
    Document   : registration
    Created on : 2018/05/28, 13:56:52
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在庫登録フォーム</title>
    </head>
    <body>
        <h1>在庫登録フォーム</h1>
        <form action ="./registrationProcess.jsp" method ="post">
            <p>在庫ID:<input type = "text" name = "txtID"></p>
            <p>名前:<input type = "text" name = "txtName"></p>
            <p>価格:<input type = "text" name = "txtPrice"></p>
            <p>在庫数:<input type = "text" name = "txtStock"></p>
            <p>コード:<input type = "text" name = "txtCode"></p>
            <p>到着日:<input type = "text" name = "txtArrive"></p>
            <input type = "submit" name ="bntSubmit">
        </form>
    </body>
</html>
