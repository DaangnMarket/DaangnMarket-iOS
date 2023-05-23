//
//  UIAlertController+.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/07.
//

import UIKit

extension UIAlertController {
    
    func addActions(_ actions: UIAlertAction...) {
        actions.forEach { self.addAction($0) }
    }
}
