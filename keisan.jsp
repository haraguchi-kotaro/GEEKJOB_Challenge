<%-- 
    Document   : keisan
    Created on : 2018/05/15, 11:16:05
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String pType = request.getParameter("type");
String pCount = request.getParameter("count");
String pTotal = request.getParameter("total");

int pTypeNum = Integer.parseInt(pType);
int pCountNum = Integer.parseInt(pCount);
int pTotalNum = Integer.parseInt(pTotal);



switch(pTypeNum){
    case 1:
        out.print("雑貨"+"<br>");
        break;
    case 2:
        out.print("生鮮食品"+"<br>");
        break;
    case 3:
        out.print("その他"+"<br>");
        break;
}

out.print("単価は"+ pTotalNum/pCountNum+ "円です。"+"<br>");

if(pTotalNum>=5000){
    out.print("ポイントは"+pTotalNum*0.05+"です。"+"<br>");
}else if(3000<=pTotalNum && pTotalNum<5000){
    out.print("ポイントは"+pTotalNum*0.04+"です。"+"<br>");
}else if(pTotalNum<=3000){
    out.print("ポイントは"+pTotalNum*0.0+"です。"+"<br>");
}








%>
