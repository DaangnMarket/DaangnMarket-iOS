//
//  ChatViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

class ChatViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
    }
}

extension ChatViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
}
