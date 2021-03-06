<%-- 
    Document   : myhistory
    Created on : 2018/06/19, 14:55:05
    Author     : ko-taro
--%>
<%@page import="kagoyume.ItemDataDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
<%
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
    // history:ログイン中のユーザーが過去に購入した商品情報(商品コード・発送方法・購入日時)　
    ArrayList<ItemDataDTO> history = (ArrayList<ItemDataDTO>) hs.getAttribute("history");


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>購入履歴画面</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/myhistory.jsp") %>
        <h1>購入履歴</h1>
        <table border="1">  
        <tr>
            <th>商品コード</th>
            <th>発送方法</th>
            <th>購入日時</th>
        </tr>
        <%
            for(int i = 0; i < history.size(); i++ ) {
            out.println("<tr>");
            out.println("<td>" + history.get(i).getItemCode() + "</td>");
            if(history.get(i).getType() == 1) { out.println("<td>ヤマト運輸</td>"); }
            if(history.get(i).getType() == 2) { out.println("<td>佐川急便</td>"); }
            if(history.get(i).getType() == 3) { out.println("<td>日本郵便</td>"); }
            out.println("<td>" + history.get(i).getBuyData() + "</td>");
            out.println("</tr>");
            }
        %>      
    </table>
    </body>
</html>
