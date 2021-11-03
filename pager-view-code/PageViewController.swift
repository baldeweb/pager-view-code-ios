//
//  PageViewController.swift
//  pager-view-code
//
//  Created by Wallace on 03/11/21.
//

import UIKit
import SnapKit

class PageViewController: UIViewController {
    
    open lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    open lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    open lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var containerDotsPagination: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 6.0
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonAction = UIButton()
    open var image: UIImageView!
    open var icon: UIImage!
    
    open var containerView: UIView!
    open var titlePage: String! = ""
    private var titleButton: String! = ""
    private var actionButton: (() -> Void)?
    
    init?(
        containerView: UIView,
        icon: UIImage,
        titlePage: String,
        titleButton: String,
        actionButton: (() -> Void)?
    ) {
        super.init(nibName: nil, bundle: nil)
        self.containerView = containerView
        self.icon = icon
        self.titlePage = titlePage
        self.titleButton = titleButton
        self.actionButton = actionButton
        print("LOG >> PageViewController >> init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        print("LOG >> PageViewController >> viewDidLoad")
    }
    
    private func setupView() {
        self.buttonAction = PageButton(frame: .zero).build(
            context: self,
            title: titleButton,
            selector: #selector(actionButtonPressed)
        )
    }
    
    @objc private func actionButtonPressed(sender: UIButton!) {
        actionButton!()
    }
    
    private func setupConstraints() {
        image = UIImageView(image: icon)
        self.containerView.addSubview(image)
        contentStackView.addArrangedSubview(image)
        
        self.titleLabel.text = titlePage
        contentStackView.addArrangedSubview(titleLabel)
        
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addArrangedSubview(containerDotsPagination)
        contentStackView.addArrangedSubview(buttonAction)
        
        containerView.addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.margins.equalTo(30)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(image.snp.bottomMargin).inset(40)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().offset(20)
            make.height.greaterThanOrEqualTo(0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(titleLabel.snp.bottomMargin).inset(8)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().offset(20)
            make.height.greaterThanOrEqualTo(0)
        }
        
        containerDotsPagination.snp.makeConstraints { make in
            make.topMargin.equalTo(descriptionLabel.snp.bottomMargin).inset(8)
            make.leading.equalTo(self.containerView).offset(20)
            make.trailing.equalTo(self.containerView).inset(20)
            make.height.equalTo(40)
        }
        
        buttonAction.snp.makeConstraints { make in
            make.topMargin.equalTo(containerDotsPagination.snp.bottomMargin).inset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottomMargin.equalToSuperview()
        }
    }
    
}
