//
//  PagerViewController.swift
//  pager-view-code
//
//  Created by Wallace on 03/11/21.
//

import UIKit

class PagerViewController: UIViewController {
    
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.alpha = maxDimmedAlpha
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    open lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
        
    private let maxDimmedAlpha: CGFloat = 0.6
    
    open var pages: Array<PageModel>?
    
    init(pages: Array<PageModel>) {
        super.init(nibName: nil, bundle: nil)
        self.pages = pages
        print("LOG >> PagerViewController >> init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LOG >> PagerViewController >> viewDidLoad")
        
        setupConstraints()
        animatePresentContainer()
        setupPanGestureInteraction()
        setupPages()
    }
    
    func setupConstraints() {
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        
        dimmedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.margins.equalTo(20)
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    private func setupPages() {
        print("LOG >> PagerViewController >> setupPages")
        for page in (pages ?? Array<PageModel>()) {
            let dialog = PageViewController(
                containerView: containerView,
                icon: page.icon,
                titlePage: page.title,
                titleButton: page.titleButton,
                actionButton: page.actionButton
            )!
            dialog.modalPresentationStyle = .fullScreen
            self.present(dialog, animated: false)
        }
    }
    
    func animatePresentContainer() {
        UIView.animate(withDuration: 0.3) {
            self.containerView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    func setupPanGestureInteraction() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        //  TODO: Wallace >> gesto para troca de slides
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
}

