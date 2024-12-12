//
//  ImageUpPageViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/11.
//

import UIKit
import SnapKit

class ImageUpPageViewController: UIViewController {
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    let model = ImageUpModel()
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupPageControl()
        setupSwipeGestures()
        startTimer()
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
            make.height.equalTo(110)
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
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(model.imagesUp.count), height: 110)
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
    
    @objc func pageChanged(_ sender: UIPageControl) {
        let page = pageControl.currentPage
        let offset = CGPoint(x: CGFloat(page) * view.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
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
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(autoScrollToNextPage), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc func autoScrollToNextPage() {
        var nextPage = pageControl.currentPage + 1
        
        if nextPage >= model.imagesUp.count {
            nextPage = 0 // 回到第一页
        }
        
        pageControl.currentPage = nextPage
        let offset = CGPoint(x: CGFloat(nextPage) * view.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }

    deinit {
        stopTimer() // 确保定时器在控制器销毁时停止
    }
}

extension ImageUpPageViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
}
