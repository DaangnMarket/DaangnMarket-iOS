//
//  ProductViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/25.
//

import UIKit

class ProductViewController: UIViewController {

    //MARK: - UI Components
    
    var homeData: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        print(homeData)
    }
    

}

extension ProductViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }

}
