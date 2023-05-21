//
//  DaangnAlertViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/19.
//

import UIKit

import SnapKit
import Then

enum AlertType {
    case cancelAndChange
}

final class DaangnAlertViewController: UIViewController {
    
    private let alertView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let alertTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.text = "테스트"
        $0.numberOfLines = 0
    }
    
    private let cancelButton = UIButton().then {
        $0.backgroundColor = .red
        $0.setTitle("취소", for: .normal)
    }
    
    private let changeButton = UIButton().then {
        $0.backgroundColor = .red
        $0.setTitle("변경", for: .normal)
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
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        view.addSubviews(alertView)
        
        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
