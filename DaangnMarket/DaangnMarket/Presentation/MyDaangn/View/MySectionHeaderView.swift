//
//  MyProfileHeaderView.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/19.
//

import UIKit

import SnapKit
import Then

final class MySectionHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let sectionLabel = UILabel().then {
        $0.text = "나의 거래"
        $0.font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setBackgroundColor()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MySectionHeaderView {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        contentView.backgroundColor = .yellow
    }
    
    private func setLayout() {
        contentView.addSubview(sectionLabel)
        
        sectionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
    }
}
