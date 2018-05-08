/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.blackjack;

import java.util.ArrayList;
import java.util.Collections;
import org.blackjack.Dealer;

/**
 *
 * @author ko-taro
 */

public class Blackjack {
    public static void main(String args[]){//ゲームの進行メソッド
        System.out.print("ブラックジャックを開始します。"+"<br>");
        User user1 = new User();//インスタンス生成
        User user2 = new User();
        Dealer dealer = new Dealer();
        
        System.out.print("カードを配ります。"+"<br>");//カードを配る処理
        ArrayList drawCard = dealer.deal();
        
        user1.setCard(drawCard);
        dealer.deal();
        user2.setCard(drawCard);
        dealer.deal();
        dealer.setCard(drawCard);
        
        System.out.print("ユーザー1の合計は"+user1.open()+"<br>");//現在の各プレイヤーの合計を表示
        System.out.print("ユーザー2の合計は"+user2.open()+"<br>");
        System.out.print("ディーラーの合計は"+dealer.open()+"<br>");
    
        if(user1.checkSum()){//user1のヒットかスタンドかの判断
            System.out.print("ユーザー1がカードを引きます"+"<br>");
            dealer.hit();
            user1.setCard(drawCard);
            if(user1.open()>21){
                System.out.print("ユーザー1はバースト！"+"<br>");
            }
        
        }else{
            System.out.print("ユーザー1はスタンド"+"<br>");
        }
        
        if(user1.checkSum()){//user2のヒットかスタンドかの判断
            System.out.print("ユーザー2がカードを引きます"+"<br>");
            dealer.hit();
            user2.setCard(drawCard);
            if(user2.open()>21){
                System.out.print("ユーザー2はバースト！"+"<br>");
            }
        
        }else{
            System.out.print("ユーザー2はスタンド"+"<br>");
        }
        
        if(dealer.checkSum()){//ディーラーのヒットかスタンドかの判断
            System.out.print("ディーラーがカードを引きます"+"<br>");
            dealer.hit();
            dealer.setCard(drawCard);
            if(user1.open()>21){
                System.out.print("ディーラーはバースト！"+"<br>");
            }
        
        }else{
            System.out.print("ディーラーはスタンド"+"<br>");
        }
        
        System.out.print("オープン"+"<br>");//各プレイヤーの合計を開示
        System.out.print("ユーザー1の合計は"+user1.open());
        System.out.print("ユーザー2の合計は"+user2.open());
        System.out.print("ディーラーの合計は"+dealer.open());
        
        int a = user1.open();//各プレイヤーの合計を変数に格納
        int b = user2.open();
        int c = dealer.open();
        
        if(a>b && a>c || b>21 && c>21 && 21>=a){//a勝ちのパターン
            System.out.print("ユーザー1の勝ちです"+"<br>");
        }else if(b>a && b>c || a>21 && c>21 && 21>=b){//b勝ちのパターン
            System.out.print("ユーザー2の勝ちです"+"<br>");
        }else if(c>a && c>b || a>21 && b>21 && 21>=c){//c勝ちパターン
            System.out.print("ディーラーの勝ちです"+"<br>");
        }else if(a == b && b==c && a==c || a>21 && b>21 && c>21){//引き分け
            System.out.print("引き分けです"+"<br>");
        }
        
        System.out.print("ブラックジャックを終了します");
    }
}

abstract class Human{//抽象クラス
    protected ArrayList <Integer> myCard = new ArrayList<Integer>();

    public abstract int open ();
    
    public abstract void setCard (ArrayList<Integer> drawCard);
    
    public abstract boolean checkSum ();
}

class User extends Human{//ユーザークラス
    public int open (){//手持ちのカード(myCard)の合計を出すメソッド
        if(myCard.size() == 2){//手持ち2枚の時
            int card1 = myCard.get(0);//配列myCardをカード1,2,3へ代入
            int card2 = myCard.get(1);
        
            if(card1 >=10){//トランプの数字が13以上なら、10として扱う処理
                myCard.set(0,10);
            }else if(card2 >=10){
                myCard.set(1,10);
            }
        }else if (myCard.size()==3){//手持ち3枚の時
            int card1 = myCard.get(0);//配列myCardをカード1,2,3へ代入
            int card2 = myCard.get(1);
            int card3 = myCard.get(2);
            
            if(card1 >=10){//トランプの数字が13以上なら、10として扱う処理
                myCard.set(0,10);
            }else if(card2 >=10){
                myCard.set(1,10);
            }else if(card3 >=10){
                myCard.set(2,10);
            }
        }
        
        int total = 0;//合計を出す処理
        for (int k = 0; k<myCard.size();k++){
            total += myCard.get(k);
        }
        return total;
    }
    
    @Override
    public void setCard (ArrayList<Integer> drawCard) {//ArrayListのdrawCardをmyCardにセットする
        myCard.add(drawCard.get(0));
        myCard.add(drawCard.get(1));
    }
    
    public boolean checkSum (){//今回は合計が17以下ならtrueを返す(hitする)ことにする
        if(myCard.get(0)+myCard.get(1)<17){
            return true;
        }else{
            return false;
        }
    } 
}

class Dealer extends User{//ディーラークラス
    protected ArrayList <Integer> cards = new ArrayList<Integer>();//山札

    public Dealer () {//山札cardsに1から13までのカード×4セットを入れる初期処理
        for(int i = 1; i <=4;i++){
           for(int j = 1; j<=13; j++){
               cards.add(j);
           }
        };
    }
    
    public ArrayList<Integer> deal () {//drawCardというArrayListを作成し、そこにシャッフルしたcardsの1,2番目を追加している
        Collections.shuffle(cards);
        ArrayList <Integer> drawCard = new ArrayList<Integer>();
        drawCard.clear();
        drawCard.add(cards.get(0));
        drawCard.add(cards.get(1));
        return drawCard;
    }

    public ArrayList<Integer> hit() {//drawCardというArrayListを作成し、そこにシャッフルしたcardsの1番目を追加している
        Collections.shuffle(cards);
        ArrayList <Integer> drawCard = new ArrayList<Integer>();
        drawCard.clear();
        drawCard.add(cards.get(0));
        return drawCard;
    }
}

