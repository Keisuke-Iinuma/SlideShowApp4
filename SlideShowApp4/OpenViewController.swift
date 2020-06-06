//
//  OpenViewController.swift
//  SlideShowApp4
//
//  Created by 飯沼圭哉 on 2020/06/06.
//  Copyright © 2020 keisuke.iinuma. All rights reserved.
//

import UIKit

class OpenViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // 初期画面
        // バンドルした画像ファイルを読み込み
        // Image Viewに画像を設定
        let image = UIImage(named: "photo1.jpeg")
        imageView.image = image
        
        
    }
    
    // 表示している画像の番号
    var displayImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = ["photo1.jpeg", "photo2.jpeg", "photo3.jpeg", "photo4.jpeg"
        , "photo5.jpeg", "photo6.jpeg", "photo7.jpeg", "photo10.jpeg", "photo11.jpeg", "photo12.jpeg", "photo13.jpeg", "photo14.jpeg", "photo15.jpeg"]
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    
    @IBAction func playButtonTap(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0,
                                              target: self, selector:#selector(updateTimer(_:)), userInfo: nil, repeats: true)
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = false
            backButton.isEnabled = false
            // ボタンの名前を停止とする
            playButton.setTitle("停止", for: .normal)
            // 背景色・ボタン内テキストサイズを変更
            //self.view.backgroundColor = UIColor.lightGray
            //playButton.titleLabel?.font =
            //UIFont.systemFont(ofSize: 25)
            
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = true
            backButton.isEnabled = true
            // ボタンの名前を再生とする
            playButton.setTitle("再生", for: .normal)
            // 背景色・ボタン内テキストサイズを戻す
            //self.view.backgroundColor = UIColor.white
            //playButton.titleLabel?.font =
            //UIFont.systemFont(ofSize: 20)
            
        }
    }
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 進むボタンの内容を行う
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo) // 取得インデックスの確認
        }
    }
    
    
    @IBAction func nextButtonTap(_ sender: Any) {
        
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
        
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        
        if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
            // 表示している画像の番号を1減らす
            displayImageNo -= 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }  else {
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
        
    }
    
    @IBAction func photoTap(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoomIn", sender: nil)
        // タイマーを停止
        if self.timer != nil {
            self.timer.invalidate()
        }
    }
    
    // 遷移元から遷移先にデータ(画像)を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerのインスタンスを取得する
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // 遷移先のZoomInViewControllerで宣言しているselectedImgに値を代入して渡す
        zoomViewController.selectedImg = image
        //resultViewController.sendText = self.textField.text!
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
         // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
               if self.timer == nil {
                   // タイマーを設定
                   self.timer = Timer.scheduledTimer(timeInterval: 2.0,
                                                     target: self, selector:#selector(updateTimer(_:)), userInfo: nil, repeats: true)
                   // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                   nextButton.isEnabled = false
                   backButton.isEnabled = false
                   // ボタンの名前を停止とする
                   playButton.setTitle("停止", for: .normal)
                   // 背景色・ボタン内テキストサイズを変更
                   //self.view.backgroundColor = UIColor.lightGray
                   //playButton.titleLabel?.font =
                   //UIFont.systemFont(ofSize: 25)
                   
               } else if self.timer != nil {
                   // タイマーを停止
                   self.timer.invalidate()
                   // nil にして再び再生(nil の時にタイマー生成)
                   self.timer = nil
                   // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
                   nextButton.isEnabled = true
                   backButton.isEnabled = true
                   // ボタンの名前を再生とする
                   playButton.setTitle("再生", for: .normal)
                   // 背景色・ボタン内テキストサイズを戻す
                   //self.view.backgroundColor = UIColor.white
                   //playButton.titleLabel?.font =
                   //UIFont.systemFont(ofSize: 20)
                   
               }
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

