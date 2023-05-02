//
//  SearchViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/17.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
    }
}

extension SearchViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
}
