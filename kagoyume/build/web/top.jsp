<%-- 
    Document   : top
    Created on : 2018/06/20, 10:59:19
    Author     : ko-taro
--%>
<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.JumsHelper"%>
<%
JumsHelper jh = JumsHelper.getInstance();

HttpSession hs = request.getSession();
// loginCheck:ログイン中の場合は"OK"の文字列を格納
String loginCheck = (String) session.getAttribute("loginCheck");
String userName = "";
boolean isLogin = false;
if(loginCheck != null && loginCheck.equals("OK")) {
    // loginUser:ログイン中のユーザー情報(ユーザーID・ユーザー名・パスワード・メールアドレス・住所・総購入金額・登録日時・削除フラグ)
    UserDataDTO userDTO = (UserDataDTO) hs.getAttribute("loginUser");
    userName = userDTO.getName();
    isLogin = true;
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KagoyumeTop</title>
    </head>
    <body>
        <%= JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") %>
        <h1>かごゆめトップ</h1>
        ショッピングサイトを使っている時、こんな経験ありませんか？<br>

        「あれいいな」<br>
        「これいいな」<br>
        「あっ、関連商品のこれもいい」<br>
        「20%オフセールだって！？買わなきゃ！」...<br>

        そしていざ『買い物かご』を開いたとき、その合計金額に愕然とします。<br>
        「こんなに買ってたのか・・・しょうがない。いくつか減らそう・・・」<br>

        仕方がありません。無駄遣いは厳禁です。<br>
        でも、一度買うと決めたものを諦めるなんて、ストレスじゃあありませんか？<br>
        できればお金の事なんか考えずに好きなだけ買い物がしたい・・・。<br>

        このサービスは、そんなフラストレーションを解消するために生まれた、<br>

        『金銭取引が絶対に発生しない』<br>
        『いくらでも、どんなものでも購入できる(気分になれる)』<br>
        『ECサイト』<br>
        
        です。<br>
        
        <form action="./Serch" method="POST">
            <input type="text" name="serchWord">
            <input type="submit" name="btnSubmit" value="検索">
        </form>
        
    </body>
</html>

<!--タスク一覧
○1. 購入後の買い物かご情報が残っている
○2. ログアウト機能
○3. ログイン状態の時のようこそ～さん実装する
○4.デリート直後にログイン状態になっていた件を修正 
○5. 新規登録フォーム
○6. mydata関係一式作る
○7. 買った時のデータベースへの登録
○8. 新規登録の未入力判定系
○9. 更新した後にすぐに会員情報が反映されてない件

-->