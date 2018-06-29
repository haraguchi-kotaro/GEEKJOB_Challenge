<%-- 
    Document   : item
    Created on : 2018/06/19, 14:43:09
    Author     : ko-taro
--%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
<%@page import="kagoyume.ItemDataBeans"%>
<%
JumsHelper jh = JumsHelper.getInstance();
HttpSession hs = request.getSession();
// searchResultDetail:商品の詳細情報を格納(商品コード・商品名・画像URL・価格・商品説明・評価点・レビュー件数)
ItemDataBeans itemDetail = (ItemDataBeans) hs.getAttribute("serchResultDetail");

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
        <title>詳細ページ</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") %>
        <h1>詳細</h1>
    <h2><%= itemDetail.getNameDetail() %></h2>
    <img src="<%= itemDetail.getImageDetail() %>"><br>
    <b><font color="red"><%= itemDetail.getPriceDetail() %>円</font>（税込）</b><br><br>
    <%= itemDetail.getDescription() %><br><br>
    評価点：<%= itemDetail.getRate() %>pt<br>
    レビュー件数：<%= itemDetail.getCount() %>件<br><br>
    <form action="Add" method="POST">
        <input type="submit" value="カートに追加">
    </form>
    <form action="serch.jsp">
        <input type="submit" value="検索結果に戻る">
    </form>
    <%=jh.home()%>
    </body>
</html>
