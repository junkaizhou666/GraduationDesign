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
    private var scrollView: UIScrollView!
    private var contentStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupNavBar()
        setupScrollView()
        setupContentStackView()
        setupSection(labelTitle: "我的收藏", buttons: MyCollection().myCollection)
        setupSection(labelTitle: "最新上线", buttons: LatestRelease().latestRelease)
        setupSection(labelTitle: "一站学工", buttons: StudentsWork().studentsWork)
        setupSection(labelTitle: "在线学习", buttons: OnlineLearning().onlineLearning)
        setupSection(labelTitle: "网络信息服务申请", buttons: NetWorkInformation().networkInformation)
        setupSection(labelTitle: "校园生活", buttons: CampusLife().campusLife)
        setupSection(labelTitle: "我的信息", buttons: MyInformation().myInformation)
        setupSection(labelTitle: "免登陆使用", buttons: NoLoginRequired().nologinRequired)
        setupSection(labelTitle: "版本信息", buttons: VersionInformation().versionInformation)
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
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(customNavBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }

    private func setupContentStackView() {
        contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 10
        scrollView.addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupSection(labelTitle: String, buttons: ButtonStackStruct) {
        let sectionStackView = ButtonStackView(buttons: buttons, labelTitle: labelTitle)
        contentStackView.addArrangedSubview(sectionStackView)
    }
}
