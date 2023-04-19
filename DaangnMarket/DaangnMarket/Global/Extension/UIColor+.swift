//
//  UIColor+.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

extension UIColor {

    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    
    class var daangnOrange: UIColor {
        return UIColor(r: 237, g: 119, b: 50)
    }
    
    class var daangnGray: UIColor {
        return UIColor(r: 235, g: 236, b: 238)
    }
}
