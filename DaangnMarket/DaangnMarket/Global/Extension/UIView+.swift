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
    
    //모든 모서리에 pin을 꽂음
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false   //스토리보드 없을 때 추가해야 함 (크기 이상해짐)
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
    func parentView<T: UIView>(of type: T.Type) -> T? {
      guard let view = superview else {
        return nil
      }
      return (view as? T) ?? view.parentView(of: T.self)
    }
}
