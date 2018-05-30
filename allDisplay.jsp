<%-- 
    Document   : allDisplay
    Created on : 2018/05/30, 13:56:05
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.* "%>
<%
request.setCharacterEncoding("UTF-8");

Connection db_con = null;
PreparedStatement db_st = null;
ResultSet db_data = null;
try
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Stock_management_system?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
            
            db_st = db_con.prepareStatement("select * from stock;");
            db_data = db_st.executeQuery();
            
            out.print("在庫ID 在庫名 価格 在庫数 商品コード 入荷日"+ "<br>");
                while (db_data.next()){
                    int dsstockID = db_data.getInt("stockID");
                    String dsstockName = db_data.getString("stockName");
                    int dsprice = db_data.getInt("price");
                    int dsstock = db_data.getInt("stock");
                    String dscode = db_data.getString("code");
                    String dsarrive = db_data.getString("arrive");
                    
                
                        out.print(dsstockID +" "+dsstockName +" "+ dsprice +" "+ dsstock +" "+ dscode + " "+dsarrive+ "<br>");
                }

            db_data.close();
            db_st.close();
            db_con.close();
            
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
        <h1</h1>
        
        <a href="mainmenu.jsp">一覧へ戻る</a>
    </body>
</html>