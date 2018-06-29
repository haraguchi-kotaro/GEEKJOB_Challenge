/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.util.ArrayList;

/**
 *
 * @author ko-taro
 */
public class JumsHelper {
    
    //トップへのリンクを定数として設定
    private final String homeURL = "top.jsp";
    
    // インスタンスオブジェクトを返却させてコードの簡略化
    public static JumsHelper getInstance(){
        return new JumsHelper();
    }
    public String menu(boolean isLogin, String userName, String returnPage) {
        
        String top     = "<a href=\"top.jsp\" style=\"text-decoration:none;\">[トップ] </a>";
        String login   = "<a href=\"login.jsp?returnPage=" + returnPage + "\" style=\"text-decoration:none;\">[ログイン] </a>";
        String logout  = "<a href=\"Login?logout=yes\" style=\"text-decoration:none;\">[ログアウト] </a>";
        String cart    = "<a href=\"Cart\" style=\"text-decoration:none;\">[買い物かご] </a>";
        String welcome = "ようこそ！<a href=\"Mydata\" style=\"text-decoration:none;\">" + userName + "</a>さん";
        
        if(isLogin) { return welcome + "<br>" + top + logout + cart + "<br><br>"; }
        else { return top + login + "<br><br>"; } 
    }
    
    /**
     * 新規ユーザー登録時の入力されたデータに未入力がある場合、どの項目かをHTML文で返却
     * @param checkList UserDataで生成されるリスト。未入力項目の名前が格納されている。
     * @return 未入力の項目に対応する文字列
    */
    public String checkInput(ArrayList<String> checkList) {
        
        String outPut = "";
        for(String value : checkList) {
            if(value.equals("name")) { outPut += "ユーザー名"; }
            if(value.equals("password")) { outPut += "パスワード"; }
            if(value.equals("mail")) { outPut += "メールアドレス"; }
            if(value.equals("adress")) { outPut += "住所"; }
            outPut += "が未記入です。<br>";
        }
        return outPut;
    }
    
    //トップへのリンクを返却
    public String home(){
        return "<a href=\""+homeURL+"\">トップへ戻る</a>";
    }
    
    
    
}
