//
//  NoticeTableViewCell.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/01.
//

import UIKit
import SnapKit
import Then

class NoticeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private(set) var isNew: Bool = true
    
    // MARK: - UI Components
    
    private let productImageView = UIImageView().then {
        $0.tintColor = .black
        $0.layer.cornerRadius = 10
    }
    
    private let productTitleLabel = UILabel().then {
        $0.text = "TestTitle"
        $0.numberOfLines = 0
    }
    
    private let uploadedLocationLabel = UILabel().then {
        $0.text = "test읍"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    private let middleSubtitleLabel = UILabel().then {
        $0.text = " · "
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    private let uploadedTimeLabel = UILabel().then {
        $0.text = "test분 전"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
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

extension NoticeTableViewCell {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = isNew ? .daangnGray : .clear
    }
    
    
    private func setLayout() {
        contentView.addSubviews(productImageView, productTitleLabel, uploadedLocationLabel, middleSubtitleLabel, uploadedTimeLabel)
        
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(12)
            $0.width.height.equalTo(100)
        }
        
        productTitleLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.top).offset(4)
            $0.leading.equalTo(productImageView.snp.trailing).offset(12)
            $0.height.equalTo(50)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        uploadedLocationLabel.snp.makeConstraints {
            $0.top.equalTo(productTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(productTitleLabel.snp.leading)
        }
        
        middleSubtitleLabel.snp.makeConstraints {
            $0.top.equalTo(productTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(uploadedLocationLabel.snp.trailing)
        }
        
        uploadedTimeLabel.snp.makeConstraints {
            $0.top.equalTo(productTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(middleSubtitleLabel.snp.trailing)
        }
    }
    
    func setDataBind(_ model: NoticeTableViewModel) {
        productImageView.image = UIImage(systemName: model.image)
        productTitleLabel.text = model.title
        uploadedLocationLabel.text = model.address
        uploadedTimeLabel.text = model.createdAt
    }
}
