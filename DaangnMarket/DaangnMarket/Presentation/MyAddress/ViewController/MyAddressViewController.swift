//
//  MyAddressViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/27.
//

import UIKit

class MyAddressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setNavigationLeftBar()
        setNavigationTitle()
        setNavigationRightBar()
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
    
    //MARK: - @objc Methods
    
    @objc fileprivate func closeModalDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func questionButtonDidTap() {
        print("questionButtonDidTap()")
    }
    
}
