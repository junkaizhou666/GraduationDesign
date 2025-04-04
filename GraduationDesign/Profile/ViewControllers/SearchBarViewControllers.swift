//
//  SearchBarViewControllers.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/2/12.
//

import UIKit
import SnapKit

class SearchBarViewControllers: UIViewController {
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索"
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 将 searchBar 添加到视图中
        view.addSubview(searchBar)
        searchBar.delegate = self
        
        // 使用 SnapKit 设置布局约束
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(-10)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(44)
        }
    }
}

extension SearchBarViewControllers: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchVC = SearchViewController()
        let navController = UINavigationController(rootViewController: searchVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}

