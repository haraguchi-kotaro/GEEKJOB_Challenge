<%-- 
    Document   : registrationcomplete
    Created on : 2018/06/19, 14:51:37
    Author     : ko-taro
--%>
<%@page import="kagoyume.JumsHelper"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession hs = request.getSession();

// loginUser:ログイン中のユーザー情報(ユーザーID・ユーザー名・パスワード・メールアドレス・住所・総購入金額・登録日時・削除フラグ)
UserDataDTO userDTO = (UserDataDTO) hs.getAttribute("loginUser");
    
// registrationInfoResult:ユーザー新規登録時に入力した情報(ユーザー名・パスワード・メールアドレス・住所)
UserDataDTO userResultDTO = (UserDataDTO) request.getAttribute("registrationInfoResult");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新規登録完了画面</title>
    </head>
    <body>
        <h1>新規登録完了</h1>
        ユーザー名：<%= userResultDTO.getName() %><br>
    パスワード：<%= userResultDTO.getPassword() %><br>
    メールアドレス：<%= userResultDTO.getMail() %><br>
    住所：<%= userResultDTO.getAddress() %><br>
    <br>
    以上の内容で登録しました。<br>
    <%=JumsHelper.getInstance().home()%>
    </body>
</html>
