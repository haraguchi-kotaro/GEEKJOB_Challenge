/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fileWriting;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ko-taro
 */
public class StandardClassAndProcess {
    public static void main (String[] ards){
        try {
            File logFile = new File("/Users/ko-taro/Desktop/javaKadaiLogFile.txt");//ファイルオープン、インスタンス作成
            logFile.createNewFile();//ファイル作成
            FileWriter fw = new FileWriter(logFile); 
            
            fw.write("乱数生成"+"<br>");
            fw.write("処理を開始します。"+nowTime()+"<br>");
            Random r = new Random();
            System.out.print(r.nextBoolean());
            fw.write("処理を終了します。"+nowTime()+"<br>");
            
            fw.write("平方根の計算"+"<br>");
            fw.write("処理を開始します。"+nowTime()+"<br>");
            double a = Math.sqrt(11);
            System.out.print(a);
            fw.write("処理を終了します。"+nowTime()+"<br>");
            
            fw.write("String型をint型に変換"+"<br>");
            fw.write("処理を開始します。"+nowTime()+"<br>");
            String age = "26";
            int n = Integer.parseInt(age);
            System.out.print("私は"+n+"歳です"+"<br>");
            fw.write("処理を終了します。"+nowTime()+"<br>");
            
            fw.close();
        
        } catch (IOException ex) {
            Logger.getLogger(StandardClassAndProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }

    static String nowTime(){
        Date now = new Date();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = f.format(now);
        return s;
    }
}
