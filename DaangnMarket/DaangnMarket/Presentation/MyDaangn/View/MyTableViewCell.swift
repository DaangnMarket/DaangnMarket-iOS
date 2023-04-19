//
//  MyTableViewCell.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/19.
//

import UIKit

import SnapKit
import Then

final class MyTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let menuNameLabel = UILabel().then {
        $0.text = "test"
    }

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyTableViewCell {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        selectionStyle = .none
    }
    
    private func setLayout() {
        contentView.addSubview(menuNameLabel)
        
        menuNameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
