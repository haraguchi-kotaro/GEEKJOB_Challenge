/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fileWriting;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ko-taro
 */
public class WriteAndPreserve {
    public static void main (String[] args){
    
        try {
            File intro = new File("/Users/ko-taro/Desktop/javaKadai.txt");
            
            intro.createNewFile();//ファイル作成
            FileWriter fw = new FileWriter(intro);
            fw.write("原口晃太朗です。宇都宮大学出身で、前職は銀行員です。");
            fw.close();
            
        } catch (IOException ex) {
            Logger.getLogger(WriteAndPreserve.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    
    }
}
