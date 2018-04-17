<%-- 
    Document   : switch2
    Created on : 2018/04/17, 14:23:26
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
char voc = 'k';
switch(voc){
    case 'A':
        out.print("英語");
        break;
    case 'あ':    
        out.print("日本語");
        break;
}
%>
