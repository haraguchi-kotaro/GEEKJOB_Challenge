<%-- 
    Document   : error
    Created on : 2018/06/19, 17:28:31
    Author     : ko-taro
--%>

<%@page import="kagoyume.JumsHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>エラー</title>
    </head>
    <body>
        エラーが発生しました。以下の項目を確認して下さい。
        <%=request.getAttribute("error")%><br><br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
