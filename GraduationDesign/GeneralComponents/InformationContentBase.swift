//
//  InformationContentBase.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import JXSegmentedView

class InformationContentBase: UIViewController, JXSegmentedListContainerViewListDelegate {
    
    var tableView: SettingTableView!
    var seeMoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSeeMoreButton()
    }
    
    func setupTableView() {
        tableView = SettingTableView(frame: CGRect.zero)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-60)
            make.height.equalTo(340)
        }
        
        let model = NoticeModel()
        tableView.setData(model.noticeModel)
    }
    
    func setupSeeMoreButton() {
        seeMoreButton = UIButton(type: .system)
        seeMoreButton.setTitle("查看更多", for: .normal)
        seeMoreButton.addTarget(self, action: #selector(didTapSeeMore), for: .touchUpInside)
        view.addSubview(seeMoreButton)
        
        seeMoreButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
//            make.top.equalTo(tableView.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    @objc func didTapSeeMore() {
        let newVC = SeeMoreButtonViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }

    
    func listView() -> UIView {
        return self.view
    }
}
