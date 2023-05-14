//
//  RectAnimationViewController.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 12/05/2023.
//

import UIKit

class RectAnimationViewController: UIViewController {
    @IBOutlet weak var ivBall: UIImageView!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var ballState: RectBallState = .translateToBottom
    // Time to ball transition from top to bottom of screen in seconds
    let animationTime = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onBackClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func onStartAnimation(_ sender: Any) {
        runAnimations()
    }
    
    private func runAnimations() {
        UIView.animate(withDuration: 0.5) { [self] in
            btnStart.alpha = 0
            btnBack.alpha = 0
        }
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.repeatCount = .infinity
        animation.fromValue = 0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.toValue = Float.pi * 2
        animation.duration = animationTime / 8
        ivBall.layer.add(animation, forKey: "rotation")
        
        ivBall.layer.add(createTransitionAnimation(.transitionY, 0, view.bounds.maxY - ivBall.bounds.height, animationTime), forKey: "translation")
    }
    
    private func createTransitionAnimation(_ transitionState: TransitionState, _ from: Float, _ to: CGFloat, _ duration: Double) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: transitionState == .transitionX ? "transform.translation.x" : "transform.translation.y")
        animation.fromValue = from
        animation.toValue = to
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.duration = duration
        animation.delegate = self
        return animation
    }
}

extension RectAnimationViewController : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        switch(ballState) {
        case .translateToBottom:
            ivBall.frame.origin.y = view.bounds.maxY - ivBall.bounds.height
            ballState = .translateToRight
            ivBall.layer.add(createTransitionAnimation(.transitionX, 0, view.bounds.maxX - ivBall.bounds.width, animationTime * (view.bounds.width / view.bounds.height)), forKey: "translation")
            break
        case .translateToRight:
            ballState = .translateToTop
            ivBall.frame.origin.x = view.bounds.maxX - ivBall.bounds.width
            ivBall.layer.add(createTransitionAnimation(.transitionY, 0, -(view.bounds.maxY - ivBall.bounds.height), animationTime), forKey: "translation")
            break
        case .translateToTop:
            ballState = .translateToLeft
            ivBall.frame.origin.y = 0
            ivBall.layer.add(createTransitionAnimation(.transitionX, 0, -(view.bounds.maxX - ivBall.bounds.width), animationTime * (view.bounds.width / view.bounds.height)), forKey: "translation")
            break
        default:
            UIView.animate(withDuration: 0.5) { [self] in
                btnStart.alpha = 1
                btnBack.alpha = 1
            }
            ballState = .translateToBottom
            ivBall.frame.origin.x = 0
            ivBall.layer.removeAllAnimations()
            break
        }
    }
}
