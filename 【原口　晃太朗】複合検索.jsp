<%-- 
    Document   : compositeSearchForm
    Created on : 2018/05/25, 16:22:42
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>複合検索フォーム</title>
    </head>
    <body>
        <h1>複合検索フォーム</h1>
        <form action ="./compositeSearchCreate.jsp" method ="post">
            <p>名前:<input type = "text" name = "txtName"></p>
            <p>年齢:<input type = "text" name = "txtAge"></p>
            <p>生年月日(西暦-月-日):<input type = "text" name = "txtBirthday"></p>
            <input type = "submit" name ="bntSubmit">
        </form>
    </body>
</html>
