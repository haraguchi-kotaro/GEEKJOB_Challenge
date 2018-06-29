package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.UserDataDTO;
import kagoyume.JumsHelper;

public final class top_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

JumsHelper jh = JumsHelper.getInstance();

HttpSession hs = request.getSession();
// loginCheck:ログイン中の場合は"OK"の文字列を格納　[Login.java]で登録
String loginCheck = (String) session.getAttribute("loginCheck");
String userName = "";
boolean isLogin = false;
if(loginCheck != null && loginCheck.equals("OK")) {
    // loginUser:ログイン中のユーザー情報(ユーザーID・ユーザー名・パスワード・メールアドレス・住所・総購入金額・登録日時・削除フラグ)　[Login.java]で登録
    UserDataDTO userDTO = (UserDataDTO) hs.getAttribute("loginUser");
    userName = userDTO.getName();
    isLogin = true;
}

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>KagoyumeTop</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.print( JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") );
      out.write("\n");
      out.write("        <h1>かごゆめトップ</h1>\n");
      out.write("        ショッピングサイトを使っている時、こんな経験ありませんか？<br>\n");
      out.write("\n");
      out.write("        「あれいいな」<br>\n");
      out.write("        「これいいな」<br>\n");
      out.write("        「あっ、関連商品のこれもいい」<br>\n");
      out.write("        「20%オフセールだって！？買わなきゃ！」...<br>\n");
      out.write("\n");
      out.write("        そしていざ『買い物かご』を開いたとき、その合計金額に愕然とします。<br>\n");
      out.write("        「こんなに買ってたのか・・・しょうがない。いくつか減らそう・・・」<br>\n");
      out.write("\n");
      out.write("        仕方がありません。無駄遣いは厳禁です。<br>\n");
      out.write("        でも、一度買うと決めたものを諦めるなんて、ストレスじゃあありませんか？<br>\n");
      out.write("        できればお金の事なんか考えずに好きなだけ買い物がしたい・・・。<br>\n");
      out.write("\n");
      out.write("        このサービスは、そんなフラストレーションを解消するために生まれた、<br>\n");
      out.write("\n");
      out.write("        『金銭取引が絶対に発生しない』<br>\n");
      out.write("        『いくらでも、どんなものでも購入できる(気分になれる)』<br>\n");
      out.write("        『ECサイト』<br>\n");
      out.write("        \n");
      out.write("        です。<br>\n");
      out.write("        \n");
      out.write("        <form action=\"./Serch\" method=\"POST\">\n");
      out.write("            <input type=\"text\" name=\"serchWord\">\n");
      out.write("            <input type=\"submit\" name=\"btnSubmit\" value=\"検索\">\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!--\n");
      out.write("○1. 購入後の買い物かご情報が残っている\n");
      out.write("○2. ログアウト機能\n");
      out.write("○3. ログイン状態の時のようこそ～さん実装する\n");
      out.write("○4.デリート直後にログイン状態になっていた件を修正 \n");
      out.write("○5. 新規登録フォーム\n");
      out.write("○6. mydata関係一式作る\n");
      out.write("○7. 買った時のデータベースへの登録\n");
      out.write("○8. 新規登録の未入力判定系\n");
      out.write("○9. 更新した後にすぐに会員情報が反映されてない件\n");
      out.write("\n");
      out.write("-->");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
