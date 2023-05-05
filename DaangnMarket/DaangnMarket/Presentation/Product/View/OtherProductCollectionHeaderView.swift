//
//  OtherProductCollectionHeaderView.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/05/05.
//

import Foundation
import UIKit

class OtherProductCollectionHeaderView: UICollectionReusableView {
    
    //MARK: - UI Components
    
    static let reuseIdentifier = "OtherProductCollectionHeaderView"
    var testVC: TestViewController?
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        return label
    }()
    let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(headerImageView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            headerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerImageView.widthAnchor.constraint(equalToConstant: 20),
            headerImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        addGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    func addGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
        self.addGestureRecognizer(tapGesture)
    }

    // MARK: - @objc methods
    
    @objc func headerTapped() {
        guard let parentViewController = self.parentViewController else { return }
        let testVC = TestViewController()
        let navigationController = UINavigationController(rootViewController: testVC)
        testVC.navigationController?.isNavigationBarHidden = true
        parentViewController.navigationController?.pushViewController(testVC, animated: true)
    }

}



//MARK: - 해당 View의 부모 ViewController를 가져옴

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
