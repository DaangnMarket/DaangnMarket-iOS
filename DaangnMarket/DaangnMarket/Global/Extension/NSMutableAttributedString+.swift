//
//  NSMutableAttributedString+.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/30.
//

import Foundation

extension NSMutableAttributedString {

    func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }

    func regular(string: String, textColor: UIColor? = .black, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: textColor ?? .black]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}
