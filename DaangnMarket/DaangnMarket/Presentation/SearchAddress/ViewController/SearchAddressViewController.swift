//
//  SearchAddressViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/05/22.
//

import UIKit

class SearchAddressViewController: UIViewController {
    
    //MARK: - UI Components
    
    let searchBar = UISearchBar()
    let emptyImage = UIImage()
    let currentLocationButton = UIButton()
    
    let addressListView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setNavigationBar()
        setAddressListView()

    }
    

}

extension SearchAddressViewController {
  
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }

    private func setNavigationBar() {
        // Search Bar
        searchBar.placeholder = "􀊫 동명(읍,면)으로 검색 (ex. 서초동)"
        searchBar.setImage(emptyImage, for: .search, state: .normal)
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        navigationItem.titleView = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
        setCurrentLocationButton()
    }
    
    private func setCurrentLocationButton() {
        currentLocationButton.setTitle("􀐩 현재위치로 찾기", for: .normal)
        currentLocationButton.setTitleColor(.white, for: .normal)
        currentLocationButton.backgroundColor = .orange
        currentLocationButton.layer.cornerRadius = 6
        currentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        currentLocationButton.addTarget(self, action: #selector(getCurrentLocation), for: .touchUpInside)
        view.addSubview(currentLocationButton)
        
        NSLayoutConstraint.activate([
            currentLocationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            currentLocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            currentLocationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8), // Position below the safe area top
            currentLocationButton.heightAnchor.constraint(equalToConstant: 40) // Set a specific height for the button
        ])
        
    }
    
    private func setAddressListView() {
        addressListView.backgroundColor = .red
        view.addSubview(addressListView)
        
        NSLayoutConstraint.activate([
            addressListView.topAnchor.constraint(equalTo: currentLocationButton.bottomAnchor, constant: 20)
        ])
        
        let titleLbl = UILabel()
    }
    
    //MARK: - @objc Methods
    
    @objc fileprivate func getCurrentLocation() {
        print("getCurrentLocation() clicked")
    }
}
