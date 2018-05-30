<%-- 
    Document   : registrationProcess
    Created on : 2018/05/30, 14:25:41
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.* "%>
<%
request.setCharacterEncoding("UTF-8");
String tid = request.getParameter("txtID");
String tn = request.getParameter("txtName");
String tp = request.getParameter("txtPrice");
String ts = request.getParameter("txtStock");
String tc = request.getParameter("txtCode");
String ta = request.getParameter("txtArrive");


Connection db_con = null;
PreparedStatement db_st = null;

try
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Stock_management_system?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
            
            db_st = db_con.prepareStatement("insert into stock values (" + tid + ",'" + tn + "'," + tp + "," + ts + ",'" + tc +"','"+ ta +"')");
            int rrr = db_st.executeUpdate();
            
            out.print(tid + tn + tp + ts + tc + ta+"<br>");
            if(rrr !=0){
                out.print("登録しました"+"<br>");
            }else if(rrr == 0){
                out.print("登録に失敗しました"+"<br>");
            }
                
            
            db_st.close();
            db_con.close();
            out.print("終了します"+"<br>");
            
        }catch(SQLException e_sql){
            out.println("接続時にエラーが発生しました："+e_sql.toString());
        }catch(Exception e){
            out.println("接続時にエラーが発生しました："+e.toString());
        }finally {
            if(db_con != null){
                try{
                    db_con.close();
                } catch (Exception e_con){
                    out.println(e_con.getMessage());
                }
            }
        }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1></h1>
        <a href="mainmenu.jsp">一覧へ戻る</a>
    </body>
</html>
