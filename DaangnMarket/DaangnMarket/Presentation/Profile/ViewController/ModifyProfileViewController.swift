//
//  ModifyNicknameViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

final class ModifyProfileViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let topBarView = UIView()
    private let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
    }
    
    private let topBarTitleLabel = UILabel().then {
        $0.text = "프로필 수정"
        $0.font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    private let completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let topBarLineView = UIView().then {
        $0.backgroundColor = .daangnGray
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
    }
}

extension ModifyProfileViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(topBarView, topBarLineView)
        topBarView.addSubviews(backButton, topBarTitleLabel, completeButton)
        
        topBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.width.height.equalTo(40)
        }
        
        topBarTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        topBarLineView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
