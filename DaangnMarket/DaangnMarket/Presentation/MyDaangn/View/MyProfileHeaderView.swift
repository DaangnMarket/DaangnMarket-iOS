//
//  MyProfileHeaderView.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/21.
//

import UIKit

import SnapKit
import Then

protocol MyDaangnActionProtocol {
    func viewProfileButtonDidTap()
}

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
    
    private let payView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.daangnGray.cgColor
        $0.layer.cornerRadius = 8
    }
    
    private let payImageView = UIImageView().then {
        $0.image = UIImage(named: "DaangnPayLogo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let payDescriptionLabel = UILabel().then {
        $0.text = "당근하는 새로운 방법, 당근페이!"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    private let payDetailButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var chargeButton = setPayButton("plus", "충전")
    private lazy var wireButton = setPayButton("wonsign.circle", "계좌 송금")
    private let payStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    
    // MARK: - Properties
    
    var delegate: MyDaangnActionProtocol?

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
        setAddTarget()
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
        addSubviews(profileImageView, nickNameLabel, showProfileButton, payView)
        payView.addSubviews(payImageView, payDescriptionLabel, payDetailButton, payStackView)
        payStackView.addArrangedSubViews(chargeButton, wireButton)
        
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
        
        payView.snp.makeConstraints {
            $0.width.equalTo(getScreenWidth()-30)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImageView.snp.bottom).offset(15)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
        payImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }
        
        payDetailButton.snp.makeConstraints {
            $0.centerY.equalTo(payImageView)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        payDescriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(payDetailButton)
            $0.trailing.equalTo(payDetailButton.snp.leading).offset(-10)
        }
        
        payStackView.snp.makeConstraints {
            $0.top.equalTo(payImageView.snp.bottom).offset(15)
            $0.bottom.equalToSuperview().offset(-15)
            $0.leading.equalTo(payImageView)
            $0.trailing.equalTo(payDetailButton)
        }
    }
    
    private func setPayButton(_ imageName: String, _ buttonTitle: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .daangnGray
        button.layer.cornerRadius = 5
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: imageName)
        config.imagePadding = 5
        config.baseForegroundColor = .black
        
        var titleAttr = AttributedString(buttonTitle)
        titleAttr.font = .systemFont(ofSize: 14, weight: .semibold)
        titleAttr.foregroundColor = .black

        config.attributedTitle = titleAttr
        button.configuration  = config
        
        return button
    }
    
    private func setAddTarget() {
        showProfileButton.addTarget(self, action: #selector(showProfileButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func showProfileButtonDidTap() {
        delegate?.viewProfileButtonDidTap()
    }
}
