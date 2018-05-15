<%-- 
    Document   : easyFactoring2
    Created on : 2018/05/15, 17:25:50
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String strNum = request.getParameter("num");
int intNum = Integer.parseInt(strNum);

out.print(intNum+"=");

while (intNum % 2 == 0) {
      out.print(2+"*");
      intNum/= 2;
    }

for (int i = 3; i * i <= intNum; i += 2) {
      while (intNum % i == 0) {
        out.print(i + "*");
        intNum/= i;
      }
    }
if (intNum> 1){
    out.print("あまり"+intNum);
}



%>
