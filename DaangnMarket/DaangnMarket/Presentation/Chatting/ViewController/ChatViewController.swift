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
        setNavigationBar()
    }
}

extension ChatViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        navigationLeftBar()
        navigationRightBar()
    }
    
    private func navigationLeftBar() {
        let titleLabel = UILabel()
        titleLabel.text = "채팅"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    private func navigationRightBar() {
        let qrImage = UIImage(systemName: "barcode.viewfinder")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let qrButton = UIButton()
        qrButton.setImage(qrImage, for: .normal)
        qrButton.addTarget(self, action: #selector(qrButtonDidTap), for: .touchUpInside)
        let qr = UIBarButtonItem(customView: qrButton)
        
        let noticeImage = UIImage(systemName: "bell")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let noticeButton = UIButton()
        noticeButton.setImage(noticeImage, for: .normal)
        noticeButton.addTarget(self, action: #selector(noticeButtonDidTap), for: .touchUpInside)
        let notice = UIBarButtonItem(customView: noticeButton)
        
        self.navigationItem.rightBarButtonItems = [notice, qr]
        
    }
    
    
    
    //MARK: @objc Methods
    
    @objc fileprivate func qrButtonDidTap() {
        
    }
    
    @objc fileprivate func noticeButtonDidTap() {
        
    }
}
