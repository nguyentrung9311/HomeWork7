//
//  BmiViewCotrollerEx.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 12/05/2023.
//

import Foundation
import UIKit

extension BmiViewController {
    func initGestures() {
        let maleClickGesture = UITapGestureRecognizer(target: self, action: #selector(onMaleClicked))
        maleView.addGestureRecognizer(maleClickGesture)
        
        let femaleClickGesture = UITapGestureRecognizer(target: self, action: #selector(onFemaleClicked))
        femaleView.addGestureRecognizer(femaleClickGesture)
        
        let subWeightLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(onSubWeightLongPress))
        btnSubWeight.addGestureRecognizer(subWeightLongPressGesture)
        
        let addWeightLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(onAddWeightLongPress))
        btnAddWeight.addGestureRecognizer(addWeightLongPressGesture)
        
        let subAgeLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(onSubAgeLongPress))
        btnSubAge.addGestureRecognizer(subAgeLongPressGesture)
        
        let addAgeLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(onAddAgeLongPress))
        btnAddAge.addGestureRecognizer(addAgeLongPressGesture)
    }
    
    @objc func onAddAgeLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] timer in
                if age < 180 {
                    age += 1
                    lbAge.text = "\(age)"
                }
            })
        } else if gesture.state == .ended {
            timer?.invalidate()
        }
    }
    
    @objc func onSubAgeLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] timer in
                if age > 1 {
                    age -= 1
                    lbAge.text = "\(age)"
                }
            })
        } else if gesture.state == .ended {
            timer?.invalidate()
        }
    }
    
    @objc func onAddWeightLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] timer in
                if weight < 350 {
                    weight += 1
                    lbWeight.text = "\(weight)"
                }
            })
        } else if gesture.state == .ended {
            timer?.invalidate()
        }
    }
    
    @objc func onSubWeightLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] timer in
                if weight > 1 {
                    weight -= 1
                    lbWeight.text = "\(weight)"
                }
            })
        } else if gesture.state == .ended {
            timer?.invalidate()
        }
    }
    
    @objc func onMaleClicked() {
        maleView.backgroundColor = #colorLiteral(red: 0.1592961252, green: 0.1713854671, blue: 0.2616639137, alpha: 1)
        femaleView.backgroundColor = #colorLiteral(red: 0.2008301318, green: 0.1987569332, blue: 0.2722920775, alpha: 1)
    }
    
    @objc func onFemaleClicked() {
        femaleView.backgroundColor = #colorLiteral(red: 0.1592961252, green: 0.1713854671, blue: 0.2616639137, alpha: 1)
        maleView.backgroundColor = #colorLiteral(red: 0.2008301318, green: 0.1987569332, blue: 0.2722920775, alpha: 1)
    }
}
