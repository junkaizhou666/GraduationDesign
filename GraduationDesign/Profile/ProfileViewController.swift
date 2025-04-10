//
//  ProfileViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController{
    
    private var statusBarView: UIView!
    private var customNavBar: CustomNavigationBar!
    private var scrollView: UIScrollView!
    private var buttonStackView: ButtonStackView!
    private var headViewController: HeadViewController!
    private var contentStackView: UIStackView!
    private var searchBar: SearchBarViewControllers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupNavBar()
        setupScrollView()
        setupHeadView()
        setupSearchBar()
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
        customNavBar.setTitle("个人中心")
        customNavBar.setLeftButtonTitle("设置", titleColor: .white) {
            print("设置按钮点击")
        }
        customNavBar.setRightButtonTitle("消息", titleColor: .white) {
            print("消息按钮点击")
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
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupHeadView() {
        headViewController = HeadViewController()
        scrollView.addSubview(headViewController.view)
        headViewController.view.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(-13)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(100)
        }
    }

    private func setupSearchBar() {
        searchBar = SearchBarViewControllers()
        addChild(searchBar)
        scrollView.addSubview(searchBar.view)
        searchBar.view.snp.makeConstraints { make in
            make.top.equalTo(headViewController.view.snp.bottom).offset(10)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.height.equalTo(30)
        }
    }

    private func setupContentStackView() {
        contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 10
        scrollView.addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.view.snp.bottom)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.width.equalTo(scrollView.snp.width)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
    
    private func setupSection(labelTitle: String, buttons: ButtonStackStruct) {
        let sectionStackView = ButtonStackView(buttons: buttons, labelTitle: labelTitle)
        contentStackView.addArrangedSubview(sectionStackView)
    }
}
