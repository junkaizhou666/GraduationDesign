//
//  ImageBottomPageViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/11.
//

import UIKit
import SnapKit

class ImageBottomPageViewController: UIViewController {
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    var titleLabel: UILabel!
    let model = ImageBottomModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupTitleAndPageControl()
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
            make.height.equalTo(210)
        }
        
        for (index, homeImage) in model.imagesBottom.enumerated() {
            let imageView = UIImageView(image: homeImage.image)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)

            imageView.snp.makeConstraints { make in
                make.top.bottom.equalTo(scrollView)
                make.width.equalTo(scrollView)
                make.left.equalTo(scrollView.snp.left).offset(CGFloat(index) * view.frame.width)
            }
            
            // 添加标题和小圆点容器
            let infoView = UIView()
            infoView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            imageView.addSubview(infoView)
            
            infoView.snp.makeConstraints { make in
                make.left.equalTo(imageView).offset(15)
                make.right.equalTo(imageView).offset(-15)
                make.bottom.equalTo(imageView)
                make.height.equalTo(30)
            }
            
            let label = UILabel()
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14)
            label.textAlignment = .left
            
            let maxLabelWidth: CGFloat = view.frame.width * 0.66
            label.text = homeImage.title.truncated(toFitWidth: maxLabelWidth, font: label.font)
            
            infoView.addSubview(label)
            
            label.snp.makeConstraints { make in
                make.left.equalTo(infoView).offset(10)
                make.centerY.equalTo(infoView)
                make.width.equalTo(maxLabelWidth)
            }
            
            // 添加小圆点
            let pageControl = UIPageControl()
            pageControl.numberOfPages = model.imagesBottom.count
            pageControl.currentPage = index
            pageControl.pageIndicatorTintColor = .lightGray
            pageControl.currentPageIndicatorTintColor = .white
            pageControl.isUserInteractionEnabled = false
            infoView.addSubview(pageControl)
            
            pageControl.snp.makeConstraints { make in
                make.right.equalTo(infoView).offset(-10)
                make.centerY.equalTo(infoView)
            }
            
            if index == 0 {
                self.pageControl = pageControl
                self.titleLabel = label
            }
        }
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(model.imagesBottom.count), height: 210)
    }
    
    func setupTitleAndPageControl() {
        updateTitleAndPageControl(forPage: 0)
    }

    func updateTitleAndPageControl(forPage page: Int) {
        let homeImage = model.imagesBottom[page]
        let maxLabelWidth: CGFloat = view.frame.width * 0.66
        titleLabel.text = homeImage.title.truncated(toFitWidth: maxLabelWidth, font: titleLabel.font)
        pageControl.currentPage = page
    }

    @objc func pageChanged(_ sender: UIPageControl) {
        let page = pageControl.currentPage
        let offset = CGPoint(x: CGFloat(page) * view.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
        updateTitleAndPageControl(forPage: page)
    }

    func setupSwipeGestures() {
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipeGesture.direction = .left
        scrollView.addGestureRecognizer(leftSwipeGesture)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        rightSwipeGesture.direction = .right
        scrollView.addGestureRecognizer(rightSwipeGesture)
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        var currentPage = pageControl.currentPage
        
        if gesture.direction == .left {
            currentPage = min(currentPage + 1, pageControl.numberOfPages - 1)
        } else if gesture.direction == .right {
            currentPage = max(currentPage - 1, 0)
        }
        
        pageControl.currentPage = currentPage
        let offset = CGPoint(x: CGFloat(currentPage) * view.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
        updateTitleAndPageControl(forPage: currentPage)
    }
}

extension ImageBottomPageViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        updateTitleAndPageControl(forPage: page)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        updateTitleAndPageControl(forPage: page)
    }
}
