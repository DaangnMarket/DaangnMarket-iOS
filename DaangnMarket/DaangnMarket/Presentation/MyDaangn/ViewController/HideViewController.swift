//
//  HideViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/25.
//

import UIKit

import SnapKit
import Then

final class HideViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let descriptionLabel = UILabel().then {
        $0.text = "숨기기한 게시글이 없어요."
        $0.textColor = .lightGray
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
    }
}

extension HideViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .systemGray6
    }
    
    private func setLayout() {
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
