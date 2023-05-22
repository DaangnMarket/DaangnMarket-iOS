//
//  SearchAddressViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/05/22.
//

import UIKit

class SearchAddressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setNavigationBar()

    }
    

}

extension SearchAddressViewController {
  
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }

    private func setNavigationBar() {
        // Search Bar
        let searchBar = UISearchBar()
        searchBar.placeholder = "􀊫 동명(읍,면)으로 검색 (ex. 서초동)"
        let emptyImage = UIImage()
        searchBar.setImage(emptyImage, for: .search, state: .normal)
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        // navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationItem.titleView = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
