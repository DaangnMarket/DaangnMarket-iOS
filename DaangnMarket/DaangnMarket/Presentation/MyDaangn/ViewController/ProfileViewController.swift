//
//  ProfileViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
    }
}

extension ProfileViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .yellow
    }
    
    private func setLayout() {
        
    }
}
