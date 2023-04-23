//
//  HomeTableViewCell.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/20.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    
    var homeImageView = UIImageView()
    var homeTitle = UILabel()
    var homeLocation = UILabel()
    var homeTime = UILabel()
    var homePrice = UILabel()
    var homeLikeCount = UILabel()
    var homeChattingCount = UILabel()
    
    //MARK: - Properties
    var chatImage = UIImageView(image: UIImage(systemName: "message"))
    var likeImage = UIImageView(image: UIImage(systemName: "heart"))
    
    // MARK: - Custom Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(homeImageView)
        addSubview(homeTitle)
        addSubview(homeLocation)
        addSubview(homeTime)
        addSubview(homePrice)
        addSubview(homeLikeCount)
        addSubview(homeChattingCount)
        
        addSubview(chatImage)
        addSubview(likeImage)
        
        
        configureHomeImageView()
        configureHomeTitle()
        configureHomeLocation()
        configureHomePrice()
        configureHomeTime()
        configureHomeLikeCount()
        configureHomeChattingCount()
        
        setImageConstraints()
        setTitleConstraints()
        setLocationConstraints()
        setTimeConstraints()
        setPriceConstraints()
        setLikeCountConstraints()
        setChattingCountConstraints()
        setLikeImageConstraints()
        setChatImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension HomeTableViewCell {
  
    // MARK: - Custom Methods

    func set(homeTableViewModel: HomeTableViewModel) {
        homeImageView.image = homeTableViewModel.image
        homeTitle.text = homeTableViewModel.title
        homeLocation.text = homeTableViewModel.location
        homeTime.text = " · \(homeTableViewModel.time)"
        homePrice.text = "\(homeTableViewModel.price)원"
        homeLikeCount.text = "\(homeTableViewModel.likeCount)"
        homeChattingCount.text = "\(homeTableViewModel.chattingCount)"
    }
    
    func configureHomeImageView() {
        homeImageView.layer.cornerRadius = 10
        homeImageView.clipsToBounds = true
    }
    
    func configureHomeTitle() {
        homeTitle.numberOfLines = 0
        homeTitle.adjustsFontSizeToFitWidth = true
    }
    
    func configureHomeLocation() {
        homeLocation.numberOfLines = 0
        homeLocation.adjustsFontSizeToFitWidth = true
    }
    
    func configureHomePrice() {
        homeLocation.numberOfLines = 0
        homeLocation.adjustsFontSizeToFitWidth = true
        homeLocation.textColor = .gray
        homeLocation.font = UIFont.systemFont(ofSize: 12)
    }
    
    func configureHomeTime() {
        homeTime.numberOfLines = 0
        homeTime.adjustsFontSizeToFitWidth = true
        homeTime.textColor = .gray
        homeTime.font = UIFont.systemFont(ofSize: 12)
        
    }
    
    func configureHomeLikeCount() {
        homeLikeCount.numberOfLines = 0
        homeLikeCount.adjustsFontSizeToFitWidth = true
    }
    
    func configureHomeChattingCount() {
        homeChattingCount.numberOfLines = 0
        homeChattingCount.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        homeImageView.translatesAutoresizingMaskIntoConstraints = false
        homeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        homeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        homeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        homeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        homeImageView.widthAnchor.constraint(equalTo: homeImageView.heightAnchor).isActive = true
    }
    
    func setTitleConstraints() {
        homeTitle.translatesAutoresizingMaskIntoConstraints = false
        homeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        homeTitle.leadingAnchor.constraint(equalTo: homeImageView.trailingAnchor, constant: 12).isActive = true
        homeTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        homeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setLocationConstraints() {
        homeLocation.translatesAutoresizingMaskIntoConstraints = false
        homeLocation.topAnchor.constraint(equalTo: homeTitle.bottomAnchor, constant: 4).isActive = true
        homeLocation.leadingAnchor.constraint(equalTo: homeTitle.leadingAnchor).isActive = true
        
    }
    
    func setTimeConstraints() {
        homeTime.translatesAutoresizingMaskIntoConstraints = false
        homeTime.topAnchor.constraint(equalTo: homeLocation.topAnchor).isActive = true
        homeTime.leadingAnchor.constraint(equalTo: homeLocation.trailingAnchor).isActive = true
    }
    
    func setPriceConstraints() {
        homePrice.translatesAutoresizingMaskIntoConstraints = false
        homePrice.topAnchor.constraint(equalTo: homeLocation.bottomAnchor, constant: 12).isActive = true
        homePrice.leadingAnchor.constraint(equalTo: homeLocation.leadingAnchor).isActive = true
        homePrice.bottomAnchor.constraint(equalTo: homePrice.bottomAnchor, constant: 12).isActive = true
    }
    
    func setLikeImageConstraints() {
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        likeImage.tintColor = .black
        likeImage.topAnchor.constraint(equalTo: homePrice.bottomAnchor, constant: 8).isActive = true
    }
    
    func setLikeCountConstraints() {
        homeLikeCount.translatesAutoresizingMaskIntoConstraints = false
        homeLikeCount.topAnchor.constraint(equalTo: likeImage.topAnchor).isActive = true
        homeLikeCount.leadingAnchor.constraint(equalTo: likeImage.trailingAnchor).isActive = true
        homeLikeCount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    
    func setChattingCountConstraints() {
        homeChattingCount.translatesAutoresizingMaskIntoConstraints = false
        homeChattingCount.topAnchor.constraint(equalTo: likeImage.topAnchor).isActive = true
        homeChattingCount.trailingAnchor.constraint(equalTo: likeImage.trailingAnchor, constant: -28).isActive = true
        homeChattingCount.leadingAnchor.constraint(equalTo: chatImage.trailingAnchor).isActive = true
    }
    
    func setChatImageConstraints() {
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        chatImage.tintColor = .black
        chatImage.topAnchor.constraint(equalTo: likeImage.topAnchor).isActive = true
    }
}
