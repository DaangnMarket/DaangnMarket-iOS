//
//  UITableViewCell+.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

extension UITableViewCell {

    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    var tableView: UITableView? {
      return parentView(of: UITableView.self)
    }
}
