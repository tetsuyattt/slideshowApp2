//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 富樫　哲也 on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {
    
    let imageName = ["flower1", "flower2", "flower3"]
    var changeImgNo = 0
    
    
    @IBOutlet weak var image: UIImageView!
    

    @IBAction func gobtn(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2 }
        else if changeImgNo == 2 {
            changeImgNo = 0 }
        let name = imageName[changeImgNo]
        image.image = UIImage(named: name) }
    
    @IBAction func backbtn(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 1 }
        else if changeImgNo == 1 {
            changeImgNo = 0 }
        let name = imageName[changeImgNo]
        image.image = UIImage(named: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageName = UIImage(named: "flower1")
        image.image = imageName
        
    }
    
}

