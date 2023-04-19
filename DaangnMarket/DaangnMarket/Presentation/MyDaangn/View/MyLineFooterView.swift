//
//  MyLineFooterView.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/20.
//

import UIKit

import SnapKit
import Then

final class MyLineFooterView: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let lineView = UIView().then {
        $0.backgroundColor = .daangnGray
    }

    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyLineFooterView {
    
    // MARK: - Custom Methods
    
    private func setLayout() {
        contentView.addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
