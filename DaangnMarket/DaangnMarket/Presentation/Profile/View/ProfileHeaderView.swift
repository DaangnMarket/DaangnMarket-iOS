//
//  ProfileHeaderView.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class ProfileHeaderView: UIView {
    
    // MARK: - UI Components
    
    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .daangnGray
    }
    
    private let nickNameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private let idLabel = UILabel().then {
        $0.text = "#12345678"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
    }
    
    private let modifyProfileButton = UIButton().then {
        var titleAttr = AttributedString("프로필 수정")
        titleAttr.font = .systemFont(ofSize: 14, weight: .semibold)
        titleAttr.foregroundColor = .black
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = titleAttr
        
        $0.backgroundColor = .daangnGray
        $0.configuration = config
    }
    
    private let mannerButton = UIButton().then {
        $0.setTitle("매너온도", for: .normal)
        $0.backgroundColor = .black
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

extension ProfileHeaderView {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        backgroundColor = .yellow
    }
    
    private func setLayout() {
        addSubviews(profileImageView, nickNameLabel, idLabel, modifyProfileButton, mannerButton)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(70)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(15)
        }
        
        idLabel.snp.makeConstraints {
            $0.centerY.equalTo(nickNameLabel)
            $0.leading.equalTo(nickNameLabel.snp.trailing).offset(5)
        }
        
        modifyProfileButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(getScreenWidth()-30)
            $0.height.equalTo(40)
        }
        
        mannerButton.snp.makeConstraints {
            $0.top.equalTo(modifyProfileButton.snp.bottom).offset(20)
            $0.leading.equalTo(modifyProfileButton.snp.leading)
        }
    }
}
