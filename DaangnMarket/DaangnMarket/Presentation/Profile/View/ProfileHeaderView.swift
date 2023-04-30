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
        $0.layer.cornerRadius = 35
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
        $0.layer.cornerRadius = 5
    }
    
    private let mannerLabel = UILabel().then {
        let text = "매너온도"
        let attributedString = NSMutableAttributedString.init(string: text)
        let font = UIFont.boldSystemFont(ofSize: 15)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        attributedString.addAttribute(.font, value: font, range: NSRange.init(location: 0, length: attributedString.length))
        $0.attributedText = attributedString
    }
    
    private let infoImageView = UIImageView().then {
        $0.image = UIImage(systemName: "info.circle")
        $0.tintColor = .black
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
    
    private let percentStackView = UIStackView().then {
        $0.distribution = .fillEqually
    }
    
    private let redealingContainerView = UIView()
    private let responseContainerView = UIView()
    
    private let heartImageView = UIImageView().then {
        $0.image = UIImage(systemName: "heart")
        $0.tintColor = .black
    }
    
    private let redealingLabel = UILabel().then {
        $0.text = "재거래희망률 -%"
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let redealingDescriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "표시될 만큼 충분히 거래하지\n않았어요."
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
    }
    
    private let bubbleImageView = UIImageView().then {
        $0.image = UIImage(systemName: "bubble.right")
        $0.tintColor = .black
    }
    
    private let responseLabel = UILabel().then {
        $0.text = "응답률 -%"
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let responseDescriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "표시될 만큼 충분히 채팅하지\n않았어요."
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
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
        addSubviews(profileImageView, nickNameLabel, idLabel, modifyProfileButton, mannerLabel, temperatureProgressView, temperatureImageView,temperatureLabel, firstTemperatureStackView, infoImageView, percentStackView)
        firstTemperatureStackView.addArrangedSubViews(firsetTemperatureLabel, arrowImageView)
        percentStackView.addArrangedSubViews(redealingContainerView, responseContainerView)
        redealingContainerView.addSubviews(heartImageView, redealingLabel, redealingDescriptionLabel)
        responseContainerView.addSubviews(bubbleImageView, responseLabel, responseDescriptionLabel)
        
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
        
        mannerLabel.snp.makeConstraints {
            $0.top.equalTo(modifyProfileButton.snp.bottom).offset(20)
            $0.leading.equalTo(modifyProfileButton.snp.leading)
        }
        
        infoImageView.snp.makeConstraints {
            $0.centerY.equalTo(mannerLabel)
            $0.leading.equalTo(mannerLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(20)
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
            $0.top.equalTo(mannerLabel.snp.bottom).offset(5)
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
        
        percentStackView.snp.makeConstraints {
            $0.top.equalTo(temperatureProgressView.snp.bottom).offset(10)
            $0.width.equalTo(getScreenWidth()-30)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        heartImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        redealingLabel.snp.makeConstraints {
            $0.centerY.equalTo(heartImageView)
            $0.leading.equalTo(heartImageView.snp.trailing).offset(5)
        }
        
        redealingDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(redealingLabel.snp.bottom).offset(5)
            $0.leading.equalTo(redealingLabel)
        }
        
        bubbleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        responseLabel.snp.makeConstraints {
            $0.centerY.equalTo(bubbleImageView)
            $0.leading.equalTo(bubbleImageView.snp.trailing).offset(5)
        }
        
        responseDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(responseLabel.snp.bottom).offset(5)
            $0.leading.equalTo(responseLabel)
        }
    }
    
    private func getFirstTemperatureLocation() -> CGFloat {
        let progressViewWidth = getScreenWidth() - 30
        let firstProgress = progressViewWidth * 0.365
        return firstProgress
    }
}
