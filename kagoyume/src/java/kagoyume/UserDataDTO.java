/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 *新規登録時のユーザー情報を持つクラス
 * @author ko-taro
 */
public class UserDataDTO implements Serializable{
    private int userID;         // ユーザーID
    private String name;        // ユーザー名
    private String password;    // パスワード
    private String mail;        // メールアドレス
    private String address;     // 住所
    private int total;          // 総購入金額
    private Timestamp newDate;  // 登録日時
    private int deleteFlg;      // 削除フラグ
    
    public UserDataDTO() {}
    
    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getMail() { return mail; }
    public void setMail(String mail) { this.mail = mail; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public int getTotal() { return total; }
    public void setTotal(int total) { this.total = total; }
    
    public Timestamp getNewDate() { return newDate; }
    public void setNewDate(Timestamp newDate) { this.newDate = newDate; }
    
    public int getDeleteFlg() { return deleteFlg; }
    public void setDeleteFlg(int deleteFlg) { this.deleteFlg = deleteFlg; }
    
}


