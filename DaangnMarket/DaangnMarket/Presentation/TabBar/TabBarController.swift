//
//  TabBarController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

import SnapKit
import Then

class TabBarController: UITabBarController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
}

extension TabBarController {
    
    // MARK: - Custom Methods
    
    private func setTabBar() {
//        let homeViewController = HomeViewController()
//        let homeTab = UINavigationController(rootViewController: homeViewController)
//        homeTab.isNavigationBarHidden = true
//        homeTab.tabBarItem  = UITabBarItem(title: "홈", image: UIImage(named: "TabHome")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabHomeSelected")?.withRenderingMode(.alwaysOriginal))
//        
//        let townLifeViewController = TownLifeViewController()
//        let townLifeTab = UINavigationController(rootViewController: townLifeViewController)
//        townLifeTab.isNavigationBarHidden = true
//        townLifeTab.tabBarItem  = UITabBarItem(title: "동네 생활", image: UIImage(named: "TabTownLife")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabTownLifeSelected")?.withRenderingMode(.alwaysOriginal))
//        
//        let NearMeViewController = NearMeViewController()
//        let nearMeTab = UINavigationController(rootViewController: NearMeViewController)
//        nearMeTab.isNavigationBarHidden = true
//        nearMeTab.tabBarItem  = UITabBarItem(title: "내 근처", image: UIImage(named: "TabNearMe")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabNearMeSelected")?.withRenderingMode(.alwaysOriginal))
//        
//        let tabs = [homeTab, townLifeTab, nearMeTab]
//
//        self.setViewControllers(tabs, animated: false)
//        
//        tabBar.backgroundColor = .white
//        tabBar.tintColor = .black
    }
}
