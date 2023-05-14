//
//  ZiczacViewController.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 13/05/2023.
//

import UIKit

class ZiczacViewController: UIViewController {
    @IBOutlet weak var ivBall: UIImageView!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var ballStep: ZiczacBallStep = .step1
    var ballState: RectBallState = .translateToBottom
    // Time to ball transition from top to bottom of screen in seconds
    let animationTime = 4.0
    var height = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        height = (view.bounds.height - ivBall.bounds.height) / 3
    }
    
    @IBAction func onBackClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func createTransitionAnimation(_ transitionState: TransitionState, _ from: Float, _ to: CGFloat, _ duration: Double) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: transitionState == .transitionX ? "transform.translation.x" : "transform.translation.y")
        animation.fromValue = from
        animation.toValue = to
        animation.fillMode = .forwards
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        return animation
    }
    
    private func createRotationAnimation(_ isCcw: Bool) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.repeatCount = .infinity
        animation.fromValue = 0
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.toValue = Float.pi * 2 * (isCcw ? -1 : 1)
        animation.duration = animationTime / 8
        return animation
    }
    
    @IBAction func onStartAnimation(_ sender: Any) {
        UIView.animate(withDuration: 0.5) { [self] in
            btnStart.alpha = 0
            btnBack.alpha = 0
        }
        
        ivBall.layer.add(createRotationAnimation(true), forKey: "rotation")
        
        ivBall.layer.add(createTransitionAnimation(.transitionX, 0, view.bounds.maxX - ivBall.bounds.width, animationTime * (view.bounds.width / view.bounds.height)), forKey: "translation")
    }
}

extension ZiczacViewController : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        switch(ballStep) {
        case .step1:
            ballStep = .step2
            ivBall.frame.origin.x = view.bounds.maxX - ivBall.bounds.width
            ivBall.layer.add(createTransitionAnimation(.transitionY, 0, height, animationTime / 3), forKey: "translation")
            break
        case .step2:
            ballStep = .step3
            ivBall.frame.origin.y = height
            ivBall.layer.add(createTransitionAnimation(.transitionX, 0, -(view.bounds.width - ivBall.bounds.width), animationTime * (view.bounds.width / view.bounds.height)), forKey: "translation")
            break
        case .step3:
            ballStep = .step4
            ivBall.frame.origin.x = 0
            ivBall.layer.add(createRotationAnimation(false), forKey: "rotation")
            ivBall.layer.add(createTransitionAnimation(.transitionY, 0, height, animationTime / 3), forKey: "translation")
            break
        case .step4:
            ballStep = .step5
            ivBall.frame.origin.y = height * 2
            ivBall.layer.add(createTransitionAnimation(.transitionX, 0, view.bounds.maxX - ivBall.bounds.width, animationTime * (view.bounds.width / view.bounds.height)), forKey: "translation")
            break
        case .step5:
            ballStep = .step6
            ivBall.frame.origin.x = view.bounds.maxX - ivBall.bounds.width
            ivBall.layer.add(createRotationAnimation(true), forKey: "rotation")
            ivBall.layer.add(createTransitionAnimation(.transitionY, 0, height, animationTime / 3), forKey: "translation")
            break
        case .step6:
            ballStep = .step7
            ivBall.frame.origin.y = height * 3
            ivBall.layer.add(createTransitionAnimation(.transitionX, 0, -(view.bounds.width - ivBall.bounds.width), animationTime * (view.bounds.width / view.bounds.height)), forKey: "translation")
            break
        case .step7:
            ballStep = .step8
            ivBall.frame.origin.x = 0
            ivBall.layer.add(createTransitionAnimation(.transitionY, 0, -(view.bounds.height - ivBall.bounds.height), animationTime), forKey: "translation")
            break
        default:
            ballStep = .step1
            ivBall.frame.origin.x = 0
            ivBall.frame.origin.y = 0
            ivBall.layer.removeAllAnimations()
            
            UIView.animate(withDuration: 0.5) { [self] in
                btnStart.alpha = 1
                btnBack.alpha = 1
            }
            break
        }
    }
}
