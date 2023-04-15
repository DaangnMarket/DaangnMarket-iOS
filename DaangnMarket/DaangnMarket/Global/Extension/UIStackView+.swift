//
//  UIStackView+.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

extension UIStackView {

    func addArrangedSubViews(_ views: UIView...) {
        views.forEach {  self.addArrangedSubview($0) }
    }
}
