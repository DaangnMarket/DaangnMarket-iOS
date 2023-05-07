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
    
    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .daangnGray
        $0.isUserInteractionEnabled = true
    }
    
    private let selectImageButton = UIButton().then {
        $0.setImage(UIImage(systemName: "camera.circle"), for: .normal)
        $0.tintColor = .darkGray
    }
    
    private let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let nicknameTextField = UITextField().then {
        $0.placeholder = "닉네임을 입력해주세요."
        $0.borderStyle = .roundedRect
        $0.font = .systemFont(ofSize: 16)
        $0.setLeftPadding(10)
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setAddTarget()
    }
    
    override func viewDidLayoutSubviews() {
        setCornerRadius()
    }
}

extension ModifyProfileViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(topBarView, topBarLineView, profileImageView, nicknameLabel, nicknameLabel, nicknameTextField)
        topBarView.addSubviews(backButton, topBarTitleLabel, completeButton)
        profileImageView.addSubview(selectImageButton)
        
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
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(topBarLineView.snp.bottom).offset(30)
            $0.leading.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(profileImageView.snp.width)
        }
        
        selectImageButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nicknameLabel)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    private func setCornerRadius() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        selectImageButton.addTarget(self, action: #selector(selectImageButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc private func completeButtonDidTap() {
        // 알림창
        dismiss(animated: true)
    }
    
    @objc private func selectImageButtonDidTap() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let selectAction = UIAlertAction(title: "앨범에서 선택", style: .default)
        let deleteAction = UIAlertAction(title: "프로필 사진 삭제", style: .destructive)
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel)
        alert.addActions(selectAction, deleteAction, cancelAction)
        present(alert, animated: true)
    }
}
