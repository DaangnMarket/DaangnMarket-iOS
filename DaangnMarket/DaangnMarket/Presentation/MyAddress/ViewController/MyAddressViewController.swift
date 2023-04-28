//
//  MyAddressViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/27.
//

import UIKit

class MyAddressViewController: UIViewController {
    
    //MARK: - UI Components
    
    private var mapView = UIView()
    private var myAddressView = UIView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setNavigationLeftBar()
        setNavigationTitle()
        setNavigationRightBar()
        
        setMapView()
        setMyAddressView()
    }
}

extension MyAddressViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationLeftBar() {
        // 왼쪽 상단에 닫기 버튼을 추가합니다.
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeModalDidTap))
        closeButton.tintColor = .black
        navigationItem.leftBarButtonItem = closeButton
    }
    
    private func setNavigationTitle() {
        title = "내 동네 설정"
    }
    
    private func setNavigationRightBar() {
        let questionButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(questionButtonDidTap))
        questionButton.tintColor = .black
        navigationItem.rightBarButtonItem = questionButton
    }
    
    private func setMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.backgroundColor = .red
        
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.6)
        ])

    }
    
    private func setMyAddressView() {
        myAddressView.translatesAutoresizingMaskIntoConstraints = false
        myAddressView.backgroundColor = .blue

        view.addSubview(myAddressView)
        
        NSLayoutConstraint.activate([
            myAddressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myAddressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myAddressView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        mapView.bottomAnchor.constraint(equalTo: myAddressView.topAnchor).isActive = true

    }
    
    //MARK: - @objc Methods
    
    @objc fileprivate func closeModalDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func questionButtonDidTap() {
        print("questionButtonDidTap()")
    }
    
}
