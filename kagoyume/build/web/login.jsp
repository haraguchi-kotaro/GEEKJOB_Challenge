<%-- 
    Document   : login
    Created on : 2018/06/20, 10:39:01
    Author     : ko-taro
--%>
<%@page import="kagoyume.JumsHelper"%>
<%
JumsHelper jh = JumsHelper.getInstance();

// loginFailure:ログイン失敗時、"failure"の文字列が格納されている　
String loginFailure = (String) request.getAttribute("loginFailure");
// PleaseLogin:ログインせずに買い物カゴの中身を見ようとした時、"PleaseLogin"が格納されている
String PleaseLogin = (String) request.getAttribute("PleaseLogin");
// ログイン画面に移動する前のページ名が格納されている。
String returnPage = request.getParameter("returnPage");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ログイン</title>
    </head>
    <body>
        <h1>ログイン</h1>
        <%
        if(loginFailure != null && loginFailure.equals("failure")) {
            out.println("<p>ログインに失敗しました。</p>");
        }
        // ログインせずに買い物かごを見ようとした場合。ログイン成功後は買い物かごページに戻る
        if(PleaseLogin != null && PleaseLogin.equals("PleaseLogin")) {
           out.println("<p>ログインしてください。</p>");
           returnPage = "/cart.jsp";
        }
        %>
        <form action="Login?returnPage=<%= returnPage %>" method="POST">
            ユーザー名：<input type="text" name="name" ><br>
            パスワード：<input type="password" name="password" ><br>
            <br>
            <input type="submit" value="ログイン">
        </form>
        <br>
        <a href="Registration">新規登録</a><br>
        <%=jh.home()%>
        
    </body>
</html>
