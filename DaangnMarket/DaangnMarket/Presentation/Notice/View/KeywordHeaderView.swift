//
//  KeywordHeaderView.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/01.
//

import UIKit

import SnapKit
import Then

final class KeywordHeaderView: UIView {
    
    // MARK: - UI Components
    
    private let icon = UIImageView().then {
        $0.image = .init(systemName: "bell.fill")
    }
    
    private let label = UILabel().then {
        $0.text = "알림 받는 키워드 8개"
        $0.font = .systemFont(ofSize: UIFont.systemFontSize, weight: .semibold)
    }
    
    private let button = UIButton().then {
        $0.backgroundColor = .daangnGray
        $0.layer.cornerRadius = 5
        
        var config = UIButton.Configuration.plain()
        
        var titleAttr = AttributedString("설정")
        titleAttr.font = .systemFont(ofSize: UIFont.systemFontSize, weight: .semibold)
        titleAttr.foregroundColor = .black
        
        config.attributedTitle = titleAttr
        
        $0.configuration = config
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension KeywordHeaderView {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        addSubviews(icon, label, button)
        
        icon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(icon.snp.trailing).offset(4)
        }
        
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
}
