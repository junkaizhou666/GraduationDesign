//
//  JumpToViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/1/10.
//

import UIKit
import WebKit
import SnapKit

class JumpToViewController: UIViewController, WKNavigationDelegate {
    var urlString: String?
    private var statusBarView: UIView!
    private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }

        self.view.backgroundColor = UIColor(named: "NavBar")

        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .clear
        view.addSubview(scrollView)

        // 初始化 webView 并设置代理
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        webView.backgroundColor = .clear
        webView.navigationDelegate = self  // 设置代理
        let request = URLRequest(url: url)
        webView.load(request)
        scrollView.addSubview(webView)

        scrollView.contentSize = CGSize(width: view.bounds.width, height: webView.bounds.height)

        scrollView.contentInset = UIEdgeInsets(top: -90, left: 0, bottom: 0, right: 0)
        scrollView.clipsToBounds = true
        setupStatusBar()
        view.bringSubviewToFront(statusBarView)
    }

    private func setupStatusBar() {
        statusBarView = UIView()
        statusBarView.backgroundColor = UIColor(named: "NavBar")
        view.addSubview(statusBarView)

        statusBarView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 10)
        }
    }
}
