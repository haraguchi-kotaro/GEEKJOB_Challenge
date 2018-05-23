<%-- 
    Document   : deleteCreate
    Created on : 2018/05/23, 17:13:07
    Author     : ko-taro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.* "%>
<%
request.setCharacterEncoding("UTF-8");
String tn = request.getParameter("txtNumber");

Connection db_con = null;
PreparedStatement db_st = null;
ResultSet db_data = null;
try
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
            
            db_st = db_con.prepareStatement("delete from profiles where profilesID ="+tn);
            int rrr = db_st.executeUpdate();
            
            if(rrr !=0){
                out.print("削除しました"+"<br>");
            }else if(rrr == 0){
                out.print("存在しないレコードです"+"<br>");
            }
            
            db_st = db_con.prepareStatement("select * from profiles;");
            db_data = db_st.executeQuery();
            out.print("現在のレコード"+"<br>");
            
            while (db_data.next()){
                int profilesID = db_data.getInt("profilesID");
                String name = db_data.getString("name");
                String tel = db_data.getString("tel");
                int age = db_data.getInt("age");
                String birthday = db_data.getString("birthday");
                
                    out.print(profilesID +" " +name +" "+ tel +" "+ age +" "+ birthday + "<br>");
            }
            
            
            db_data.close();
            db_st.close();
            db_con.close();
            out.print("終了します");
            
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
