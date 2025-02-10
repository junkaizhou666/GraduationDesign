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
    private var scrollView: UIScrollView!
    private var buttonStackView: MessageButtonStack!
    private var threeButtonVC: ThreeButtonViewController!
    private var twoButtonVC: TwoButtonViewController!
    private var topBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupNavBar()
        setupScrollView()
        setupButtonStackView()
        setupThreeButtonVC()
        setupTwoButtonVC()
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
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(customNavBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setupButtonStackView() {
        let buttonModel = ButtonModel()
        self.buttonStackView = MessageButtonStack(buttons: buttonModel.buttonModel)
        
        scrollView.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(100)
        }
    }
    
    private func setupThreeButtonVC() {
        threeButtonVC = ThreeButtonViewController()
        addChild(threeButtonVC)
        scrollView.addSubview(threeButtonVC.view)
        threeButtonVC.didMove(toParent: self)
        threeButtonVC.view.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(360)
        }
    }
    
    private func setupTwoButtonVC() {
        twoButtonVC = TwoButtonViewController()
        addChild(twoButtonVC)
        scrollView.addSubview(twoButtonVC.view)
        twoButtonVC.didMove(toParent: self)
        twoButtonVC.view.snp.makeConstraints { make in
            make.top.equalTo(threeButtonVC.view.snp.bottom)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(360)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
}

