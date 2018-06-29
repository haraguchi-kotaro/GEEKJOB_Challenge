<%-- 
    Document   : registrationconfirm
    Created on : 2018/06/19, 14:50:37
    Author     : ko-taro
--%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kagoyume.UserDataBeans"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession hs = request.getSession();

UserDataBeans userBeans = (UserDataBeans) hs.getAttribute("registrationInfo");
    
// ユーザー新規登録に未入力項目があるか確認
JumsHelper helper = JumsHelper.getInstance();
ArrayList<String> checkList = userBeans.chkproperties();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新規登録確認画面</title>
    </head>
    <body>
        <% if(checkList.size() == 0) { %>
        <h1>新規登録確認</h1>
        ユーザー名：<%= userBeans.getName() %><br>
        パスワード：<%= userBeans.getPassword() %><br>
        メールアドレス：<%= userBeans.getMail() %><br>
        住所：<%= userBeans.getAdress() %><br>
        <br>
        上記の内容で登録します。よろしいですか？<br>
        <br>
        <form action="RegistrationComplete" method="POST">
            <input type="submit" name="yes" value="登録">
        </form>
        
        <!--未入力あり-->
    <% } else {%>
        <!--未入力項目を表示-->
        <%= helper.checkInput(checkList) %>
    <% } %>
    <form action="registration.jsp" method="POST">
        <!-- 再入力であることを表す値、reInputを送信 -->
        <input type="hidden" name="mode" value="reInput">
        <input type="submit" name="no" value="戻る">
    </form>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
