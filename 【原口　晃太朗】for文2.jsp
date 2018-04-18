<%-- 
    Document   : for string2
    Created on : 2018/04/18, 13:44:05
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String seq = "A";
for(int i=1;i<30;i++){
seq+="A";
}
out.print(seq);



%>
