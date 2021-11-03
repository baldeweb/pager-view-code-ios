//
//  Button.swift
//  pager-view-code
//
//  Created by Wallace on 03/11/21.
//

import Foundation
import UIKit

open class Button: UIButton {
    
    var button: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button = UIButton(frame: frame)
    }
    
    func build(context: UIViewController, title: String, selector: Selector) -> UIButton {
        button?.setTitle(title, for: .normal)
        button?.layer.cornerRadius = 25
        button?.layer.masksToBounds = true
        button?.addTarget(context, action: selector, for: .touchUpInside)
        return button!
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
