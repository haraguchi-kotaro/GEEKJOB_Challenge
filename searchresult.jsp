<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    ArrayList<UserDataDTO> ud1 = (ArrayList<UserDataDTO>) request.getAttribute("resultData");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS検索結果画面</title>
    </head>
    <body>
        <h1>検索結果</h1>
        <table border=1>
            <tr>
                <th>名前</th>
                <th>生年</th>
                <th>種別</th>
                <th>登録日時</th>
            </tr>
            <% for(UserDataDTO ud:ud1){%>
            <tr>
                <td><a href="ResultDetail?id=<%= ud.getUserID()%>"><%= ud.getName()%></a></td>
                <td><%= new SimpleDateFormat("yyyy").format(ud.getBirthday())%></td>
                <td><%= jh.exTypenum(ud.getType()) %></td>
                <td><%= ud.getNewDate()%></td>
            </tr>
            <% } %><br>
        </table>
    </body>
    <%=jh.home()%>
</html>
