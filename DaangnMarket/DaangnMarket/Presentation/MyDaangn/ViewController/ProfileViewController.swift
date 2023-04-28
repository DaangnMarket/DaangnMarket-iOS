//
//  ProfileViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setNavigationBar()
//        hideTabBar()
    }
}

extension ProfileViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white 
    }
    
    private func setLayout() {
        
    }
    
    private func setNavigationBar() {
        setNavigationBackground()
        
        navigationItem.title = "프로필"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: nil)
        
        navigationController?.navigationBar.tintColor = .black
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
