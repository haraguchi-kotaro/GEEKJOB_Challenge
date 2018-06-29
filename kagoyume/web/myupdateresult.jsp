<%-- 
    Document   : myupdateresult
    Created on : 2018/06/19, 14:56:04
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
// registrationInfoResult:ユーザー情報更新時に入力した情報(ユーザー名・パスワード・メールアドレス・住所)
    UserDataDTO userUpdateDTO = (UserDataDTO) session.getAttribute("loginUser");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会員情報更新完了ページ</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/mydata.jsp") %>
        <h1>会員情報更新完了</h1>
        ユーザー名：<%= userUpdateDTO.getName() %><br>
    パスワード：<%= userUpdateDTO.getPassword() %><br>
    メールアドレス：<%= userUpdateDTO.getMail() %><br>
    住所：<%= userUpdateDTO.getAddress() %><br>
    <br>
    以上の内容で登録しました。<br>
        
    </body>
</html>
