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
    
    private let menuImageView = UIImageView().then {
        $0.tintColor = .black
    }
    private let menuNameLabel = UILabel().then {
        $0.text = "test"
        $0.font = .systemFont(ofSize: 15)
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
        contentView.addSubviews(menuImageView, menuNameLabel)
        
        menuImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(25)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(menuImageView.snp.trailing).offset(10)
        }
    }
    
    func setDataBind(_ model: MyDaangnModel) {
        menuImageView.image = UIImage(systemName: model.menuImageName)
        menuNameLabel.text = model.menuName
    }
}
