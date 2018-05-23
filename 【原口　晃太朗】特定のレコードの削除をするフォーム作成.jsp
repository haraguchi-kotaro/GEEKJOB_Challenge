<%-- 
    Document   : deleteForm
    Created on : 2018/05/23, 17:10:51
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB削除フォーム</title>
    </head>
    <body>
        <h1>DB削除フォーム</h1>
        <form action ="./deleteCreate.jsp" method ="post">
            <p>プロフィール番号:<input type = "text" name = "txtNumber"></p>
            <input type = "submit" name ="bntSubmit">
        </form>
    </body>
</html>
