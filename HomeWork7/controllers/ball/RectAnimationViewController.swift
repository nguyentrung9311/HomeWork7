//
//  RectAnimationViewController.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 12/05/2023.
//

import UIKit

class RectAnimationViewController: UIViewController {
    @IBOutlet weak var ivBall: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivBall.image = UIImage(named: "bubble")
    }

}
