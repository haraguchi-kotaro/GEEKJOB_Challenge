/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jums;

import java.io.Serializable;
/**タスク3. フォームから受け取ったデータ自体を格納できるJavaBeans(UserDataBeans.java)を作成
 *insert.jspで入力された値を持ちまわるためのJavaBeansである。
 * @author ko-taro
 */
public class UserDataBeans implements Serializable{
    private String name;
    private String year;
    private String month;
    private String day;
    private String type;
    private String tell;
    private String comment;
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getYear(){
        return year;
    }
    
    public void setYear(String year){
        this.year = year;
    }
    
    public String getMonth(){
        return month;
    }
    
    public void setMonth(String month){
        this.month = month;
    }
    
    public String getDay(){
        return day;
    }
    
    public void setDay(String day){
        this.day = day;
    }
    
    public String getType(){
        return type;
    }
    
    public void setType(String type){
        this.type = type;
    }
    
    public String getTell(){
        return tell;
    }
    
    public void setTell(String tell){
        this.tell = tell;
    }
    
    public String getComment(){
        return comment;
    }
    
    public void setComment(String comment){
        this.comment = comment;
    }
    
    public String nameCheck(String name){
        if(!name.equals("")){
            return "nameOK";
        }else{
            return "noname";
        }
    }
    
    public String BirthdayCheck(String year, String month, String day){
        if(year.equals("") || month.equals("") || day.equals("")){
            return "nobirthday";
        }else{
            return "birthdayOK";
        }
    }
    
    public String TypeCheck(String type){
        if(type != null){
            return "typeOK";
        }else{
            return "notype";
        }
    }
    
    public String TellCheck(String tell){
        if(!tell.equals("")){
            return "tellOK";
        }else{
            return "notell";
        }
    }
    
    public String CommentCheck(String comment){
        if(!comment.equals("")){
            return "commentOK";
        }else{
            return "nocomment";
        }
    }
    
}
