//
//  DaangnAlertViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

final class DaangnAlertViewController: UIViewController {
    
    private let alertView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let alertTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .darkGray
        $0.text = "닉네임은 30일마다 1번만 수정할 수 있어\n요. 정말 수정하시겠어요?"
        $0.numberOfLines = 0
    }
    
    private let cancelButton = UIButton().then {
        var attString = AttributedString("취소")
        attString.font = .systemFont(ofSize: 13, weight: .bold)
        attString.foregroundColor = .darkGray
        var config = UIButton.Configuration.plain()
        config.attributedTitle = attString
        
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 4
        $0.configuration = config
    }
    
    private let changeButton = UIButton().then {
        var attString = AttributedString("변경")
        attString.font = .systemFont(ofSize: 13, weight: .bold)
        attString.foregroundColor = .white
        var config = UIButton.Configuration.plain()
        config.attributedTitle = attString
        
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 4
        $0.configuration = config
    }
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 10
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
}

extension DaangnAlertViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    private func setLayout() {
        view.addSubviews(alertView)
        alertView.addSubviews(alertTextLabel, buttonStackView)
        buttonStackView.addArrangedSubViews(cancelButton, changeButton)
        
        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(45)
        }
        
        alertTextLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(alertTextLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
        }
    }
}
