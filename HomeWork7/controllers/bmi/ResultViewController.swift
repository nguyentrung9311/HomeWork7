//
//  ResultViewController.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 12/05/2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbBmi: UILabel!
    @IBOutlet weak var lbAlert: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var bmi: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        lbBmi.text = String(format: "%.2f", bmi)
        contentView.layer.cornerRadius = 5.0
        
        if bmi < 18.5 {
            lbStatus.textColor = #colorLiteral(red: 0.3544200659, green: 0.7396929264, blue: 0.8902418017, alpha: 1)
            lbStatus.text = "THIẾU CÂN"
            lbAlert.text = "Bạn bị thiếu cân, cần bổ sung dinh dưỡng cho bữa ăn hằng ngày"
        } else if bmi < 25 {
            lbStatus.textColor = #colorLiteral(red: 0.6223168969, green: 0.7043415904, blue: 0.2300176322, alpha: 1)
            lbStatus.text = "CÂN ĐỐI"
            lbAlert.text = "Chúc mừng bạn có một cơ thể cân đối!"
        } else if bmi < 30 {
            lbStatus.textColor = #colorLiteral(red: 0.9635685086, green: 0.5045107007, blue: 0.1364018619, alpha: 1)
            lbStatus.text = "THỪA CÂN"
            lbAlert.text = "Bạn bị thừa cân, cần chú ý đến khẩu phần ăn hằng ngày và chăm tập thể dục thể thao"
        } else if bmi < 35 {
            lbStatus.textColor = #colorLiteral(red: 0.9063702822, green: 0.2730800509, blue: 0.2104969323, alpha: 1)
            lbStatus.text = "BÉO PHÌ"
            lbAlert.text = "Bạn bị béo phì, cần ăn nhiều rau xanh, hoa quả, ít ăn đồ nhiều dầu mỡ, chăm tập thể dục thể thao"
        } else {
            lbStatus.textColor = #colorLiteral(red: 0.7422949672, green: 0.2298608422, blue: 0.5443404317, alpha: 1)
            lbStatus.text = "BÉO PHÌ NGUY HIỂM"
            lbAlert.text = "Bạn bị béo phì nghiêm trọng, hãy tìm đến các chuyên gia để xin lời khuyên!"
        }
    }

    @IBAction func onReCalculatorClicked(_ sender: Any) {
        dismiss(animated: true)
    }
}
