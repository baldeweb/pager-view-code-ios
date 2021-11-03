//
//  PageModel.swift
//  pager-view-code
//
//  Created by Wallace on 03/11/21.
//

import Foundation
import UIKit

struct PageModel {
    var icon: UIImage!
    var title: String!
    var description: String!
    var titleButton: String!
    var actionButton: (() -> Void)?
}
