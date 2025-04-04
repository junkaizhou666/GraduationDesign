//
//  ServiceViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit

class ServiceViewController: UIViewController {
    private var statusBarView: UIView!
    private var customNavBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupNavBar()
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
        customNavBar.setTitle("应用服务")
        customNavBar.setRightButtonTitle("搜索", titleColor: .white) {
            print("搜索按钮点击")
        }
        view.addSubview(customNavBar)
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarView.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    
}
