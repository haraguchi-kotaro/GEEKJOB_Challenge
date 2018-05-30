<%-- 
    Document   : mainmenu
    Created on : 2018/05/28, 13:33:32
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在庫管理システム</title>
    </head>
    <body>
        <h1>在庫管理システムメインメニュー</h1>
        <form>
            <p><input type = "button" onClick ="location.href='./registrationForm.jsp'" value = "在庫登録"></p>
            <p><input type = "button" onClick ="location.href='./allDisplay.jsp'" value = "在庫一覧"></p>
            <p><input type = "button" onClick ="location.href='./logout.jsp'" value = "ログアウト"></p>
        </form>
    </body>
</html>
