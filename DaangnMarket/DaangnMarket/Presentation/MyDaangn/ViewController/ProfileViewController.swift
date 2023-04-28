//
//  ProfileViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/27.
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
        navigationItem.title = "프로필"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: nil)
        
        navigationController?.navigationBar.tintColor = .black
        
        setNavigationBackground()
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
