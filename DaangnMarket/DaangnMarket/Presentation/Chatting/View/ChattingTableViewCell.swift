//
//  ChattingTableViewCell.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/05/29.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {

    //MARK: - UI Components
    
    var chatNickname = UILabel()
    var chatLocation = UILabel()
    var chatCreateAt = UILabel()
    var chatProfile = UIImageView()
    var chatLastestMsg = UILabel()
    var chatProductImage = UIImageView()

    //MARK: - Custom Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews(chatNickname, chatLocation, chatCreateAt, chatProfile, chatLastestMsg, chatProductImage)
        
        configureChatNickname()
        configureChatLocation()
        configureChatCreatedAt()
        configureChatProfile()
        configureChatLastestMsg()
        configureChatProductImage()
        
        setNicknameConstraints()
        setLocationConstraints()
        setCreatedAtConstraints()
        setProfileConstraints()
        setLastestMsgConstraints()
        setProductImageConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChattingTableViewCell {
    
    //MARK: - Custom Methods
    
    func set(chattingTableViewModel: ChattingTableViewModel) {
        chatNickname.text = chattingTableViewModel.nickname
        chatLocation.text = chattingTableViewModel.address
        chatCreateAt.text = chattingTableViewModel.createdAt
        chatProfile.image = chattingTableViewModel.profile
        chatLastestMsg.text = chattingTableViewModel.latestMsg
        chatProductImage.image = chattingTableViewModel.productImage
    }
    
    func configureChatNickname() {
        chatNickname.numberOfLines = 0
        chatNickname.adjustsFontSizeToFitWidth = true
    }
    
    func configureChatLocation() {
        chatLocation.numberOfLines = 0
        chatLocation.adjustsFontSizeToFitWidth = true
    }
    
    func configureChatCreatedAt() {
        chatCreateAt.numberOfLines = 0
        chatCreateAt.adjustsFontSizeToFitWidth = true
    }
    
    func configureChatProfile() {
        chatProfile.layer.cornerRadius = 20
        chatProfile.clipsToBounds = true
    }
    
    func configureChatLastestMsg() {
        chatLastestMsg.numberOfLines = 0
        chatLastestMsg.adjustsFontSizeToFitWidth = true
    }
    
    func configureChatProductImage() {
        chatProductImage.layer.cornerRadius = 20
        chatProductImage.clipsToBounds = true
    }
    
    func setNicknameConstraints() {
        chatNickname.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatNickname.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            chatNickname.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12)
            
        ])
    }
    
    func setLocationConstraints() {
        
    }
    
    func setCreatedAtConstraints() {
        
    }
    
    func setProfileConstraints() {
        
    }
    
    func setLastestMsgConstraints() {
        
    }
    
    func setProductImageConstraints() {
        
    }
}
