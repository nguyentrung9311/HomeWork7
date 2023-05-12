//
//  ViewController.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 11/05/2023.
//

import UIKit

class ViewController: UIViewController {
    var mainStoryboard: UIStoryboard!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    }
    
    @IBAction func onBmiClicked(_ sender: Any) {
        let bmiVC = mainStoryboard.instantiateViewController(withIdentifier: "BmiViewController") as! BmiViewController
        bmiVC.modalPresentationStyle = .fullScreen
        present(bmiVC, animated: true)
    }
    
    @IBAction func onBallAnimationRectClicked(_ sender: Any) {
        let rectAnimVC = mainStoryboard.instantiateViewController(withIdentifier: "RectAnimationViewController") as! RectAnimationViewController
        rectAnimVC.modalPresentationStyle = .fullScreen
        present(rectAnimVC, animated: true)
    }
    
    @IBAction func onBallAnimationZiczacClicked(_ sender: Any) {
 
    }
}

