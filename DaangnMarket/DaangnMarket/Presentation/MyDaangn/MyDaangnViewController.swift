//
//  MyDaangnViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

class MyDaangnViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setNavigationBar()
    }
}

extension MyDaangnViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        let settingBarButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingButtonDidTap))
        settingBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = settingBarButton
    }
    
    private func setTabBar() {
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - @objc Methods
    
    @objc private func settingButtonDidTap() {
        let settingVC = SettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
}
