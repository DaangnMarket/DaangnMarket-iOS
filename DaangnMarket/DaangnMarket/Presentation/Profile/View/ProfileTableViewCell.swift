//
//  ProfileTableViewCell.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class ProfileTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let categoryLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17, weight: .bold)
    }

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileTableViewCell {
    
    // MARK: - Custom Methods
    
    private func setLayout() {
        contentView.addSubviews(categoryLabel)
        
        categoryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
    }
    
    func setDataBind(_ categoryName: String) {
        categoryLabel.text = categoryName
    }
}
