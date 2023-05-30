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
        chatCreateAt.text = " · \(chattingTableViewModel.createdAt)"
        chatProfile.image = chattingTableViewModel.profile
        chatLastestMsg.text = chattingTableViewModel.latestMsg
        chatProductImage.image = chattingTableViewModel.productImage
    }
    
    func configureChatNickname() {
        chatNickname.numberOfLines = 0
        chatNickname.adjustsFontSizeToFitWidth = true
        chatNickname.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    func configureChatLocation() {
        chatLocation.numberOfLines = 0
        chatLocation.adjustsFontSizeToFitWidth = true
        chatLocation.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    func configureChatCreatedAt() {
        chatCreateAt.numberOfLines = 0
        chatCreateAt.adjustsFontSizeToFitWidth = true
        chatCreateAt.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    func configureChatProfile() {
        chatProfile.contentMode = .scaleAspectFit
        chatProfile.clipsToBounds = true
    }
    
    func configureChatLastestMsg() {
        chatLastestMsg.numberOfLines = 0
        chatLastestMsg.adjustsFontSizeToFitWidth = true
    }
    
    func configureChatProductImage() {
        chatProductImage.contentMode = .scaleAspectFit
        chatProductImage.clipsToBounds = true
    }
    
    func setNicknameConstraints() {
        chatNickname.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatNickname.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            chatNickname.leadingAnchor.constraint(equalTo: chatProfile.trailingAnchor, constant: 8)

        ])
    }
    
    func setLocationConstraints() {
        chatLocation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatLocation.leadingAnchor.constraint(equalTo: chatNickname.trailingAnchor, constant: 4),
            chatLocation.bottomAnchor.constraint(equalTo: chatNickname.bottomAnchor)
        ])
    }
    
    func setCreatedAtConstraints() {
        chatCreateAt.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatCreateAt.bottomAnchor.constraint(equalTo: chatLocation.bottomAnchor),
            chatCreateAt.leadingAnchor.constraint(equalTo: chatLocation.trailingAnchor, constant: 4)
        ])
    }
    
    func setProfileConstraints() {
        chatProfile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatProfile.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chatProfile.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            chatProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            chatProfile.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setLastestMsgConstraints() {
        chatLastestMsg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatLastestMsg.leadingAnchor.constraint(equalTo: chatNickname.leadingAnchor),
            chatLastestMsg.topAnchor.constraint(equalTo: chatNickname.bottomAnchor, constant: 16)
        ])
    }
    
    func setProductImageConstraints() {
        chatProductImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatProductImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            chatProductImage.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chatProductImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4),
            chatProductImage.widthAnchor.constraint(equalToConstant: 50)       
        ])
    }
}
