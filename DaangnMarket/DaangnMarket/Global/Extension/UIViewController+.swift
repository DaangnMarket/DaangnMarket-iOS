//
//  UIViewController+.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/28.
//

import UIKit

extension UIViewController {
    
    func setNavigationBackground() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
    }
}
