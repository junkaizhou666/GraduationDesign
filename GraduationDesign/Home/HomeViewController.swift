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
    private var scrollView: UIScrollView!
    private var homeNavButtonView: HomeNavButtonView!
    private var navDropdownMenuView: NavDropdownMenuView!
    var imageUpPageVC: ImageUpPageViewController!
    private var cphsNavBar: TableNavBar!
    private var imagesBottomPageVC: ImageBottomPageViewController!
    private var comprehensiveTableView: SettingComprehensiveTableView!
    private var noticeNavBar: TableNavBar!
    private var noticeTableView: SettingNoticeTableIView!
    private var mediaNavBar: TableNavBar!
    private var mediaTableView: SettingNoticeTableIView!
    private var scienceNavBar: TableNavBar!
    private var scienceTableView: SettingScienceTableView!
    private var academicNavBar: TableNavBar!
    private var academicTableView: SettingTalentTableView!
    private var talentNavBar: TableNavBar!
    private var talentTableView: SettingTalentTableView!
    private var examinationNavBar: TableNavBar!
    private var examinationCollectionVC: ExaminationViewController!
    private var allMediaNavBar: TableNavBar!
    private var allMediaTableView: SettingAllMediaTableView!
    private var zzuliNavBar: TableNavBar!
    private var zzuliCollectionVC: ZZULIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupAboveNavBar()
        setupScrollView()
        setupHomeNavButtonView()
        showImageUpPageViewController()
        setupTableNavBar()
        showImageBottomPageViewController()
        setupComprehensiveTableView()
        setupNoticeNavBar()
        setupNoticeTableView()
        setupMediaNavBar()
        setupMediaTableView()
        setupScienceNavBar()
        setupScienceTableView()
        setupAcademicNavBar()
        setupAcademicTableView()
        setupTalentNavBar()
        setupTalentTableView()
        setupExaminationNavBar()
        setupExaminationCollectionVC()
        setupAllMediaNavBar()
        setupAllMediaTableView()
        setupZZULINavBar()
        setupZZULICollectionVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.layoutIfNeeded() // 触发布局刷新
        print("scrollView.contentSize: \(scrollView.contentSize)")
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
            make.height.equalTo(44)
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
            make.top.equalTo(aboveCustomNavBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setupHomeNavButtonView() {
        homeNavButtonView = HomeNavButtonView()
        homeNavButtonView.onButtonTapped = { [weak self] in
            self?.didTapHomeNavButton()
        }
        scrollView.addSubview(homeNavButtonView!)
        homeNavButtonView!.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }

    private func showImageUpPageViewController() {
        imageUpPageVC = ImageUpPageViewController()
        addChild(imageUpPageVC)
        scrollView.addSubview(imageUpPageVC.view)
        
        imageUpPageVC.view.snp.makeConstraints { make in
            make.top.equalTo(homeNavButtonView!.snp.bottom)
            make.left.right.width.equalToSuperview()
            make.height.equalTo(110)
        }
        imageUpPageVC.didMove(toParent: self)
    }
    
    private func setupTableNavBar() {
        cphsNavBar = TableNavBar()
        cphsNavBar.setTitle("综合要闻")
        scrollView.addSubview(cphsNavBar)
        
        cphsNavBar.snp.makeConstraints { make in
            make.top.equalTo(imageUpPageVC.view.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        cphsNavBar.moreButtonAction = {
            print("综合要闻更多按钮被点击")
        }
    }
    
    private func showImageBottomPageViewController() {
        imagesBottomPageVC = ImageBottomPageViewController()
        
        addChild(imagesBottomPageVC)
        scrollView.addSubview(imagesBottomPageVC.view)
        
        imagesBottomPageVC.view.snp.makeConstraints { make in
            make.top.equalTo(cphsNavBar.snp.bottom)
            make.left.equalTo(scrollView.snp.left)
            make.right.equalTo(scrollView.snp.right)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(210)
        }
    }
    
    private func setupComprehensiveTableView() {
        comprehensiveTableView = SettingComprehensiveTableView(frame: CGRect.zero)
        scrollView.addSubview(comprehensiveTableView)
        
        comprehensiveTableView.snp.makeConstraints { make in
            make.top.equalTo(imagesBottomPageVC.view.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(220)
        }
        
        let model = NoticeModel()
        comprehensiveTableView.setData(model.noticeModel)
    }
    
    private func setupNoticeNavBar() {
        noticeNavBar = TableNavBar()
        noticeNavBar.setTitle("通知公告")
        scrollView.addSubview(noticeNavBar)
        
        noticeNavBar.snp.makeConstraints { make in
            make.top.equalTo(comprehensiveTableView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        noticeNavBar.moreButtonAction = {
            print("通知公告更多按钮被点击")
        }
    }
    
    private func setupNoticeTableView() {
        noticeTableView = SettingNoticeTableIView(frame: CGRect.zero)
        scrollView.addSubview(noticeTableView)
        
        noticeTableView.snp.makeConstraints { make in
            make.top.equalTo(noticeNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        let model = NoticeModel()
        noticeTableView.setData(model.noticeModel)
    }
    
    private func setupMediaNavBar() {
        mediaNavBar = TableNavBar()
        mediaNavBar.setTitle("媒体轻大")
        scrollView.addSubview(mediaNavBar)
        
        mediaNavBar.snp.makeConstraints { make in
            make.top.equalTo(noticeTableView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        mediaNavBar.moreButtonAction = {
            print("媒体轻大更多按钮被点击")
        }
    }
    
    private func setupMediaTableView() {
        mediaTableView = SettingNoticeTableIView(frame: CGRect.zero)
        scrollView.addSubview(mediaTableView)
        
        mediaTableView.snp.makeConstraints { make in
            make.top.equalTo(mediaNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        let model = NoticeModel()
        mediaTableView.setData(model.noticeModel)
    }
    
    private func setupScienceNavBar() {
        scienceNavBar = TableNavBar()
        scienceNavBar.setTitle("科学研究")
        scrollView.addSubview(scienceNavBar)
        
        scienceNavBar.snp.makeConstraints { make in
            make.top.equalTo(mediaTableView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        scienceNavBar.moreButtonAction = {
            print("科学研究更多按钮被点击")
        }
    }
    
    private func setupScienceTableView() {
        scienceTableView = SettingScienceTableView(frame: CGRect.zero)
        scrollView.addSubview(scienceTableView)
        
        scienceTableView.snp.makeConstraints { make in
            make.top.equalTo(scienceNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(2100)
        }
        
        let model = ScienceModel()
        scienceTableView.setData(model.scienceModel)
    }
    
    private func setupAcademicNavBar() {
        academicNavBar = TableNavBar()
        academicNavBar.backgroundColor = UIColor(named: "TalentTableBG")
        academicNavBar.setTitle("学术信息")
        scrollView.addSubview(academicNavBar)
        
        academicNavBar.snp.makeConstraints { make in
            make.top.equalTo(scienceTableView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func setupAcademicTableView() {
        academicTableView = SettingTalentTableView(frame: CGRect.zero)
        scrollView.addSubview(academicTableView)
        
        academicTableView.snp.makeConstraints { make in
            make.top.equalTo(academicNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(275)
        }
        
        let model = NoticeModel()
        academicTableView.setData(model.noticeModel)
    }
    
    private func setupTalentNavBar() {
        talentNavBar = TableNavBar()
        talentNavBar.backgroundColor = UIColor(named: "TalentTableBG")
        talentNavBar.setTitle("人才培养")
        scrollView.addSubview(talentNavBar)
        
        talentNavBar.snp.makeConstraints { make in
            make.top.equalTo(academicTableView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func setupTalentTableView() {
        talentTableView = SettingTalentTableView(frame: CGRect.zero)
        scrollView.addSubview(talentTableView)
        
        talentTableView.snp.makeConstraints { make in
            make.top.equalTo(talentNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(275)
        }
        
        let model = NoticeModel()
        talentTableView.setData(model.noticeModel)
    }
    
    private func setupExaminationNavBar() {
        examinationNavBar = TableNavBar()
        examinationNavBar.backgroundColor = UIColor(named: "TalentTableBG")
        examinationNavBar.setTitle("报考轻大")
        scrollView.addSubview(examinationNavBar)
        
        examinationNavBar.snp.makeConstraints { make in
            make.top.equalTo(talentTableView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func setupExaminationCollectionVC() {
        examinationCollectionVC = ExaminationViewController()
        addChild(examinationCollectionVC)
        scrollView.addSubview(examinationCollectionVC.view)
        
        examinationCollectionVC.view.snp.makeConstraints { make in
            make.top.equalTo(examinationNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
        examinationCollectionVC.didMove(toParent: self)
    }
    
    private func setupAllMediaNavBar() {
        allMediaNavBar = TableNavBar()
        allMediaNavBar.setTitle("全媒轻大")
        scrollView.addSubview(allMediaNavBar)
        
        allMediaNavBar.snp.makeConstraints { make in
            make.top.equalTo(examinationCollectionVC.view.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func setupAllMediaTableView() {
        allMediaTableView = SettingAllMediaTableView(frame: CGRect.zero)
        scrollView.addSubview(allMediaTableView)
        
        allMediaTableView.snp.makeConstraints { make in
            make.top.equalTo(allMediaNavBar.snp.bottom)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(1095)
        }
        
        let model = AllMediaModel()
        allMediaTableView.setData(model.allMediaModel)
    }
    
    private func setupZZULINavBar() {
        zzuliNavBar = TableNavBar()
        zzuliNavBar.setTitle("轻大专题")
        scrollView.addSubview(zzuliNavBar)
        
        zzuliNavBar.snp.makeConstraints { make in
            make.top.equalTo(allMediaTableView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func setupZZULICollectionVC() {
        zzuliCollectionVC = ZZULIViewController()
        addChild(zzuliCollectionVC)
        scrollView.addSubview(zzuliCollectionVC.view)
        
        zzuliCollectionVC.view.snp.makeConstraints { make in
            make.top.equalTo(zzuliNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        zzuliCollectionVC.didMove(toParent: self)
    }
    
    private var isNavTableViewVisible = false
    private var navMenuModel = NavDropdownMenuModel().navModel
    
    private func didTapHomeNavButton() {
        if isNavTableViewVisible {
            navDropdownMenuView.removeFromSuperview()
            navDropdownMenuView = nil
            isNavTableViewVisible = false
            
            imageUpPageVC.view.snp.remakeConstraints { make in
                make.top.equalTo(homeNavButtonView!.snp.bottom)
                make.left.right.width.equalToSuperview()
                make.height.equalTo(110)
            }
        } else {
            if navDropdownMenuView == nil {
                navDropdownMenuView = NavDropdownMenuView(data: navMenuModel)
                scrollView.addSubview(navDropdownMenuView!)
                
                navDropdownMenuView?.snp.makeConstraints { make in
                    make.top.equalTo(homeNavButtonView!.snp.bottom)
                    make.left.right.width.equalToSuperview()
                    make.height.equalTo(400)
                }
                
                imageUpPageVC.view.snp.remakeConstraints { make in
                    make.top.equalTo(navDropdownMenuView!.snp.bottom)
                    make.left.right.width.equalToSuperview()
                    make.height.equalTo(110)
                }
            }
            isNavTableViewVisible = true
        }
    }
    
    
}
