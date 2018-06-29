package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.JumsHelper;
import kagoyume.UserDataDTO;

public final class myupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
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

HttpSession hs = request.getSession();
// loginCheck:ログイン中の場合は"OK"の文字列を格納　[Login.java]で登録
String loginCheck = (String) session.getAttribute("loginCheck");
String userName = "";
boolean isLogin = false;
// loginUser:ログイン中のユーザー情報(ユーザーID・ユーザー名・パスワード・メールアドレス・住所・総購入金額・登録日時・削除フラグ)　[Login.java]で登録
UserDataDTO userDTO = (UserDataDTO) hs.getAttribute("loginUser");
if(loginCheck != null && loginCheck.equals("OK")) {
    userName = userDTO.getName();
    isLogin = true;
}

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>会員情報更新ページ</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.print( JumsHelper.getInstance().menu(isLogin, userName, "/mydata.jsp") );
      out.write("\n");
      out.write("        <h1>会員情報更新</h1>\n");
      out.write("        <form action=\"MyUpdateResult\" method=\"POST\">\n");
      out.write("    ユーザー名：<input type=\"text\" name=\"name\" placeholder=\"ユーザー名\" value=\"");
      out.print( userDTO.getName() );
      out.write("\"><br>\n");
      out.write("    パスワード：<input type=\"text\" name=\"password\" placeholder=\"パスワード\" value=\"");
      out.print( userDTO.getPassword() );
      out.write("\"><br>\n");
      out.write("    メールアドレス：<input type=\"text\" name=\"mail\" placeholder=\"メールアドレス\" value=\"");
      out.print( userDTO.getMail() );
      out.write("\"><br>\n");
      out.write("    住所：<input type=\"text\" name=\"address\" placeholder=\"住所\" value=\"");
      out.print( userDTO.getAddress() );
      out.write("\"><br><br>\n");
      out.write("    <input type=\"hidden\" name=\"id\" value=\"");
      out.print( userDTO.getUserID() );
      out.write("\">\n");
      out.write("    <input type=\"submit\" value=\"更新\">\n");
      out.write("    </form>\n");
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
