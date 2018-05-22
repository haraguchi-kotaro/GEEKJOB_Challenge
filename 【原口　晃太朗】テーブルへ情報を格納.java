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
    public static void main(String[] args){
        Connection db_con = null;
        PreparedStatement db_st = null;
        
        
    
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
            
            db_st = db_con.prepareStatement("insert into profiles (profilesID, name, tel, age, birthday) values(?,?,?,?,?);");
            db_st.setInt(1,6);
            db_st.setInt(4,24);
            db_st.setString(2,"辻 東倫");
            db_st.setString(3,"021-334-114");
            db_st.setString(5,"1995-06-01");
            
            int result = db_st.executeUpdate();
            System.out.print(result);
            
            db_st.close();
            db_con.close();
            System.out.print("情報格納成功。終了します");
            
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
