<%-- 
    Document   : for string1
    Created on : 2018/04/18, 13:16:18
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
long res= 8;
for(int i =1;i<20;i++){
res*=8;

}

out.print(res);


%>
