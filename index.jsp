<%//セッション破棄
session.invalidate();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JUMSトップ</title>
</head>
<body>
    <h1>ユーザー情報管理トップ</h1><br>
    <h3>ここでは、ユーザー情報管理システムとしてユーザー情報の登録や検索、
        付随して修正や削除を行うことができます</h3><br>
    <a href="insert">新規登録</a><br>
    <a href="Search" >検索(修正・削除)</a><br>
</body>
</html>




<!--
○1. 検索結果から詳細に進むとIDが2のレコードの詳細画面で固定になっている件の修正
○2. 詳細情報画面にトップへ戻るがないので追加
○3. 検索で、空で送っても全権表示にならない件の修正
○4. 検索で、完全一致でないと検索に引っかからない
○5. update,derete画面が作られていない
○6. USERDATADAO.javaの"tel1"を"tell"に修正
○7. searchの属性名と属性値が一緒であるが故のバグを修正
○8. 検索結果画面へ戻る処理追加
○9. delete.jspから詳細画面へ戻る機能追加
○10. 不正アクセス対策、直リンク対策としての"ac"の判定処理を各result.javaに実装
○11. UserDataDAO.javaのsearchメソッド中のsql文の分岐を修正





-->
