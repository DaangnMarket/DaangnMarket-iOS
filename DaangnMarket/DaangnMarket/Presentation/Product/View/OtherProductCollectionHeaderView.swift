//
//  OtherProductCollectionHeaderView.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/05/05.
//

import Foundation
import UIKit

class OtherProductCollectionHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "OtherProductCollectionHeaderView"
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
