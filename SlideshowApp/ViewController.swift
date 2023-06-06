//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 富樫　哲也 on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {
    
    let imageName = ["flower1.jpeg", "flower2.jpeg", "flower3.jpeg"]
    var changeImgNo = 0
    var timer: Timer! //タイマー
    
    
    @IBOutlet weak var imageView: UIImageView!

    
    func displayImage() {
        //上流のプロパティで「let imageName = ["flower1", "flower2", "flower3"]」宣言しているので改めて宣言しなくてok？　→okだわ
        if changeImgNo < 0 {changeImgNo = 2 }
        if changeImgNo > 2 {changeImgNo = 0 }
        //表示中の画像Noから名前を取り出す　nameが”　”になる
        let name = imageName[changeImgNo]
        imageView.image = UIImage(named: name)
    }

    
    @IBAction func nextbtn(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2 }
        else if changeImgNo == 2 {
            changeImgNo = 0 }
        let name = imageName[changeImgNo]
        imageView.image = UIImage(named: name) //最後のこの２行は必須っぽい
    }
    
 
    @IBOutlet weak var nextbtn: UIButton!  //押せなくなるのに必須？
    @IBOutlet weak var backbtn: UIButton!
    
    
    @IBOutlet weak var startstopbtn: UIButton!
//    →最初入れてなかったから遷移後のボタン表記が変わらなかった
    
    @IBAction func startstopbtn(_ sender: UIButton){
       
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
            nextbtn.isEnabled = false//再生停止ボタン押すと、他のボタンが押せなくなる
            backbtn.isEnabled = false
            sender.setTitle("停止", for: .normal)
        }
        else {      //タイマーが"nil"じゃない時
            self.timer.invalidate() //タイマー止める
            self.timer = nil
            nextbtn.isEnabled = true  //他のボタン復活
            backbtn.isEnabled = true
            sender.setTitle("再生", for: .normal)
        }
    }
    
    
    @objc private func timerUpdate() {
            changeImgNo += 1
            displayImage()
    }
        
//    private func display() {
//        let name = imageName[changeImgNo]
//        imageView.image = UIImage(named: name)
//    }   //←ChatGPTに教えてもらったらやつ、これ入れたら自動送りされるようになった
//    →そもそもこの後display出てこないからいらないよ
    
    
    @IBAction func backbtn(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 1 }
        else if changeImgNo == 1 {
            changeImgNo = 0 }
        let name = imageName[changeImgNo]
        imageView.image = UIImage(named: name)
    //startstopボタンのtimer以下はここにあった
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageName = UIImage(named: "flower1.jpeg")
        imageView.image = imageName
    }
        
//        let tapGestureRecognizer = UItapGestureRecognizer(target: self, action: #selector(imageTapped))
//        imageView.addGestureRecognizer(tapGestureRecognizer)
//        imageView.isUserInteractionEnabled = true
//    }
//
//    @objc func imageTapped() {
//        performSegue(withIdentifier: "magImgViewC", sender: self)
//
//        self.timer.invalidate()
//        self.timer = nil
//    }→いらないよ
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let magImgViewController: magImgViewController = segue.destination as! magImgViewController
        magImgViewController.magImage = imageView.image
        
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
        nextbtn.isEnabled = true  //他のボタン復活
        backbtn.isEnabled = true
        
        startstopbtn.setTitle("再生", for: .normal)
    }
        
        //let magImgViewController = storyboard?.instantiateViewController(withIdentifier: "magImgViewController") as! magImgViewController
        //magImgViewController.magImage = imageView.image
        //present(magImgViewController, animated: true, completion: nil)
    //「func prepare()」を「objc func imageTapped()」内に入れてたけど、ChatGPTから「外に出せ」って言われて外に出したらできた。あと、「objc func imageTapped()」に「performSegue()」入れろって言われたからそうしたらできた。GPTさんすげー
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
      
    }
    
    
}

