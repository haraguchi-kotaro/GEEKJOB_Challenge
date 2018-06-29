<%-- 
    Document   : cart
    Created on : 2018/06/19, 14:51:56
    Author     : ko-taro
--%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kagoyume.ItemDataBeans"%>

<%
HttpSession hs = request.getSession();
ArrayList<ItemDataBeans> cartItem = (ArrayList<ItemDataBeans>) hs.getAttribute("cartItem");

JumsHelper jh = JumsHelper.getInstance();

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
        <title>カート画面</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") %>
        <h1>お買い物かご</h1>
<%
        if(cartItem.size() != 0) {
            out.println("<table border=\"1\">");
            int totalMoney = 0;  // 買い物かご内の合計金額
            for(int i = 0; i < cartItem.size(); i++) { 
                totalMoney += Integer.parseInt(cartItem.get(i).getPriceDetail());
                out.println("<tr>");
                out.println("<td><img src=\"" + cartItem.get(i).getImageDetail() + "\"></td>");
                out.println("<td>");
                out.println("<b><a href=\"Item?itemcode=" + cartItem.get(i).getCodeDetail() + "\">" + cartItem.get(i).getNameDetail() + "</a><br>");
                out.println(cartItem.get(i).getPriceDetail() + "円</b><br><br>");
                out.println("<a href=\"Cart?delete=" + i + "\">削除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("<p>");
            out.println("数量：" + cartItem.size() + "点<br>");
            out.println("金額：" + totalMoney + "円");
            out.println("</p>");
            out.println("<form action=\"Buyconfirm\"  method=\"POST\">");
            out.println("<input type=\"submit\" value=\"購入画面へ\">");
            out.println("</form>");
        } else { out.println("買い物カゴの中に商品はありません。"); }
%>
    </body>
</html>
