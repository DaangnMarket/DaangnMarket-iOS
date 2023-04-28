//
//  ProfileViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
    }
}

extension ProfileViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .yellow
    }
}
