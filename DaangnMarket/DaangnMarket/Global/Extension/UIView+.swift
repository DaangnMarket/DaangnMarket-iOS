//
//  UIView+.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}
