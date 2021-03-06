/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 *
 * @author ko-taro
 */
public class Serch extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //セッション開始
        HttpSession session = request.getSession();
        try{
            request.setCharacterEncoding("UTF-8");
            String query = request.getParameter("serchWord");
            query = URLEncoder.encode(query, "UTF-8");
            
            //YahooAPIに接続
            URL url = new URL("https://shopping.yahooapis.jp/ShoppingWebService/V1/itemSearch?"
                    + "appid=dj00aiZpPW1sTEpJeThuWk5mQiZzPWNvbnN1bWVyc2VjcmV0Jng9NmY-"
                    + "&query=" +query);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.connect();
            
            //XML取得
            InputStream is = conn.getInputStream();
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(is);
            is.close();
            
            // 取得したXMLを解析
            ArrayList<String> code  = new ArrayList<>();
            ArrayList<String> name  = new ArrayList<>();
            ArrayList<String> image = new ArrayList<>();
            ArrayList<String> price = new ArrayList<>();
            Element rootElement = doc.getDocumentElement();
            // <Hit>～</Hit>は1商品の情報が全て詰まっている
            NodeList nodeList = rootElement.getElementsByTagName("Hit");
            for(int i = 0; i < nodeList.getLength(); i++) {
                Element elementHit = (Element)nodeList.item(i);
                // 商品IDを取得し格納　<Code>～</Code>
                NodeList codeList = elementHit.getElementsByTagName("Code");
                Element codeElement = (Element)codeList.item(0);
                code.add(codeElement.getFirstChild().getNodeValue());
                // 商品名を取得し格納　<Name>～</Name>
                NodeList nameList = elementHit.getElementsByTagName("Name");
                Element nameElement = (Element)nameList.item(0);
                name.add(nameElement.getFirstChild().getNodeValue());
                // 画像URLを取得し格納　<Medium>～</Medium>
                NodeList imageList = elementHit.getElementsByTagName("Medium");
                Element imageElement = (Element)imageList.item(0);
                image.add(imageElement.getFirstChild().getNodeValue());
                // 金額を取得し格納　<Price>～</Price>
                NodeList priceList = elementHit.getElementsByTagName("Price");
                Element priceElement = (Element)priceList.item(0);
                price.add(priceElement.getFirstChild().getNodeValue());
            }

             
            // JavaBeansに格納
            ItemDataBeans item = new ItemDataBeans();
            // queryはエンコード済なので、デコードし元の値に戻す
            query = URLDecoder.decode(query, "UTF-8");
            item.setQuery(query);
            
            item.setCode(code);
            item.setName(name);
            item.setImage(image);
            item.setPrice(price);
            
            // 検索結果をセッション登録（検索キーワード・検索結果数・商品コード・商品名・画像URL・価格）
            session.setAttribute("serchResult", item);
            //フォワード
            request.getRequestDispatcher("/serch.jsp").forward(request, response);  

        }catch(Exception e) {
            // 例外発生時、エラー画面にフォワード
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
