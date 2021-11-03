//
//  UIUtil.swift
//  pager-view-code
//
//  Created by Wallace on 03/11/21.
//

import Foundation
import UIKit

func hexStringToUIColor(hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func animateDismissView(viewTarget: UIView, alpha: Double, animateCompletion: @escaping () -> Void, animateExecution: @escaping () -> Void) {
    viewTarget.alpha = alpha
    UIView.animate(withDuration: 0.4) {
        viewTarget.alpha = 0
    } completion: { _ in
        //  self.dismiss(animated: false)
        animateCompletion()
    }
    
    UIView.animate(withDuration: 0.3) {
//        self.containerViewBottomConstraint?.constant = self.defaultWidth
//        self.view.layoutIfNeeded()
        animateExecution()
    }
}

extension UIViewController {
    func embed(_ view: UIView, _ viewController: UIViewController){
        viewController.willMove(toParent: self)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        self.addChild(viewController)
        viewController.didMove(toParent: self)
    }
}
