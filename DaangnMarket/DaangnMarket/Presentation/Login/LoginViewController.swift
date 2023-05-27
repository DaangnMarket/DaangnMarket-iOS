//
//  LoginViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/27.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let daangnLogoImage = UIImageView().then {
        $0.image = UIImage(named: "DaangnMainLogo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "당신 근처의 당근마켓"
        $0.font = .systemFont(ofSize: 22, weight: .bold)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "중고 거래부터 동네 정보까지,\n지금 내 동네를 선택하고 시작해 보세요!"
        $0.numberOfLines = 0
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private let kakaoLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "KakaoLoginButtonImage"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setAddTarget()
    }
}

extension LoginViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(daangnLogoImage, titleLabel, descriptionLabel, kakaoLoginButton)
        
        daangnLogoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(250)
            $0.leading.equalToSuperview().offset(120)
            $0.height.equalTo(daangnLogoImage.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(daangnLogoImage)
            $0.top.equalTo(daangnLogoImage.snp.bottom).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalTo(daangnLogoImage)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
        }
    }
    
    private func setAddTarget() {
        kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func kakaoLoginButtonDidTap() {
        print("tap!")
    }
}
