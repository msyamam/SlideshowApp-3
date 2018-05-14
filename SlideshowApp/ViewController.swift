//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Kisoshi on 2018/05/10.
//  Copyright © 2018年 masayoshi.yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var filename : String! = nil
    var dispImageNo = 0
    let imageNameArray = [
        "IMG_0338.JPG",
        "IMG_2377.JPG",
        "IMG_2508.JPG",
        ]
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
        
    @IBAction func onTapImage(_ sender: Any) {
        
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer!
    var title1: String!
    
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var GoStop: UIButton!
    
    @IBAction func Next(_ sender: Any) {
        // 表示している画像の番号を1減らす
        if dispImageNo <= 1 {
            dispImageNo += 1
        }
        else {
            dispImageNo = 0
        }
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    
    @IBAction func Back(_ sender: Any) {
        if dispImageNo > 0 {
            dispImageNo -= 1
        }
        else {
            dispImageNo = 2
        }
        displayImage()
    }
    
    
    @IBAction func GoStop(_ sender: Any) {
        title1 = self.GoStop.currentTitle!
        if title1 == "停止" {
            if self.timer != nil {
                self.timer.invalidate()   // 現在のタイマーを破棄する
                self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
                Next.isEnabled = true
                Back.isEnabled = true
                GoStop.setTitle("再生", for: .normal)
            }
        }
                else {
            Next.isEnabled = false
            Back.isEnabled = false
            GoStop.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(displayImage2), userInfo: nil, repeats: true)
        }
    }
    
    

@objc func displayImage2() {

    // 表示している画像の番号から名前を取り出し
    //let name = imageNameArray[dispImageNo]
    // 画像を読み込み
    //let image = UIImage(named: name)
    // Image Viewに読み込んだ画像をセット
    //imageView.image = image
    if dispImageNo <= 1 {
        dispImageNo += 1
    }
    else {
        dispImageNo = 0
    }
    let name = imageNameArray[dispImageNo]
    let image = UIImage(named: name)
    imageView.image = image
    
}
@objc func displayImage() {
 
    // 表示している画像の番号から名前を取り出し
    let name = imageNameArray[dispImageNo]
    // 画像を読み込み
    let image = UIImage(named: name)
    // Image Viewに読み込んだ画像をセット
    imageView.image = image
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.timer.invalidate()   // 現在のタイマーを破棄する
        self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        Next.isEnabled = true
        Back.isEnabled = true
        GoStop.setTitle("再生", for: .normal)
        
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        let filename = imageNameArray[dispImageNo]
        resultViewController.transimage = filename
        
        //resultViewController.imageView = self.image
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "IMG_0338.JPG")
        imageView.image = image
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

