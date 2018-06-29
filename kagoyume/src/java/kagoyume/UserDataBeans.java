/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *ユーザー情報を保持するJavaBeansクラス
 * 使うのは新規登録時
 * userdataからdtoにマッピングするメソッドあり
 * @author ko-taro
 */
public class UserDataBeans implements Serializable{
    private String name;
    private String password;
    private String mail;
    private String adress;
    
    public UserDataBeans(){
        this.name = "";
        this.password= "";
        this.mail="";
        this.adress="";
        
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        //空文字(未入力)の場合空文字をセット
        if(name.trim().length()==0){
            this.name = "";
        }else{
            this.name = name;
        }
    }
    
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        if(password.trim().length()==0){
            this.password = "";
        }else{
            this.password = password;
        }
    }

    
    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        if(mail.trim().length()==0){
            this.mail = "";
        }else{
            this.mail = mail;
        }
    }
    
    public String getAdress() {
        return adress;
    }
    public void setAdress(String adress) {
        if(adress.trim().length()==0){
            this.adress = "";
        }else{
            this.adress = adress;
        }
    }
    
    
    
    public ArrayList<String> chkproperties(){
        ArrayList<String> chkList = new ArrayList<String>();
        if(this.name.equals("")){
            chkList.add("name");
        }
        if(this.password.equals("")){
            chkList.add("password");
        }
        if(this.mail.equals("")){
            chkList.add("mail");
        }
        if(this.adress.equals("")){
            chkList.add("adress");
        }
        
        return chkList;
    }

    public void UD2DTOMapping(UserDataDTO udd){
        udd.setName(this.name);
        udd.setPassword(this.password);
        udd.setMail(this.mail);
        udd.setAddress(this.adress);
    }
}
