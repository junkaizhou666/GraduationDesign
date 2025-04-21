//
//  CollegeDropDownMenuView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/20.
//

import UIKit
import SnapKit

class CollegeDropDownMenuView: UIView {
    
    private var tableView: UITableView!
    private var collegeModel = CollegeNameModel().collegeNameModel
    private var expandedIndexPath: IndexPath?
    private let gradeDropDownView = GradeDropDownMenuView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CollegeCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GradeCell")
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CollegeDropDownMenuView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeModel.count + (expandedIndexPath != nil ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let expanded = expandedIndexPath, indexPath.row == expanded.row + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GradeCell", for: indexPath)
            cell.selectionStyle = .none

            cell.contentView.subviews.forEach { $0.removeFromSuperview() }

            cell.contentView.addSubview(gradeDropDownView)
            gradeDropDownView.setupTableView()

            // 判断班级视图是否展开
            let classDropDownView = gradeDropDownView.getClassDropDownView()
            let classHeight = classDropDownView.isExpanded() ? 400 : 0
            let baseHeight = 175

            gradeDropDownView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(baseHeight + classHeight)
            }

            return cell
        }

        var actualRow = indexPath.row
        if let expanded = expandedIndexPath, indexPath.row > expanded.row {
            actualRow -= 1
        }

        guard actualRow >= 0 && actualRow < collegeModel.count else {
            return UITableViewCell()
        }

        let model = collegeModel[actualRow]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeCell", for: indexPath)
        cell.textLabel?.text = model.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let expanded = expandedIndexPath, indexPath.row == expanded.row + 1 {
            return
        }

        tableView.beginUpdates()

        if let expanded = expandedIndexPath {
            if indexPath.row == expanded.row {
                expandedIndexPath = nil
                tableView.deleteRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
            } else {
                let old = expanded
                var new = indexPath
                if indexPath.row > old.row {
                    new = IndexPath(row: indexPath.row - 1, section: 0)
                }
                expandedIndexPath = nil
                tableView.deleteRows(at: [IndexPath(row: old.row + 1, section: 0)], with: .fade)

                expandedIndexPath = new
                tableView.insertRows(at: [IndexPath(row: new.row + 1, section: 0)], with: .fade)
            }
        } else {
            expandedIndexPath = indexPath
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
        }

        tableView.endUpdates()
    }
}
