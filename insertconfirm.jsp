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
        <title>JUMS登録確認画面</title>
    </head>
    <body>
    <% if(!beans.getName().isEmpty() && !beans.getYear().isEmpty() && !beans.getMonth().isEmpty() && !beans.getDay().isEmpty() && !beans.getType().isEmpty() && !beans.getTell().isEmpty() && !beans.getComment().isEmpty()){ %>
        <h1>登録確認</h1>
        名前:<%= beans.getName() %><br>
        生年月日:<%= beans.getYear() +"年"+beans.getMonth() +"月"+beans.getDay() +"日" %><br>
        種別:<%= beans.getType() %><br>
        電話番号:<%= beans.getTell() %><br>
        自己紹介:<%= beans.getComment() %><br>
        上記の内容で登録します。よろしいですか？
        <form action="insertresult" method="POST">
            <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
            <input type="submit" name="yes" value="はい">
        </form>
    <!--タスク4. フォームの各項目の未入力チェック。どの項目が空かを表示し、入力フォームへのリンクを表示-->
    <% }else if (beans.getName().isEmpty()){ %>
        <h1>名前が入力されていません</h1>
    <% }else if (beans.getYear().isEmpty() || beans.getMonth().isEmpty() || beans.getDay().isEmpty()){ %>
        <h1>生年月日が登録されていません</h1>
    <% }else if (beans.getType().isEmpty()){ %>
        <h1>種別が入力されていません</h1>
    <% }else if (beans.getTell().isEmpty()){ %>
        <h1>電話番号が入力されていません</h1>
    <% }else if (beans.getComment().isEmpty()){ %>
        <h1>自己紹介が入力されていません</h1>
    <% } %>
        <form action="insert" method="POST">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
            <br>
            <%=JumsHelper.getInstance().home()%><!--タスク1. トップへのリンクが表示されるよう修正-->
    </body>
</html>
