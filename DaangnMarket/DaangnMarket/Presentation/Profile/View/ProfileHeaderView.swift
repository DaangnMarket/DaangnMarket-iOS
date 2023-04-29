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
    
    private let temperatureProgressView = UIProgressView().then {
        $0.trackTintColor = .daangnGray
        $0.tintColor = UIColor(r: 112, g: 182, b: 233)
        $0.progress = 0.365
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.layer.sublayers![1].cornerRadius = 5
        $0.subviews[1].clipsToBounds = true
    }
    
    private let temperatureImageView = UIImageView().then {
        $0.image = UIImage(systemName: "face.smiling")
    }
    
    private let temperatureLabel = UILabel().then {
        $0.text = "36.5℃"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = UIColor(r: 112, g: 182, b: 233)
    }
    
    private let firsetTemperatureLabel = UILabel().then {
        $0.text = "첫 온도 36.5℃"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
    }
    
    private let arrowImageView = UIImageView().then {
        $0.image = UIImage(systemName: "arrowtriangle.down.fill")
        $0.tintColor = .lightGray
    }
    
    private let firstTemperatureStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 5
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
        backgroundColor = .clear
    }
    
    private func setLayout() {
        addSubviews(profileImageView, nickNameLabel, idLabel, modifyProfileButton, mannerButton, temperatureProgressView, temperatureImageView,temperatureLabel, firstTemperatureStackView)
        firstTemperatureStackView.addArrangedSubViews(firsetTemperatureLabel, arrowImageView)
        
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
        
        temperatureLabel.snp.makeConstraints {
            $0.centerY.equalTo(temperatureImageView)
            $0.trailing.equalTo(temperatureImageView.snp.leading).offset(-5)
        }
        
        firstTemperatureStackView.snp.makeConstraints {
            $0.centerY.equalTo(temperatureImageView)
            $0.leading.equalToSuperview().offset(getFirstTemperatureLocation()-27)
        }
        
        temperatureImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.top.equalTo(mannerButton.snp.bottom).offset(5)
            $0.width.height.equalTo(30)
        }
        
        temperatureProgressView.snp.makeConstraints {
            $0.top.equalTo(temperatureImageView.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(getScreenWidth()-30)
            $0.height.equalTo(10)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.width.height.equalTo(10)
        }
    }
    
    private func getFirstTemperatureLocation() -> CGFloat {
        let progressViewWidth = getScreenWidth() - 30
        let firstProgress = progressViewWidth * 0.365
        return firstProgress
    }
}
