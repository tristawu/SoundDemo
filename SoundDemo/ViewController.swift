//
//  ViewController.swift
//  SoundDemo
//
//  Created by Trista on 2021/2/21.
//

import UIKit
//包含音效相關的函式
import AVFoundation


class ViewController: UIViewController {

    //建立一個變數
    var myPlayer :AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        //先取得音效檔案的路徑，再將音效檔案傳入初始化播放器當做參數建立
        //建立播放器
        let soundPath = Bundle.main.path(
            forResource: "bird", ofType: "mp3")
        
        /*使用do-catch語句來定義錯誤的捕獲(catch)及處理，每一個catch表示可以捕獲到一個錯誤拋出的處理方式
         do {
             try 拋出函式
             其他執行的程式
         } catch 錯誤1 {
             處理錯誤1
         } catch 錯誤2 {
             處理錯誤2
         }
        */
        do {
            myPlayer = try AVAudioPlayer(
                contentsOf: NSURL.fileURL(withPath: soundPath!))

            //重複播放次數 設為 0 則是只播放一次 不重複
            myPlayer.numberOfLoops = 0

        } catch {
            print("error")
        }
        
        
        //建立一個按鈕，按下時會播放音效
        let myButton = UIButton(frame: CGRect(
          x: 50, y: 200, width: 300, height: 60))
        myButton.setTitle("按下有音樂(要開喇叭喔！)", for: .normal)
        myButton.setTitleColor(UIColor.blue, for: .normal)
        myButton.addTarget(
            self,
            action: #selector(ViewController.go),
            for: .touchUpInside)
        
        self.view.addSubview(myButton)
    }

    
    //按下按鈕後執行動作的方法
    @objc func go() {
        //播放音效
        myPlayer.play()
    }

}

