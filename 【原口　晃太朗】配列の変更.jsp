<%-- 
    Document   : change of array
    Created on : 2018/04/17, 16:01:29
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String [] data1 = {"10","100","soeda","hayashi","-20","118","END"};
    data1[2]="33";
    out.println(data1[0]);
    out.println(data1[1]);
    out.println(data1[2]);
    out.println(data1[3]);
    out.println(data1[4]);
    out.println(data1[5]);
    out.println(data1[6]);
    

%>
