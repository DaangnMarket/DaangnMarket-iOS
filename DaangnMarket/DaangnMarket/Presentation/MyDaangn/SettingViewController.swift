//
//  SettingViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/19.
//

import UIKit

final class SettingViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        hideTabBar()
    }
}

extension SettingViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func hideTabBar() {
        tabBarController?.tabBar.isHidden = true
    }
}
