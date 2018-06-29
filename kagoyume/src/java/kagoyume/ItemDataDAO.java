/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import base.DBmanager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;


/**
 *
 * @author ko-taro
 */
public class ItemDataDAO {
    // インスタンスオブジェクトを返却させてコードの簡略化
    public static ItemDataDAO getInstance(){ return new ItemDataDAO(); }
    
    /**
     * 購入した商品1つごとに購入管理テーブル(DB)に挿入する
     * @param itemDTO ユーザーID・商品コード・発送方法・購入日時が格納
     * @throws SQLException 
     */
    public void itemRegistration(ItemDataDTO itemDTO) throws SQLException {
        
        // DBに接続
        Connection conn = DBmanager.getConnection();

        try {
            // SQL文の準備
            PreparedStatement pstmt = 
                    conn.prepareStatement("INSERT INTO buy_t(userID, itemCode, type, buyDate) VALUES(?, ?, ?, ?)");
            // SQL文中の「?」に使用する値を設定
            pstmt.setInt(1, itemDTO.getUserID());
            pstmt.setString(2, itemDTO.getItemCode());
            pstmt.setInt(3, itemDTO.getType());
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            // SQL文を実行
            pstmt.executeUpdate();
            
        } catch(SQLException e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            // データベース切断
            if(conn != null) { conn.close(); }
        }
    }
}


