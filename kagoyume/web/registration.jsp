<%-- 
    Document   : registration
    Created on : 2018/06/19, 14:49:58
    Author     : ko-taro
--%>

<%@page import="kagoyume.UserDataBeans"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
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
    UserDataBeans userBeans = null;
    boolean reInput = false;
    // 再入力 or 新規入力を判定
    if(request.getParameter("mode") != null && request.getParameter("mode").equals("reInput")) {
        reInput = true;
        // registrationInfo:ユーザー新規登録時に入力した情報(ユーザー名・パスワード・メールアドレス・住所)
        userBeans = (UserDataBeans) hs.getAttribute("registrationInfo");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新規登録</title>
    </head>
    <body>
        <h1>新規登録</h1><br><br>
        <form action="RegistrationConfirm" method="POST">
        ユーザー名：<input type ="text" name="name" value="<% if(reInput) { out.print(userBeans.getName()); } %>" ><br>
        パスワード：<input type="password" name="password" value="<% if(reInput) { out.print(userBeans.getPassword()); } %>"><br>
        メールアドレス：<input type="text" name="mail" value="<% if(reInput) { out.print(userBeans.getMail()); } %>" ><br>
        住所：<input type="text" name="adress" value="<% if(reInput) { out.print(userBeans.getAdress()); } %>" ><br>
        <br>
        <input type="submit" value="確認画面へ">
    </form>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
