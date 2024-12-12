//
//  HomeViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var statusBarView: UIView!
    private var aboveCustomNavBar: CustomNavigationBar!
    private var lowerCustomNavBar: CustomNavigationBar!
    private var imageUpPageVC: ImageUpPageViewController!
    private var tableNavBar: TableNavBar!
    private var imagesBottomPageVC: ImageBottomPageViewController!
    private var comprehensiveTableView: SettingComprehensiveTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupAboveNavBar()
        setuplowerNavBar()
        showImageUpPageViewController()
        setupTableNavBar()
        showImageBottomPageViewController()
        setupComprehensiveTableView()
    }
    
    private func setupStatusBar() {
        statusBarView = UIView()
        statusBarView.backgroundColor = UIColor(named: "NavBar")
        view.addSubview(statusBarView)
        
        statusBarView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupAboveNavBar() {
        aboveCustomNavBar = CustomNavigationBar()
        aboveCustomNavBar.navigationBar.barTintColor = UIColor(named: "NavBar")
        aboveCustomNavBar.navigationBar.isTranslucent = false
        aboveCustomNavBar.hideLeftButton()
        aboveCustomNavBar.setTitle("首页")
        aboveCustomNavBar.setRightButtonTitle("扫一扫", titleColor: .white) {
            print("扫一扫点击")
        }
        view.addSubview(aboveCustomNavBar)
        
        aboveCustomNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarView.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func setuplowerNavBar() {
        lowerCustomNavBar = CustomNavigationBar()
        lowerCustomNavBar.navigationBar.barTintColor = .white
        lowerCustomNavBar.navigationBar.isTranslucent = false
        lowerCustomNavBar.setTitle("")
        lowerCustomNavBar.setLeftButtonTitle("导航", titleColor: .black) {
            print("导航点击")
        }
        lowerCustomNavBar.setRightButtonTitle("更多", titleColor: .black) {
            print("更多点击")
        }
        view.addSubview(lowerCustomNavBar)
        
        lowerCustomNavBar.snp.makeConstraints { make in
            make.top.equalTo(aboveCustomNavBar.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func showImageUpPageViewController() {
        imageUpPageVC = ImageUpPageViewController()
        
        addChild(imageUpPageVC)
        view.addSubview(imageUpPageVC.view)
        
        imageUpPageVC.view.snp.makeConstraints { make in
            make.top.equalTo(lowerCustomNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(110)
        }
        imageUpPageVC.didMove(toParent: self)
    }

    private func setupTableNavBar() {
        tableNavBar = TableNavBar()
        tableNavBar.setTitle("综合要闻")
        view.addSubview(tableNavBar)
        
        tableNavBar.snp.makeConstraints { make in
            make.top.equalTo(imageUpPageVC.view.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func showImageBottomPageViewController() {
        imagesBottomPageVC = ImageBottomPageViewController()
        
        addChild(imagesBottomPageVC)
        view.addSubview(imagesBottomPageVC.view)
        
        imagesBottomPageVC.view.snp.makeConstraints { make in
            make.top.equalTo(tableNavBar.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(210)
        }
    }
    
    private func setupComprehensiveTableView() {
        comprehensiveTableView = SettingComprehensiveTableView(frame: CGRect.zero)
        view.addSubview(comprehensiveTableView)
        
        comprehensiveTableView.snp.makeConstraints { make in
            make.top.equalTo(imagesBottomPageVC.view.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(340)
        }
        
        let model = NoticeModel()
        comprehensiveTableView.setData(model.noticeModel)
    }
}
