<%@page import="jums.UserDataBeans"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%
    HttpSession hs = request.getSession();
    UserDataBeans beans = (UserDataBeans)session.getAttribute("User");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録結果画面</title>
    </head>
    <body>
    <% if(!beans.getName().isEmpty() && !beans.getYear().isEmpty() && !beans.getMonth().isEmpty() && !beans.getDay().isEmpty() && !beans.getType().isEmpty() && !beans.getTell().isEmpty() && !beans.getComment().isEmpty()){ %>
        <h1>登録結果</h1><br>
        名前:<%= beans.getName() %><br>
        生年月日:<%= beans.getYear() +"年"+beans.getMonth() +"月"+beans.getDay() +"日" %><br>
        種別:<%= beans.getType() %><br>
        電話番号:<%= beans.getTell() %><br>
        自己紹介:<%= beans.getComment() %><br>
        以上の内容で登録しました。<br>
    <% }else{ %>
        <h1>入力が不完全です</h1>
    <% } %>
        <br>
        <%=JumsHelper.getInstance().home()%><!--タスク1. トップへのリンクが表示されるよう修正-->
    </body>
    <%//タスク7. セッションの破棄
        session.invalidate(); %>
</html>
