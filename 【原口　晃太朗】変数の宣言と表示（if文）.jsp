<%-- 
    Document   : declare a variable and display if string
    Created on : 2018/04/16, 17:57:42
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int point=1;
if (point==1){out.print("1です！");
}
else if(point==2){out.print("プログラミングキャンプ！");
}
else{out.print("その他です！");
}

%>
