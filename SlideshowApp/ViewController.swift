//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 富樫　哲也 on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let sampleImage = UIImage(named: "flower1")
        image.image = sampleImage
        
    }
    
}

