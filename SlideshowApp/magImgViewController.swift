//
//  magImgViewController.swift
//  SlideshowApp
//
//  Created by 富樫　哲也 on 2023/06/03.
//

import UIKit

class magImgViewController: UIViewController {



    @IBOutlet weak var magImgView: UIImageView!
    var magImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        magImgView.image = magImage
        
        // Do any additional setup after loading the view.
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
