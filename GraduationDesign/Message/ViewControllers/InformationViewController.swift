//
//  InformationViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import JXSegmentedView
import SnapKit

class InformationViewController: UIViewController {
    
    var listContainerView: JXSegmentedListContainerView!
    var segmentedView: JXSegmentedView!
    var segmentedDataSource: JXSegmentedTitleDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建实例并赋值为类的属性
        segmentedView = JXSegmentedView()
        
        // 使用 SnapKit 进行布局
        view.addSubview(segmentedView)
        segmentedView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(view)
            make.height.equalTo(50)
        }
        
        // 设置数据源
        segmentedDataSource = JXSegmentedTitleDataSource()
        let titles = ["公告通知", "信息快递", "网络公告"]
        segmentedDataSource.titles = titles
        segmentedView.dataSource = segmentedDataSource
        
        // 设置未选中时的标题颜色
        segmentedDataSource.titleNormalColor = UIColor.black
        // 设置选中时的标题颜色
        segmentedDataSource.titleSelectedColor = UIColor.blue
        
        // 设置指示器
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorColor = UIColor.blue
        indicator.indicatorHeight = 3
        segmentedView.indicators = [indicator]
        
        // 设置代理，监听标签切换
        segmentedView.delegate = self
        
        // 初始化JXSegmentedListContainerView
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        
        // 使用 SnapKit 进行布局
        view.addSubview(listContainerView)
        listContainerView.snp.makeConstraints { make in
            make.top.equalTo(segmentedView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalToSuperview()
        }
        
        // 将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.listContainer = listContainerView
    }
}

extension InformationViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        // tab的总个数
        return 3
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
        print("当前选中的标签索引是: \(index)")  // 打印当前选中的标签索引
    }
}

