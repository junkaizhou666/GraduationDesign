//
//  ThreeButtonViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/2/10.
//

import UIKit
import SnapKit

class ThreeButtonViewController: UIViewController {

    // 创建按钮
    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    
    // 创建UITableView
    private var messageTableView: SettingMessageTableView?
    
    // 数据源
    private var dataSourse1: [Model] = NoticeModel().noticeModel
    private var dataSourse2: [Model] = NoticeModel().noticeModel2
    private var dataSourse3: [Model] = NoticeModel().noticeModel3
    
    // 创建查看更多按钮
    private let loadMoreButton = UIButton()
    
    // 存储按钮的状态，决定当前选中的是哪个按钮
    private var selectedButtonIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupButtons()
        setupTableView(with: dataSourse1)  // 默认展示 dataSourse1
        setupLoadMoreButton()
        
        // 默认选中 button1
        buttonTapped(button1)
    }

    // 配置按钮
    private func setupButtons() {
        let buttons = [button1, button2, button3]
        let titles = ["公告通知", "新闻快递", "网络公告"]
        
        for (index, button) in buttons.enumerated() {
            button.setTitle(titles[index], for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.backgroundColor = .white
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            button.tag = index
            view.addSubview(button)
        }

        // 使用SnapKit进行布局
        button1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view.snp.left)
            make.width.equalTo(view.snp.width).dividedBy(3)
            make.height.equalTo(40)
        }
        
        button2.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(button1.snp.right)
            make.width.equalTo(button1)
            make.height.equalTo(40)
        }
        
        button3.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(button2.snp.right)
            make.width.equalTo(button1)
            make.height.equalTo(40)
        }
        
        // 按钮之间的分割线
        addLineBetweenButtons()
    }

    // 添加按钮之间的分割线
    private func addLineBetweenButtons() {
        let line1 = UIView()
        line1.backgroundColor = .black
        view.addSubview(line1)
        line1.snp.makeConstraints { make in
            make.left.equalTo(button1.snp.right)
            make.top.equalTo(button1.snp.top)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        let line2 = UIView()
        line2.backgroundColor = .black
        view.addSubview(line2)
        line2.snp.makeConstraints { make in
            make.left.equalTo(button2.snp.right)
            make.top.equalTo(button1.snp.top)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        let line3 = UIView()
        line3.backgroundColor = .black
        view.addSubview(line3)
        line3.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(1)
            make.width.equalTo(view.snp.width)
        }
        
        let line4 = UIView()
        line4.backgroundColor = .black
        view.addSubview(line4)
        line4.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(1)
            make.width.equalTo(view.snp.width)
        }
    }

    // 按钮点击事件
    @objc private func buttonTapped(_ sender: UIButton) {
        selectedButtonIndex = sender.tag
        
        // 更新按钮的状态
        button1.isSelected = false
        button2.isSelected = false
        button3.isSelected = false
        sender.isSelected = true
        
        // 更新背景颜色
        button1.backgroundColor = button1.isSelected ? UIColor(named: "NavBar") : .white
        button2.backgroundColor = button2.isSelected ? UIColor(named: "NavBar") : .white
        button3.backgroundColor = button3.isSelected ? UIColor(named: "NavBar") : .white
        
        // 更新字体颜色
        button1.setTitleColor(button1.isSelected ? .white : .black, for: .normal)
        button2.setTitleColor(button2.isSelected ? .white : .black, for: .normal)
        button3.setTitleColor(button3.isSelected ? .white : .black, for: .normal)
        
        // 根据选中的按钮切换数据源
        switch selectedButtonIndex {
        case 0:
            setupTableView(with: dataSourse1)
        case 1:
            setupTableView(with: dataSourse2)
        case 2:
            setupTableView(with: dataSourse3)
        default:
            break
        }
    }

    // 配置UITableView
    private func setupTableView(with data: [Model]) {
        if messageTableView == nil {
            messageTableView = SettingMessageTableView(frame: CGRect.zero)
            view.addSubview(messageTableView!)
            
            messageTableView!.snp.makeConstraints { make in
                make.top.equalTo(button1.snp.bottom).offset(10)
                make.left.right.equalTo(view)
                make.height.equalTo(250)
            }
        }
        messageTableView?.setData(data)
    }

    // 配置查看更多按钮
    private func setupLoadMoreButton() {
        loadMoreButton.setTitle("查看更多", for: .normal)
        loadMoreButton.setTitleColor(.blue, for: .normal)
        loadMoreButton.layer.cornerRadius = 20
        loadMoreButton.layer.borderWidth = 1
        loadMoreButton.layer.borderColor = UIColor.blue.cgColor
        loadMoreButton.backgroundColor = .white
        view.addSubview(loadMoreButton)

        loadMoreButton.snp.makeConstraints { make in
            make.top.equalTo(messageTableView!.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
}
