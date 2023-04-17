//
//  HomeViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        homeNavigationBar()
    }
}

extension HomeViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func homeNavigationBar() {
        let noticeImage = UIImage(systemName: "bell")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let noticeButton = UIButton()
        noticeButton.setImage(noticeImage, for: .normal)
        noticeButton.addTarget(self, action: #selector(goToNoticeVC), for: .touchUpInside)
        let notice = UIBarButtonItem(customView: noticeButton)
                
        let categoryImage = UIImage(systemName: "line.3.horizontal")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let categoryButton = UIButton()
        categoryButton.setImage(categoryImage, for: .normal)
        categoryButton.addTarget(self, action: #selector(goToSearchVC), for: .touchUpInside)
        let category = UIBarButtonItem(customView: categoryButton)
    
        let searchImage = UIImage(systemName: "magnifyingglass")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let searchButton = UIButton()
        searchButton.setImage(searchImage, for: .normal)
        searchButton.addTarget(self, action: #selector(goToSearchVC), for: .touchUpInside)
        let search = UIBarButtonItem(customView: searchButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16
        
        navigationItem.rightBarButtonItems = [notice, spacer, category, spacer, search]
    }
    
    @objc fileprivate func goToSearchVC() {
        print("goToSearchVC() called")
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc fileprivate func goToCategoryVC() {
        print("goToCategoryVC() called")
//        let searchVC = SearchViewController()
//        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc fileprivate func goToNoticeVC() {
        print("goToSearchVC() called")
        let searchVC = NoticeViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
}
