//
//  ServiceViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class ServiceViewController: UIViewController {
    private var statusBarView: UIView!
    private var customNavBar: CustomNavigationBar!
    private var contactListVC: ContactListViewController!
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupNavBar()
        setupScrollView()
        setupContactListVC()
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
        customNavBar.setTitle("通讯录")
        customNavBar.setRightButtonTitle("搜索", titleColor: .white) {
            print("搜索按钮点击")
        }
        view.addSubview(customNavBar)
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
//    private func setupScrollView() {
//        scrollView = UIScrollView()
//        scrollView.isUserInteractionEnabled = true
//        scrollView.isScrollEnabled = true
//        scrollView.alwaysBounceVertical = true
//        scrollView.backgroundColor = .red
//        view.addSubview(scrollView)
//
//        scrollView.snp.makeConstraints { make in
//            make.top.equalTo(customNavBar.snp.bottom)
//            make.left.right.bottom.equalToSuperview()
//        }
//    }

    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(customNavBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }

        contentView = UIView()
        scrollView.addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
    }
    
    private func setupContactListVC() {
        contactListVC = ContactListViewController()
        addChild(contactListVC)
        contentView.addSubview(contactListVC.view)

        contactListVC.view.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(2000)
            make.bottom.equalToSuperview()
        }

        contactListVC.didMove(toParent: self)
    }

}
