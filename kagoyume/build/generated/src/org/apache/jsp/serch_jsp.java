package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.UserDataDTO;
import kagoyume.ItemDataBeans;
import kagoyume.JumsHelper;

public final class serch_jsp extends org.apache.jasper.runtime.HttpJspBase
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
// serchResult:商品の検索結果(検索キーワード・検索結果数・商品コード・商品名・画像URL・価格)　[Search.java]で登録]
ItemDataBeans item = (ItemDataBeans) hs.getAttribute("serchResult");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>検索ページ</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.print( JumsHelper.getInstance().menu(isLogin, userName, "/top.jsp") );
      out.write("\n");
      out.write("        <h1>検索結果</h1>\n");
      out.write("    検索キーワード：");
      out.print( item.getQuery() );
      out.write("<br><br>\n");
      out.write("    検索結果数：件<br>\n");
      out.write("    <br>\n");
      out.write("    <table border=\"1\">\n");
      out.write("        ");

            // 検索上位20件が表示される(YahooAPIの仕様)
            for(int i = 0; i < item.getName().size(); i++) {
                out.println("<tr>");
                out.println("<td><img src=\"" + item.getImage().get(i) + "\"></td>");
                out.println("<td><b>");
                out.println("<a href=\"Item?itemcode=" + item.getCode().get(i) + "\">" + item.getName().get(i) + "</a><br>");
                out.println("<font color=\"red\">" + item.getPrice().get(i) + "円</font>");
                out.println("</b></td>");
                out.println("</tr>");
            }
        
      out.write("\n");
      out.write("    </table>\n");
      out.write("        ");
      out.print(jh.home());
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
