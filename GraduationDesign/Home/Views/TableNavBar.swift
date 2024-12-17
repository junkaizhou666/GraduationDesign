//
//  TableNavBar.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/11.
//

import UIKit
import SnapKit

class TableNavBar: UIView {
    private let label = UILabel()
    private var button = UIButton()
    private var seperatorLine = UIView()
    private var mainView = UIView()
    
    var moreButtonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        label.text = "title"
        label.textColor = UIColor(named: "NavBar")
        label.font = UIFont.systemFont(ofSize: 20)
        mainView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        seperatorLine.backgroundColor = .gray
        mainView.addSubview(seperatorLine)
        seperatorLine.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
        
        button.setTitle("更多", for: .normal)
        button.setTitleColor(.navBar, for: .normal)
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        mainView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-6)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
    
    @objc func moreButtonTapped() {
        moreButtonAction?()
    }

}
