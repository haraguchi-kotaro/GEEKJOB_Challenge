<%-- 
    Document   : updateForm1
    Created on : 2018/05/24, 10:15:41
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB更新フォーム</title>
    </head>
    <body>
        <h1>DB更新フォーム</h1>
        <form action ="./updateForm2.jsp" method ="post">
            <p>プロフィール番号:<input type = "text" name = "txtNumber"></p>
            <p>名前:<input type = "text" name = "txtName"></p>
            <p>電話番号:<input type = "text" name = "txtTel"></p>
            <p>年齢:<input type = "text" name = "txtAge"></p>
            <p>生年月日(西暦-月-日):<input type = "text" name = "txtBirthday"></p>
            <input type = "submit" name ="bntSubmit">
        </form>
    </body>
</html>
