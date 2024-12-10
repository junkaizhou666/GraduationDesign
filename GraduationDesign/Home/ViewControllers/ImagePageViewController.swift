//
//  ImagePageViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/10.
//

import UIKit
import SnapKit

class ImagePageViewController: UIViewController {
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    let model = ImageUpModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupPageControl()
        setupSwipeGestures()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        
        for (index, homeImage) in model.imagesUp.enumerated() {
            let imageView = UIImageView(image: homeImage.image)
            imageView.contentMode = .scaleToFill
            scrollView.addSubview(imageView)

            imageView.snp.makeConstraints { make in
                make.top.bottom.equalTo(scrollView)
                make.width.equalTo(scrollView)
                make.left.equalTo(scrollView.snp.left).offset(CGFloat(index) * view.frame.width)
            }
        }
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(model.imagesUp.count), height: 120)
    }

    func setupPageControl() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = model.imagesUp.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
        pageControl.addTarget(self, action: #selector(pageChanged(_:)), for: .valueChanged)
    }
    
    // 处理pageControl的切换
    @objc func pageChanged(_ sender: UIPageControl) {
        let page = pageControl.currentPage
        let offset = CGPoint(x: CGFloat(page) * view.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }
    
    // 设置左右滑动手势识别器
    func setupSwipeGestures() {
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipeGesture.direction = .left
        scrollView.addGestureRecognizer(leftSwipeGesture)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipeGesture.direction = .right
        scrollView.addGestureRecognizer(rightSwipeGesture)
    }
    
    // 处理左右滑动
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        var currentPage = pageControl.currentPage
        
        if gesture.direction == .left {
            // 向左滑动，切换到下一页
            currentPage = min(currentPage + 1, pageControl.numberOfPages - 1)
        } else if gesture.direction == .right {
            // 向右滑动，切换到上一页
            currentPage = max(currentPage - 1, 0)
        }
        
        // 更新pageControl
        pageControl.currentPage = currentPage
        
        // 滚动到对应的页面
        let offset = CGPoint(x: CGFloat(currentPage) * view.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }
}

extension ImagePageViewController: UIScrollViewDelegate {
    // 滚动视图停止滚动后更新pageControl
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
    
    // 如果用户手动拖动，及时更新pageControl
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
}
