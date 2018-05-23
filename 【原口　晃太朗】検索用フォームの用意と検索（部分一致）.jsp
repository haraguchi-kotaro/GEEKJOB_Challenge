<%-- 
    Document   : dbSearch
    Created on : 2018/05/23, 10:30:50
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB検索フォーム</title>
    </head>
    <body>
        <h1>DB検索フォーム</h1>
        <form action ="./dbsearchAndDisplay.jsp" method ="post">
            <p>名前:<input type = "text" name = "txtName"></p>
            <input type = "submit" name ="bntSubmit" value ="検索">
        </form>
        
        
        
        
    </body>
</html>
