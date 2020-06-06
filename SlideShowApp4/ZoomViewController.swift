//
//  ZoomViewController.swift
//  SlideShowApp4
//
//  Created by 飯沼圭哉 on 2020/06/06.
//  Copyright © 2020 keisuke.iinuma. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = selectedImg
        imageView.image = image
        
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
