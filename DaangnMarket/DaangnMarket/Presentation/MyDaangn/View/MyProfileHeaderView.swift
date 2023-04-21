//
//  MyProfileHeaderView.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/21.
//

import UIKit

import SnapKit
import Then

final class MyProfileHeaderView: UIView {
    
    // MARK: - UI Components
    
    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .daangnGray
        $0.layer.cornerRadius = 20
    }
    
    private let nickNameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private let showProfileButton = UIButton().then {
        $0.backgroundColor = .daangnGray
        $0.layer.cornerRadius = 5
        
        var config = UIButton.Configuration.plain()
        
        var titleAttr = AttributedString("프로필 보기")
        titleAttr.font = .systemFont(ofSize: 12, weight: .semibold)
        titleAttr.foregroundColor = .black
        
        config.attributedTitle = titleAttr
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        
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

extension MyProfileHeaderView {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        addSubviews(profileImageView, nickNameLabel, showProfileButton)
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(10)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
        
        showProfileButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.centerY.equalTo(profileImageView)
        }
    }
}
