//
//  OtherProductCollectionViewCell.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/05/05.
//

import UIKit

class OtherProductCollectionViewCell: UICollectionViewCell {
    
//    fileprivate let image: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//
//        return imageView
//    }()
//
//    fileprivate let title: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.textAlignment = .left
//        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
//        titleLabel.textColor = .black
//
//        return titleLabel
//    }()
//
//    fileprivate let price: UILabel = {
//        let priceLabel = UILabel()
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
//        priceLabel.textAlignment = .left
//        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
//        priceLabel.textColor = .black
//
//        return priceLabel
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(image)
//        contentView.addSubview(title)
//        contentView.addSubview(price)
//
//        NSLayoutConstraint.activate([
//            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
//            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
//            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
//            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
//
//            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4),
//            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
//            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 6),
//            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
//
//            price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
//            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
//            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 6),
//            price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
//
//        ])
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    var data: OtherProductModel? {
//        didSet {
//            guard let data = data else { return }
//            image.image = UIImage(systemName: data.image)
//            title.text = data.title
//            price.text = "\(data.price)원"
//        }
//    }
    
    
    let imageView = UIImageView()
    let title = UILabel()
    let price = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(title)
        addSubview(price)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        price.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            price.topAnchor.constraint(equalTo: title.bottomAnchor),
            price.bottomAnchor.constraint(equalTo: bottomAnchor),
            price.leadingAnchor.constraint(equalTo: leadingAnchor),
            price.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
