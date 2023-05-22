//
//  WishListViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class WishListViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setNavigationBar()
    }
}

extension WishListViewController {
    
    // MARK: - Custom Methods
    
    private func setNavigationBar() {
        view.backgroundColor = .yellow
    }
}
