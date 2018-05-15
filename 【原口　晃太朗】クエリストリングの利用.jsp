<%-- 
    Document   : useQueryString2
    Created on : 2018/05/15, 11:04:44
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>クエリストリングの利用</title>
    </head>
    <body>
        <h1>ポイント計算サイト</h1>
        <form action ="keisan.jsp"method ="get">
            <p>商品種別:<input type = "radio" name = "type" value = "1">雑貨 <input type = "radio" name = "type" value = "2">生鮮食品 <input type = "radio" name = "type" value = "3">その他</p>
            <p>数量:<input type = "text" name = "count"></p>
            <p>合計:<input type = "text" name = "total"></p>
            
            <input type = "submit" name ="bntSubmit">
            
        </form>
    </body>
</html>
