//
//  ImageView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

import UIKit

class ImageView: UIView {

    // 创建 UIScrollView
    let scrollView = UIScrollView()
    
    // 创建 UIPageControl
    let pageControl = UIPageControl()
    
    // 图片数据
    let imageModel = ImageModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        // 添加子视图
        addSubview(scrollView)
        addSubview(pageControl)
        
        // 设置功能
        scrollView.isPagingEnabled = true  // 启用分页滑动
        scrollView.showsHorizontalScrollIndicator = false  // 隐藏水平滚动条
        scrollView.delegate = self
        
        // 调整页面控制器
        pageControl.numberOfPages = imageModel.images.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlChanged), for: .valueChanged)
        
        setupLayout()
    }

    private func setupLayout() {
        // 使用 SnapKit 设置 scrollView 和 pageControl 的布局
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.right.equalTo(self)
            make.height.equalTo(200)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(scrollView.snp.bottom).offset(20)  // 设置距离 scrollView 底部的间距
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        addImagesToScrollView()
    }

    func addImagesToScrollView() {
        for (index, imageModel) in imageModel.images.enumerated() {
            let imageView = UIImageView(image: UIImage(named: imageModel.image))  // 使用模型中的图片名
            imageView.contentMode = .scaleAspectFill
            scrollView.addSubview(imageView)
            
            // 使用 SnapKit 设置每个 imageView 的布局
            imageView.snp.makeConstraints { make in
                make.top.equalTo(scrollView.snp.top)
                make.bottom.equalTo(scrollView.snp.bottom)
                make.width.equalTo(scrollView.snp.width)
                make.left.equalTo(scrollView.snp.left).offset(CGFloat(index) * scrollView.frame.width)
            }
        }
        
        // 设置 scrollView 的 contentSize
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(imageModel.images.count), height: scrollView.frame.height)
    }
    
    @objc func pageControlChanged() {
        let offset = CGPoint(x: CGFloat(pageControl.currentPage) * scrollView.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }
}

extension ImageView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 更新 pageControl 的当前页
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
}
