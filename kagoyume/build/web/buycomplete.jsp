<%-- 
    Document   : buycomplete
    Created on : 2018/06/19, 14:54:14
    Author     : ko-taro
--%>

<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
<%
JumsHelper jh = JumsHelper.getInstance();

HttpSession hs = request.getSession();
// loginCheck:ログイン中の場合は"OK"の文字列を格納
String loginCheck = (String) session.getAttribute("loginCheck");
String userName = "";
boolean isLogin = false;
if(loginCheck != null && loginCheck.equals("OK")) {
    // loginUser:ログイン中のユーザー情報(ユーザーID・ユーザー名・パスワード・メールアドレス・住所・総購入金額・登録日時・削除フラグ)
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
        <title>購入完了</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") %>
        <h1>購入完了しました</h1><br><br>
        
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
