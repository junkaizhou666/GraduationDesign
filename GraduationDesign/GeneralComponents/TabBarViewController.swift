//
//  TabBarViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarAppearance()
        setupViewControllers()
    }
    
    /// 配置 TabBar 的外观
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // 设置不透明背景
        appearance.backgroundColor = UIColor.white // TabBar 背景颜色
        
        // 设置未选中和选中状态下的样式
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.blue,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        
        // 适配 iOS 15+
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
            tabBar.standardAppearance = appearance
        } else {
            // iOS 14 以下设置方法
            tabBar.barTintColor = UIColor.black
        }
        
        tabBar.isTranslucent = false // 禁用透明效果
    }
    
    /// 添加子视图控制器
    private func setupViewControllers() {
        let homeVC = HomeViewController()
        addChildViewController(childViewController: homeVC, title: "首页")
        
        let messageVC = MessageViewController()
        addChildViewController(childViewController: messageVC, title: "综合信息")
        
        let serviceVC = ServiceViewController()
        addChildViewController(childViewController: serviceVC, title: "通讯录")
        
        let profileVC = ProfileViewController()
        addChildViewController(childViewController: profileVC, title: "个人中心")
    }

    
    /// 添加单个子视图控制器
    private func addChildViewController(childViewController: UIViewController, title: String?, image: UIImage? = nil, selectedImage: UIImage? = nil) {
        let navigationController = UINavigationController(rootViewController: childViewController)
        navigationController.setNavigationBarHidden(false, animated: true)
        
        let tabBarItem = navigationController.tabBarItem
        tabBarItem?.title = title
        tabBarItem?.image = image
        tabBarItem?.selectedImage = selectedImage

        // 针对没有标题的标签cameraRootVC，调整图标位置
        if title == nil {
            tabBarItem?.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        }
        
        addChild(navigationController)
    }


}
