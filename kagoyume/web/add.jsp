<%-- 
    Document   : add
    Created on : 2018/06/20, 14:58:18
    Author     : ko-taro
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
<%
JumsHelper jh = JumsHelper.getInstance();

HttpSession hs = request.getSession();
// loginCheck:ログイン中の場合は"OK"の文字列を格納　[Login.java]で登録
String loginCheck = (String) session.getAttribute("loginCheck");
String userName = "";
boolean isLogin = false;
if(loginCheck != null && loginCheck.equals("OK")) {
    // loginUser:ログイン中のユーザー情報(ユーザーID・ユーザー名・パスワード・メールアドレス・住所・総購入金額・登録日時・削除フラグ)　[Login.java]で登録
    UserDataDTO userDTO = (UserDataDTO) hs.getAttribute("loginUser");
    userName = userDTO.getName();
    isLogin = true;
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>買い物籠追加ページ</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") %>
    <p>カートに追加しました</p>
    <form action="serch.jsp">
        <input type="submit" value="検索結果に戻る">
    </form>
    <br>
    <form action="Cart">
        <input type="submit" value="カートの中身を見る">
    </form>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
