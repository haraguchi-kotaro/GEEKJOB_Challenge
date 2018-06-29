<%-- 
    Document   : search
    Created on : 2018/06/19, 14:41:20
    Author     : ko-taro
--%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.ItemDataBeans"%>
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
// serchResult:商品の検索結果(検索キーワード・検索結果数・商品コード・商品名・画像URL・価格)
ItemDataBeans item = (ItemDataBeans) hs.getAttribute("serchResult");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>検索ページ</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") %>
        <h1>検索結果</h1>
    検索キーワード：<%= item.getQuery() %><br><br>
    検索結果数：件<br>
    <br>
    <table border="1">
        <%
            // 検索上位20件を表示
            for(int i = 0; i < item.getName().size(); i++) {
                out.println("<tr>");
                out.println("<td><img src=\"" + item.getImage().get(i) + "\"></td>");
                out.println("<td><b>");
                out.println("<a href=\"Item?itemcode=" + item.getCode().get(i) + "\">" + item.getName().get(i) + "</a><br>");
                out.println("<font color=\"red\">" + item.getPrice().get(i) + "円</font>");
                out.println("</b></td>");
                out.println("</tr>");
            }
        %>
    </table>
        <%=jh.home()%>
    </body>
</html>
