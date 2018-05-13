//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Kisoshi on 2018/05/10.
//  Copyright © 2018年 masayoshi.yamamoto. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    var transimage: String!
    var image : UIImage!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       //let myImage: UIImage = UIImage(named: "sample.jpeg")!
       //let myScaleUpView: UIImageView = UIImageView(frame:  CGRect(x: 100, y: 120, width: 80, height: 80))
        
        let image = UIImage(named: transimage)
        //imageView.image = image
        
        let myScaleUpView: UIImageView = UIImageView(frame:  CGRect(x: 100, y: 120, width: 80, height: 80))
        
        // UIImageViewに画像を設定する.
        
        myScaleUpView.image = image
        // 縮小用(0.5倍)のアフィン行列を生成する.
        myScaleUpView.transform = CGAffineTransform(scaleX: 8, y: 8)
        
        // Viewに追加する.
        self.view.addSubview(myScaleUpView)
        
        
        
        
        //imageView.image = self.image
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


