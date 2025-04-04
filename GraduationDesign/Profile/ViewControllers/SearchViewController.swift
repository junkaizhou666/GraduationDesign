//
//  SearchViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/2.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    private var statusBarView: UIView!
    private var aboveCustomNavBar: CustomNavigationBar!
    private let searchTableView = SearchTableView()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("取消", for: .normal)
        button.addTarget(self, action: #selector(dismissSearch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func dismissSearch() {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        searchBar.delegate = self
        
        setupStatusBar()
        setupAboveNavBar()
        setupBar()
        setupTableView()
        
        searchBar.becomeFirstResponder()
    }
    
    private func setupStatusBar() {
        statusBarView = UIView()
        statusBarView.backgroundColor = UIColor(named: "NavBar")
        view.addSubview(statusBarView)
        
        statusBarView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupAboveNavBar() {
        aboveCustomNavBar = CustomNavigationBar()
        aboveCustomNavBar.navigationBar.barTintColor = UIColor(named: "NavBar")
        aboveCustomNavBar.navigationBar.isTranslucent = false
        aboveCustomNavBar.hideLeftButton()
        aboveCustomNavBar.setTitle("搜索")
        view.addSubview(aboveCustomNavBar)
        
        aboveCustomNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupBar() {
        let headerView = UIView()
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        headerView.addSubview(searchBar)
        headerView.addSubview(cancelButton)
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(headerView.snp.leading).offset(8)
            make.centerY.equalTo(headerView)
            make.trailing.equalTo(cancelButton.snp.leading).offset(-8)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.trailing.equalTo(headerView.snp.trailing).offset(-8)
            make.centerY.equalTo(headerView)
            make.width.equalTo(50)
        }
    }

    private func setupTableView() {
        view.addSubview(searchTableView)
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.left.right.bottom.equalToSuperview()
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTableView.search(with: searchText)
    }
}
