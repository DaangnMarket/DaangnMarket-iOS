//
//  MyProfileHeaderView.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/20.
//

import UIKit

import SnapKit
import Then

final class MyProfileHeaderView: UIView {

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyProfileHeaderView {
    
    // MARK: - Custom Methods
    
    private func setBackground() {
        backgroundColor = .green
    }
}
