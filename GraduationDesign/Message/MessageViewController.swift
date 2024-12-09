//
//  MessageViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class MessageViewController: UIViewController {
    
    private var statusBarView: UIView!
    private var customNavBar: CustomNavigationBar!
    private var buttonStackView: MessageButtonStack!
    private var informationVC: InformationViewController!
    private var topBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupNavBar()
        setupButtonStackView()
        setupInformationVC()
    }
    
    private func setupStatusBar() {
        statusBarView = UIView()
        statusBarView.backgroundColor = UIColor(named: "NavBar")
        view.addSubview(statusBarView)
        
        statusBarView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupNavBar() {
        customNavBar = CustomNavigationBar()
        customNavBar.navigationBar.barTintColor = UIColor(named: "NavBar")
        customNavBar.navigationBar.isTranslucent = false
        customNavBar.hideLeftButton()
        customNavBar.setTitle("综合信息")
        customNavBar.setRightButtonTitle("通知", titleColor: .white) {
            // 右侧按钮点击事件
            print("右侧按钮点击")
        }
        view.addSubview(customNavBar)
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarView.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func setupButtonStackView() {
        let buttonModel = ButtonModel()
        self.buttonStackView = MessageButtonStack(buttons: buttonModel.buttonModel)
        
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(customNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    private func setupInformationVC() {
        informationVC = InformationViewController()
        addChild(informationVC)
        view.addSubview(informationVC.view)
        informationVC.didMove(toParent: self)
        informationVC.view.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
    }
}

