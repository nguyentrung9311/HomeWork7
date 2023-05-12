//
//  BmiViewController.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 12/05/2023.
//

import UIKit

enum Gender {
    case male
    case female
    case none
}

class BmiViewController: UIViewController {
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var btnSubWeight: UIButton!
    @IBOutlet weak var btnAddWeight: UIButton!
    @IBOutlet weak var btnSubAge: UIButton!
    @IBOutlet weak var btnAddAge: UIButton!
    
    @IBOutlet weak var lbWeight: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var sliderHeight: UISlider!
    
    var gender: Gender = .none
    var height = 0
    var weight = 0
    var age = 0
    var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        initDefaultData()
        initGestures()
    }
    
    private func initDefaultData() {
        height = Int(sliderHeight.value)
        weight = Int(lbWeight.text ?? "0") ?? 0
        age = Int(lbAge.text ?? "0") ?? 0
    }
    
    private func initViews() {
        let cornerRadius = 5.0
        maleView.layer.cornerRadius = cornerRadius
        femaleView.layer.cornerRadius = cornerRadius
        heightView.layer.cornerRadius = cornerRadius
        weightView.layer.cornerRadius = cornerRadius
        ageView.layer.cornerRadius = cornerRadius
        
        btnSubWeight.layer.cornerRadius = btnSubWeight.bounds.width / 2.0
        btnAddWeight.layer.cornerRadius = btnAddWeight.bounds.width / 2.0
        btnSubAge.layer.cornerRadius = btnSubAge.bounds.width / 2.0
        btnAddAge.layer.cornerRadius = btnAddAge.bounds.width / 2.0
    }

    @IBAction func onHeightChanged(_ sender: UISlider) {
        height = Int(sender.value)
        lbHeight.text = "\(height) cm"
    }
    
    @IBAction func onAddWeightClicked(_ sender: UIButton) {
        if weight < 350 {
            weight += 1
            lbWeight.text = "\(weight)"
        }
    }
    
    @IBAction func onSubWeightClicked(_ sender: UIButton) {
        if weight > 1 {
            weight -= 1
            lbWeight.text = "\(weight)"
        }
    }
    
    @IBAction func onAddAgeClicked(_ sender: UIButton) {
        if age < 180 {
            age += 1
            lbAge.text = "\(age)"
        }
    }
    
    @IBAction func onSubAgeClicked(_ sender: UIButton) {
        if age > 1 {
            age -= 1
            lbAge.text = "\(age)"
        }
    }
    
    @IBAction func onCalculateClicked(_ sender: Any) {
        let bmi = Float(weight) / (powf((Float(height) / 100.0), 2))
        let mainStoryboad = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = mainStoryboad.instantiateViewController(withIdentifier: "ResultViewController")
        as! ResultViewController
        resultVC.bmi = bmi
        resultVC.modalPresentationStyle = .fullScreen
        
        present(resultVC, animated: true)
    }
}
