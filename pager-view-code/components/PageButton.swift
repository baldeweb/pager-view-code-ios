//
//  PageButton.swift
//  pager-view-code
//
//  Created by Wallace on 03/11/21.
//

import Foundation
import UIKit

class PageButton: Button {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func build(context: UIViewController, title: String, selector: Selector) -> UIButton {
        super.build(context: context, title: title, selector: selector)
        button?.setTitleColor(.blue, for: .normal)
        button?.backgroundColor = .white
        return button!
    }
}
