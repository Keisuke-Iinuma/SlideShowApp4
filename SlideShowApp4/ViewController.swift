//
//  ViewController.swift
//  SlideShowApp4
//
//  Created by 飯沼圭哉 on 2020/06/06.
//  Copyright © 2020 keisuke.iinuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初期画面
        // バンドルした画像ファイルを読み込み
        // Image Viewに画像を設定
        let image = UIImage(named: "photo9.jpeg")
        imageView.image = image
        
    }
    
    
}

