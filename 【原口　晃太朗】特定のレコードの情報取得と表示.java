/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dbcontrol;

import java.sql.*;

/**
 *
 * @author ko-taro
 */
public class Connect {
    public static void main (String[] args){
        Connection db_con = null;
        PreparedStatement db_st = null;
        ResultSet db_data = null;
        
    
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
            
            db_st = db_con.prepareStatement("select * from profiles where profilesID = 1;");
            
            db_data = db_st.executeQuery();
            while (db_data.next()){
                int profilesID = db_data.getInt("profilesID");
                String name = db_data.getString("name");
                String tel = db_data.getString("tel");
                int age = db_data.getInt("age");
                String birthday = db_data.getString("birthday");
                
                System.out.print(profilesID +" " +name +" "+ tel +" "+ age +" "+ birthday + "<br>");
                
            }    
            db_data.close();
            db_st.close();
            db_con.close();
            System.out.print("処理成功。終了します");
            
        }catch(SQLException e_sql){
            System.out.println("接続時にエラーが発生しました："+e_sql.toString());
        }catch(Exception e){
            System.out.println("接続時にエラーが発生しました："+e.toString());
        }finally {
            if(db_con != null){
                try{
                    db_con.close();
                } catch (Exception e_con){
                    System.out.println(e_con.getMessage());
                }
            }
        }
    }
}
