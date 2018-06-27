<%-- 
    Document   : inputfieldandpackaging
    Created on : 2018/06/27, 10:47:33
    Author     : ko-taro
--%>
<%
HttpSession hs = request.getSession();

boolean reinput = false;
    if(session.getAttribute("sename") != null && session.getAttribute("sesex") != null && session.getAttribute("sehobby") != null){
        reinput = true;
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>入力フィールドと実装</title>
    </head>
    <body>
        <h1>入力フィールドと実装</h1>
        <form action="InputFieldAndPackaging" method="POST">
            名前:
            <input type="text" name="txtname" value="<% if(reinput){out.print(session.getAttribute("sename"));}%>">
            <br><br>
            性別:
            <br>
            <input type="radio" name="txtsex" value="1"<%if(reinput && session.getAttribute("sesex").equals("1")){out.print("checked = \"checked\"");}%>>男
                <input type="radio" name="txtsex" value="2"<%if(reinput && session.getAttribute("sesex").equals("2")){out.print("checked = \"checked\"");}%>>女<br>
            <br>
            趣味:
            <input type="text" name="txthobby" value="<% if(reinput){out.print(session.getAttribute("sehobby"));}%>">
            <br><br>
            <input type="submit" name="btnSubmit" value="送信">
        </form>
    </body>
</html>
