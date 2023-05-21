//
//  ModifyNicknameViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

enum NickNameCheck {
    case original
    case empty
    case lessThanTwo
    case includeSpecialCharacter
    case success
    
    var errorMessage: String? {
        switch self {
        case .original:
            return nil
        case .empty:
            return "닉네임을 입력해 주세요!"
        case .lessThanTwo:
            return "닉네임은 2자 이상 입력해 주세요."
        case .includeSpecialCharacter:
            return "닉네임은 띄어쓰기 없이 한글, 영문, 숫자만 가능해요."
        case .success:
            return nil
        }
    }
}

final class ModifyProfileViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var completeButton = UIBarButtonItem()
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
    
    private var errorMessageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .red
    }
    
    // MARK: - Properties
    
    var nicknameCheck: NickNameCheck = .original

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setAddTarget()
        setNavigationBar()
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
        view.addSubviews(profileImageView, nicknameLabel, nicknameLabel, nicknameTextField, errorMessageLabel)
        profileImageView.addSubview(selectImageButton)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
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

        errorMessageLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            $0.leading.equalTo(nicknameTextField)
        }
    }
    
    private func setCornerRadius() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    private func setAddTarget() {
        selectImageButton.addTarget(self, action: #selector(selectImageButtonDidTap), for: .touchUpInside)
        nicknameTextField.addTarget(self, action: #selector(nickNameTextFieldDidChanged), for: .editingChanged)
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonDidTap))
        completeButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonDidTap))
        completeButton.isEnabled = false
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = completeButton
        navigationItem.title = "프로필 수정"
        
        navigationController?.navigationBar.tintColor = .black
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
        let selectAction = UIAlertAction(title: "앨범에서 선택", style: .default) { action in
            
        }
        let deleteAction = UIAlertAction(title: "프로필 사진 삭제", style: .destructive) { action in
            print("프로필 사진 삭제 버튼 tap")
        }
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel)
        alert.addActions(selectAction, deleteAction, cancelAction)
        present(alert, animated: true)
    }
    
    @objc private func nickNameTextFieldDidChanged() {
        let text = nicknameTextField.text!
        completeButton.isEnabled = false

        if text == "" {
            nicknameCheck = .empty
        } else if text.count == 1 {
            nicknameCheck = .lessThanTwo
        } else {
            nicknameCheck = .success
            completeButton.isEnabled = true
        }

        errorMessageLabel.text = nicknameCheck.errorMessage
    }
}
