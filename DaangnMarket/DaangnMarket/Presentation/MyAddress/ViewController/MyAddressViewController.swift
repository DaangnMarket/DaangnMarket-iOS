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
    private var addressTitle = UILabel()
    private var firstButton = UIButton()
    private var secondButton = UIButton()
    private var homeCityData = HomeCityName(cityName: ["효자동"])

    
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
        
        view.addSubview(myAddressView)
        
        NSLayoutConstraint.activate([
            myAddressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myAddressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myAddressView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        mapView.bottomAnchor.constraint(equalTo: myAddressView.topAnchor).isActive = true
        
        setAddressView()
    }
    
    private func setAddressView() {
        addressTitle.text = "내 동네"
        addressTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        addressTitle.translatesAutoresizingMaskIntoConstraints = false
        addressTitle.tintColor = .black
        
        
        
        setupButton()
        
        
        myAddressView.addSubview(addressTitle)
        myAddressView.addSubview(firstButton)
        myAddressView.addSubview(secondButton)
        
        NSLayoutConstraint.activate([
            addressTitle.topAnchor.constraint(equalTo: myAddressView.topAnchor, constant: 20),
            addressTitle.leadingAnchor.constraint(equalTo: myAddressView.leadingAnchor, constant: 12),
            firstButton.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 12),
            firstButton.leadingAnchor.constraint(equalTo: myAddressView.leadingAnchor, constant: 12),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 12),
            secondButton.leadingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: 8),
            secondButton.trailingAnchor.constraint(equalTo: myAddressView.trailingAnchor, constant: -12),
            secondButton.widthAnchor.constraint(equalTo: firstButton.widthAnchor),
            secondButton.heightAnchor.constraint(equalTo: firstButton.heightAnchor)
        ])
        
    }
    
    private func setupButton() {
        
        firstButton.configuration = .filled()
        firstButton.configuration?.baseBackgroundColor = .orange
        firstButton.configuration?.title = homeCityData.cityName[0]
        firstButton.configuration?.titleAlignment = .leading // title을 leading으로 정렬
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        if homeCityData.cityName.count == 1 {
            secondButton.configuration = .filled()
            secondButton.configuration?.title = "+"
            secondButton.configuration?.baseForegroundColor = .black
            secondButton.configuration?.baseBackgroundColor = .systemGray5
            secondButton.translatesAutoresizingMaskIntoConstraints = false
        } else if homeCityData.cityName.count == 2 {
            secondButton.configuration = .filled()
            secondButton.configuration?.baseBackgroundColor = .orange
            secondButton.configuration?.title = homeCityData.cityName[1]
            secondButton.configuration?.titleAlignment = .leading // title을 leading으로 정렬
            secondButton.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    //MARK: - @objc Methods
    
    @objc fileprivate func closeModalDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func questionButtonDidTap() {
        print("questionButtonDidTap()")
    }
    
}
