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
    
    private func makeTabBar(viewController: UIViewController,
                            title: String,
                            tabBarImage: UIImage,
                            tabBarImageSelected : UIImage) -> UIViewController {
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImage.withRenderingMode(.alwaysOriginal),
                                      selectedImage: tabBarImageSelected.withRenderingMode(.alwaysOriginal))
        return tab
    }
    
    private func setTabBar() {
        let homeTab = makeTabBar(viewController: HomeViewController(),
                                 title: "홈",
                                 tabBarImage: UIImage(named: "TabHome")!,
                                 tabBarImageSelected: UIImage(named: "TabHomeSelected")!)
        
        let townLifeTab = makeTabBar(viewController: TownLifeViewController(),
                                 title: "동네 생활",
                                 tabBarImage: UIImage(named: "TabTownLife")!,
                                 tabBarImageSelected: UIImage(named: "TabTownLifeSelected")!)
        
        let nearMeTab = makeTabBar(viewController: NearMeViewController(),
                                 title: "내 근처",
                                 tabBarImage: UIImage(named: "TabNearMe")!,
                                 tabBarImageSelected: UIImage(named: "TabNearMeSelected")!)
        
        let chattingTab = makeTabBar(viewController: ChatViewController(),
                                 title: "채팅",
                                 tabBarImage: UIImage(named: "TabChatting")!,
                                 tabBarImageSelected: UIImage(named: "TabChattingSelected")!)
        
        let myDaangnTab = makeTabBar(viewController: MyDaangnViewController(),
                                 title: "나의 당근",
                                 tabBarImage: UIImage(named: "TabMyDaangn")!,
                                 tabBarImageSelected: UIImage(named: "TabMyDaangnSelected")!)

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
