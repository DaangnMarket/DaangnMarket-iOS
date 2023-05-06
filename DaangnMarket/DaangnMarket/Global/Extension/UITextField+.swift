//
//  UITextField+.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/02.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(_ padding: CGFloat) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = leftView
        self.leftViewMode = .always
    }
}
