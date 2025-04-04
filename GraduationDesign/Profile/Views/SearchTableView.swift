//
//  SearchTableView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/4.
//

import UIKit
import SnapKit

class SearchTableView: UITableView {

    private var allData: [ButtonItem] = SearchModel().allButtons
    private var filteredData: [ButtonItem] = []

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchCell")
        self.filteredData = allData
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 外部调用此方法传入搜索关键字
    func search(with keyword: String) {
        if keyword.isEmpty {
            filteredData = allData
        } else {
            filteredData = allData.filter {
                $0.title.contains(keyword)
            }
        }
        self.reloadData()
    }
}

extension SearchTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        let item = filteredData[indexPath.row]
        cell.image.image = item.image
        cell.title.text = item.title
        return cell
    }
}
