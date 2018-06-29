<%-- 
    Document   : myupdate
    Created on : 2018/06/19, 14:55:34
    Author     : ko-taro
--%>
<%@page import="kagoyume.JumsHelper"%>
<%@page import="kagoyume.UserDataDTO"%>
<%
HttpSession hs = request.getSession();
// loginCheck:ログイン中の場合は"OK"の文字列を格納　
String loginCheck = (String) session.getAttribute("loginCheck");
String userName = "";
boolean isLogin = false;
// loginUser:ログイン中のユーザー情報(ユーザーID・ユーザー名・パスワード・メールアドレス・住所・総購入金額・登録日時・削除フラグ)
UserDataDTO userDTO = (UserDataDTO) hs.getAttribute("loginUser");
if(loginCheck != null && loginCheck.equals("OK")) {
    userName = userDTO.getName();
    isLogin = true;
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会員情報更新ページ</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/mydata.jsp") %>
        <h1>会員情報更新</h1>
        <form action="MyUpdateResult" method="POST">
    ユーザー名：<input type="text" name="name" placeholder="ユーザー名" value="<%= userDTO.getName() %>"><br>
    パスワード：<input type="text" name="password" placeholder="パスワード" value="<%= userDTO.getPassword() %>"><br>
    メールアドレス：<input type="text" name="mail" placeholder="メールアドレス" value="<%= userDTO.getMail() %>"><br>
    住所：<input type="text" name="address" placeholder="住所" value="<%= userDTO.getAddress() %>"><br><br>
    <input type="hidden" name="id" value="<%= userDTO.getUserID() %>">
    <input type="submit" value="更新">
    </form>
    </body>
</html>
