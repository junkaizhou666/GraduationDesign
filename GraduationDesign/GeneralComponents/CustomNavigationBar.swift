//
//  CustomNavigationBar.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class CustomNavigationBar: UIView {
    
    // MARK: - UI Elements
    private let titleLabel = UILabel()
    private var leftBarButton: UIBarButtonItem?
    private var rightBarButton: UIBarButtonItem?
    let navigationBar = UINavigationBar()
    
    // MARK: - Properties
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup UI
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // Setup UINavigationBar
        addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(44)
        }

        let navigationItem = UINavigationItem()

        titleLabel.text = "Title"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        let titleView = UIView()
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        navigationItem.titleView = titleView

        navigationBar.setItems([navigationItem], animated: false)
    }
    
    // MARK: - Public Methods
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setLeftButtonTitle(_ title: String, titleColor: UIColor ,action: @escaping () -> Void) {
        leftButtonAction = action
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        button.setTitleColor(titleColor, for: .normal)
        leftBarButton = UIBarButtonItem(customView: button)
        updateNavigationItem()
    }
    
    func setRightButtonTitle(_ title: String, titleColor: UIColor, action: @escaping () -> Void) {
        rightButtonAction = action
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        button.setTitleColor(titleColor, for: .normal)
        rightBarButton = UIBarButtonItem(customView: button)
        updateNavigationItem()
    }
    
    func hideLeftButton() {
        leftBarButton = nil
        updateNavigationItem()
    }
    
    func hideRightButton() {
        rightBarButton = nil
        updateNavigationItem()
    }
    
    // MARK: - Button Actions
    @objc private func leftButtonTapped() {
        leftButtonAction?()
    }
    
    @objc private func rightButtonTapped() {
        rightButtonAction?()
    }
    
    // MARK: - Private Methods
    private func updateNavigationItem() {
        if let navigationItem = navigationBar.items?.first {
            navigationItem.leftBarButtonItem = leftBarButton
            navigationItem.rightBarButtonItem = rightBarButton
        }
    }
}
