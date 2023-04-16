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
        let homeViewController = HomeViewController()
        let homeTab = UINavigationController(rootViewController: homeViewController)
        homeTab.isNavigationBarHidden = true
        homeTab.tabBarItem  = UITabBarItem(title: "홈", image: UIImage(named: "TabHome")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabHomeSelected")?.withRenderingMode(.alwaysOriginal))

        let townLifeViewController = TownLifeViewController()
        let townLifeTab = UINavigationController(rootViewController: townLifeViewController)
        townLifeTab.isNavigationBarHidden = true
        townLifeTab.tabBarItem  = UITabBarItem(title: "동네 생활", image: UIImage(named: "TabTownLife")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabTownLifeSelected")?.withRenderingMode(.alwaysOriginal))

        let nearMeViewController = NearMeViewController()
        let nearMeTab = UINavigationController(rootViewController: nearMeViewController)
        nearMeTab.isNavigationBarHidden = true
        nearMeTab.tabBarItem  = UITabBarItem(title: "내 근처", image: UIImage(named: "TabNearMe")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabNearMeSelected")?.withRenderingMode(.alwaysOriginal))
        
        let chatViewController = ChatViewController()
        let chattingTab = UINavigationController(rootViewController: chatViewController)
        chattingTab.isNavigationBarHidden = true
        chattingTab.tabBarItem  = UITabBarItem(title: "채팅", image: UIImage(named: "TabChatting")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabChattingSelected")?.withRenderingMode(.alwaysOriginal))
        
        let myDaangnViewController = MyDaangnViewController()
        let myDaangnTab = UINavigationController(rootViewController: myDaangnViewController)
        myDaangnTab.isNavigationBarHidden = true
        myDaangnTab.tabBarItem  = UITabBarItem(title: "내", image: UIImage(named: "TabMyDaangn")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TabMyDaangnSelected")?.withRenderingMode(.alwaysOriginal))

        let tabs = [homeTab, townLifeTab, nearMeTab, chattingTab, myDaangnTab]

        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.clipsToBounds = true
    }
}

extension UITabBar {
    
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
