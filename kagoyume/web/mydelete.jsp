<%-- 
    Document   : mydelete
    Created on : 2018/06/19, 14:56:31
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
        <title>会員情報削除ページ</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/mydelete.jsp") %>
        <h1>会員情報削除</h1>
        ユーザーID：<%= userDTO.getUserID() %><br>
    ユーザー名：<%= userDTO.getName() %><br>
    パスワード：<%= userDTO.getPassword() %><br>
    メールアドレス：<%= userDTO.getMail() %><br>
    住所：<%= userDTO.getAddress() %><br>
    総購入金額：<%= userDTO.getTotal() %><br>
    登録日時：<%= userDTO.getNewDate() %><br>
    <br>
    上記のユーザーをマジで削除しますか？<br>
    <br>
    <form action="MyDeleteResult" method="POST">
        <input type="submit" name="yes" value="はい" style="width:80px">
    </form>
    <form action="./top.jsp" method="POST">
        <input type="submit" name="no" value="いいえ" style="width:80px">
    </form>
    </body>
</html>
