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

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
    }
}

extension LoginViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
    }
}
