<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%@page import="jums.UserDataBeans"%>
<%
    HttpSession hs = request.getSession();
    UserDataBeans beans = (UserDataBeans)hs.getAttribute("User");
    //タスク5. 初期値かつフォームの値を保持する為の変数宣言。
    String strName = "";
    String strYear = "";
    String strMonth = "";
    String strDay = "";
    String strType = "";
    String strTell = "";
    String strComment = "";
    //各項目に保持していたフォームの値を代入
    if(beans != null){
        strName = beans.getName();
        strYear = beans.getYear();
        strMonth = beans.getMonth();
        strDay = beans.getDay();
        strType = beans.getType();
        strTell = beans.getTell();
        strComment = beans.getComment();
    }
    
    
    String type1 = "";
    String type2 = "";
    String type3 = "";

    //種別のボタン分岐
    if(strType != ""){
        int intType = Integer.parseInt(strType);
        switch(intType){
            case 1:
                type1 = "checked";
                break;
            case 2:
                type2 = "checked";
                break;
            case 3:
                type3 = "checked";
                break;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body>
    <form action="insertconfirm" method="POST">
        名前:
        <input type="text" name="name" value="<%=strName %>">
        <br><br>

        生年月日:
        <select name="year">
            <option value="">----</option>
            <%
            for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>"> <%=i%> </option>
            <% } if (beans != null){%><option value = "<%=strYear%>" selected> <%=strYear%> </option><%}%>
        </select>年
        <select name="month">
            <option value="">--</option>
            <%
            for(int i = 1; i<=12; i++){ %>
            <option value="<%=i%>"><%=i%></option>
            <% } if (beans != null){%><option value = "<%=strMonth%>" selected> <%=strMonth%> </option><%}%>
        </select>月
        <select name="day">
            <option value="">--</option>
            <%
            for(int i = 1; i<=31; i++){ %>
            <option value="<%=i%>"><%=i%></option>
            <% } if (beans != null){%><option value = "<%=strDay%>" selected> <%=strDay%> </option><%}%>
        </select>日
        <br><br>

        種別:
        <br>
        <input type="radio" name="type" value="1" <%=type1 %>> エンジニア <br>
        <input type="radio" name="type" value="2" <%=type2 %>> 営業 <br>
        <input type="radio" name="type" value="3" <%=type3 %>> その他 <br>
        <br>

        電話番号:
        <input type="text" name="tell" value="<%=strTell %>">
        <br><br>

        自己紹介文
        <br>
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard" value=><%=strComment %></textarea><br><br>
        <!--もしここでエラーでたら<textarea>strComment</textarea>とすること-->
        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <br>
        <%=JumsHelper.getInstance().home()%><!--タスク1. トップへのリンクが表示されるよう修正-->
    </body>
</html>
