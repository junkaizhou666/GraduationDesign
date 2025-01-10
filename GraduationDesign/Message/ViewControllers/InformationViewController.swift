//
//  InformationViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit
import JXSegmentedView

class InformationViewController: UIViewController {
    
    var listContainerView: JXSegmentedListContainerView!
    var segmentedView: JXSegmentedView!
    var segmentedDataSource: JXSegmentedTitleDataSource!
    private var separators: [UIView] = [] // 用于存储分割线视图
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 创建 JXSegmentedView 实例
        segmentedView = JXSegmentedView()
        segmentedView.contentEdgeInsetLeft = 0
        segmentedView.contentEdgeInsetRight = 0
        // 使用 SnapKit 进行布局
        view.addSubview(segmentedView)
        segmentedView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(view)
            make.height.equalTo(50)
        }
        
        // 添加上下分割线
        let topLine = UIView()
        topLine.backgroundColor = .lightGray
        segmentedView.addSubview(topLine)
        topLine.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray
        segmentedView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        // 设置数据源
        segmentedDataSource = JXSegmentedTitleDataSource()
        let titles = ["公告通知", "信息快递", "网络公告"]
        segmentedDataSource.titles = titles
        segmentedDataSource.itemWidth = 115
        segmentedDataSource.titleNormalColor = UIColor.black
        segmentedDataSource.titleSelectedColor = UIColor.white
        segmentedDataSource.isTitleColorGradientEnabled = true
//        segmentedDataSource.titleAlignment = .center // 让标题居中
        segmentedView.dataSource = segmentedDataSource
        
        // 添加背景指示器
        let indicator = JXSegmentedIndicatorBackgroundView()
        indicator.indicatorColor = UIColor(named: "NavBar")! // 背景颜色
        indicator.indicatorWidth = UIScreen.main.bounds.width / CGFloat(titles.count) // 设置指示器宽度为每个segment的宽度
        indicator.indicatorHeight = 50
        indicator.indicatorCornerRadius = 5 // 圆角可根据需要调整
        indicator.indicatorPosition = .center // 指示器位置居中
        segmentedView.indicators = [indicator]
        
        // 添加分割线
        addTitleSeparators(to: segmentedView, titles: titles)
        
        // 设置代理，监听标签切换
        segmentedView.delegate = self
        
        // 初始化 JXSegmentedListContainerView
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        
        // 使用 SnapKit 进行布局
        view.addSubview(listContainerView)
        listContainerView.snp.makeConstraints { make in
            make.top.equalTo(segmentedView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalToSuperview()
        }
        
        // 将 listContainerView.scrollView 和 segmentedView.contentScrollView 进行关联
        segmentedView.listContainer = listContainerView
    }
    
    /// 添加分割线
    private func addTitleSeparators(to segmentedView: JXSegmentedView, titles: [String]) {
        let segmentWidth = UIScreen.main.bounds.width / CGFloat(titles.count)
        for index in 1..<titles.count { // 从第一个分割线开始
            let separator = UIView()
            separator.backgroundColor = .lightGray
            separators.append(separator) // 存储分割线
            segmentedView.addSubview(separator)
            separator.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(1)
                make.left.equalToSuperview().offset(segmentWidth * CGFloat(index))
            }
        }
    }
}

extension InformationViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        // tab 的总个数
        return segmentedDataSource.titles.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        // 根据索引返回不同的视图控制器
        switch index {
        case 0:
            return InformationContent1()
        case 1:
            return InformationContent2()
        case 2:
            return InformationContent3()
        default:
            return InformationContent1()
        }
    }
}

extension InformationViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        print("当前选中的标签索引是: \(index)") // 打印当前选中的标签索引
    }
}
