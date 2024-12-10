//
//  ProfileViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    private var statusBarView: UIView!
    private var customNavBar: CustomNavigationBar!
    private var buttonStackView: ButtonStackView!
    private var headView: HeadView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupNavBar()
        setupHeadView()
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
        customNavBar.setTitle("个人中心")
        customNavBar.setLeftButtonTitle("设置", titleColor: .white) {
            print("设置按钮点击")
        }
        customNavBar.setRightButtonTitle("消息", titleColor: .white) {
            // 右侧按钮点击事件
            print("消息按钮点击")
        }
        view.addSubview(customNavBar)
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarView.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func setupHeadView() {
        headView = HeadView()
        view.addSubview(headView)
        headView.snp.makeConstraints { make in
            make.top.equalTo(customNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
        }
    }
}
