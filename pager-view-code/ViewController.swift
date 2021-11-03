//
//  ViewController.swift
//  pager-view-code
//
//  Created by Wallace on 03/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var listPages = Array<PageModel>()
        
        var pageModel1 = PageModel()
        pageModel1.icon = UIImage(named: "icon_alert")
        pageModel1.title = "Titulo 1"
        pageModel1.description = "Lorem ipsum dolor sit amet"
        pageModel1.titleButton = "Botao 1"
        pageModel1.actionButton = { print("BOTAO 1") }
        
        /*var pageModel2 = PageModel()
        pageModel2.icon = UIImage(named: "icon_alert")
        pageModel2.title = "Titulo 2"
        pageModel2.description = "Lorem ipsum dolor sit amet"
        pageModel2.titleButton = "Botao 2"
        pageModel2.actionButton = { print("BOTAO 2") }
        
        var pageModel3 = PageModel()
        pageModel3.icon = UIImage(named: "icon_alert")
        pageModel3.title = "Titulo 3"
        pageModel3.description = "Lorem ipsum dolor sit amet"
        pageModel3.titleButton = "Botao 3"
        pageModel3.actionButton = { print("BOTAO 3") }*/
        
        listPages.append(pageModel1)
        /*listPages.append(pageModel2)
        listPages.append(pageModel3)*/
        
        let pagination = PagerViewController(pages: listPages)
        pagination.pages = listPages
        pagination.modalPresentationStyle = .fullScreen
        self.present(pagination, animated: false)
    }
}

