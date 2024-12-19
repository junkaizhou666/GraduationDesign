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
    private var homeNavButtonVC: HomeNavButtonVC!
    private var navDropdownMenuVC: DropdownMenuViewController!
    private var imageUpPageVC: ImageUpPageViewController!
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
        setupHomeNavBauttonVC()
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
        setupZZULIConllectionVC()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 从 UserDefaults 中读取之前保存的状态
        if let savedMenuVisible = UserDefaults.standard.value(forKey: "isDropdownMenuVisible") as? Bool {
            isDropdownMenuVisible = savedMenuVisible
        }

        // 如果菜单已经存在且没有显示，重新加载菜单并显示
        if didTapBackButton {
            // 使用 viewDidAppear 来确保视图已加载到窗口中
            DispatchQueue.main.async {
                self.handleNavButtonTapped()  // 调用展示菜单的逻辑
            }
            didTapBackButton = false // 重置状态
        } else {
            print("没有点击按钮")
        }
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
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(aboveCustomNavBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000000)
        scrollView.layoutIfNeeded()
    }
    
    private func setupHomeNavBauttonVC() {
        homeNavButtonVC = HomeNavButtonVC()
        addChild(homeNavButtonVC)
        scrollView.addSubview(homeNavButtonVC.view)
        
        homeNavButtonVC.view.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(-14)
            make.left.right.width.equalToSuperview()
            make.height.equalTo(40)
        }
        homeNavButtonVC.didMove(toParent: self)
        
        // 设置闭包处理按钮点击事件
        homeNavButtonVC.onNavButtonTapped = { [weak self] in
            self?.handleNavButtonTapped()
        }
    }
    
    private func showImageUpPageViewController() {
        imageUpPageVC = ImageUpPageViewController()
        
        addChild(imageUpPageVC)
        scrollView.addSubview(imageUpPageVC.view)
        
        imageUpPageVC.view.snp.makeConstraints { make in
            make.top.equalTo(homeNavButtonVC.view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.width.equalTo(view.snp.width)
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
    
    private func setupZZULIConllectionVC() {
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
    
    private var isDropdownMenuVisible = false

    private func handleNavButtonTapped() {
        let menuHeight: CGFloat = 450  // 菜单的高度

        // 检查 view 是否已经在窗口中
        guard self.view.window != nil else {
            return
        }
        
        if isDropdownMenuVisible {
            // 隐藏菜单
            navDropdownMenuVC?.reloadMenu()
            UIView.animate(withDuration: 0.3, animations: {
                self.navDropdownMenuVC?.view.alpha = 0
            }) { _ in
                self.navDropdownMenuVC?.view.removeFromSuperview()
                self.navDropdownMenuVC = nil // 清除对旧视图控制器的引用
                self.isDropdownMenuVisible = false
                
                // 更新视图高度，恢复布局
                UIView.animate(withDuration: 0.3) {
                    self.imageUpPageVC.view.snp.updateConstraints { make in
                        make.top.equalTo(self.homeNavButtonVC.view.snp.bottom)
                    }
                    self.view.layoutIfNeeded()
                }
            }
        } else {
            let menuVC = DropdownMenuViewController()

            let navModel = NavDropdownMenuModel()
            menuVC.navDropdownMenuModel = navModel.navModel
            
            // 设置点击事件
            menuVC.onItemSelected = { [weak self] selectedItem in
                
                // 隐藏菜单
                self?.navDropdownMenuVC?.view.removeFromSuperview()
                self?.navDropdownMenuVC = nil
                self?.isDropdownMenuVisible = false
                
                // 根据选项跳转
                self?.navigateToPage(id: selectedItem.id, title: selectedItem.title)
            }
            
            // 添加菜单到父视图
            self.addChild(menuVC)
            guard self.view.window != nil else {
                return
            }
            view.addSubview(menuVC.view)
            
            // 强制更新视图层级，再进行布局
            self.view.layoutIfNeeded()
            
            // 设置约束
            menuVC.view.snp.makeConstraints { make in
                make.top.equalTo(homeNavButtonVC.view.snp.bottom)
                make.left.right.equalToSuperview()
                make.height.equalTo(menuHeight)
            }
            
            // 显示菜单动画
            menuVC.view.alpha = 0
            UIView.animate(withDuration: 0.3) {
                menuVC.view.alpha = 1
            }
            
            // 保存菜单视图控制器
            navDropdownMenuVC = menuVC
            self.isDropdownMenuVisible = true
            
            // 在数据加载后，刷新菜单
            menuVC.reloadMenu()
            
            // 更新页面布局
            UIView.animate(withDuration: 0.3) { [self] in
                self.imageUpPageVC.view.snp.updateConstraints { make in
                    make.top.equalTo(homeNavButtonVC.view.snp.bottom).offset(menuHeight)
                }
                self.view.layoutIfNeeded()
            }
        }
        // 调用子控制器的菜单切换方法
    }
    
    private var didTapBackButton = false
    
    private func navigateToPage(id: Int, title: String) {
        let detailVC = UIViewController()
        detailVC.view.backgroundColor = .white
        detailVC.title = title

        // 根据id来决定具体的页面或内容
        switch id {
        case 0:
            detailVC.view.backgroundColor = .blue
        case 1:
            detailVC.view.backgroundColor = .green
        case 2:
            detailVC.view.backgroundColor = .yellow
        case 3:
            detailVC.view.backgroundColor = .red
        default:
            detailVC.view.backgroundColor = .white
        }
        
        // 设置自定义返回按钮
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBackButton))
        detailVC.navigationItem.leftBarButtonItem = backButton
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

    @objc func handleBackButton() {

        didTapBackButton = true
        navigationController?.popViewController(animated: true)
    }

}
