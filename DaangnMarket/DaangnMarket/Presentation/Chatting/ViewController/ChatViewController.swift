//
//  ChatViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

class ChatViewController: UIViewController {

    //MARK: - UI Components
    
    var chatTableView = UITableView()
    var chatData: [ChattingTableViewModel] = []
    
    struct Cells {
        static let tableViewCell = "ChattingTableViewCell"
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setNavigationBar()
        chatData = fetchChattingTableViewData()
        configureTableView()
    }
}

extension ChatViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        navigationLeftBar()
        navigationRightBar()
    }
    
    private func navigationLeftBar() {
        let titleLabel = UILabel()
        titleLabel.text = "채팅"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    private func navigationRightBar() {
        let qrImage = UIImage(systemName: "barcode.viewfinder")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let qrButton = UIButton()
        qrButton.setImage(qrImage, for: .normal)
        qrButton.addTarget(self, action: #selector(qrButtonDidTap), for: .touchUpInside)
        let qr = UIBarButtonItem(customView: qrButton)
        
        let noticeImage = UIImage(systemName: "bell")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let noticeButton = UIButton()
        noticeButton.setImage(noticeImage, for: .normal)
        noticeButton.addTarget(self, action: #selector(noticeButtonDidTap), for: .touchUpInside)
        let notice = UIBarButtonItem(customView: noticeButton)
        
        self.navigationItem.rightBarButtonItems = [notice, qr]
        
    }
    
    func configureTableView() {
        view.addSubview(chatTableView)
        setTableViewDelegate()
        chatTableView.rowHeight = 100
        chatTableView.register(ChattingTableViewCell.self, forCellReuseIdentifier: Cells.tableViewCell)
        chatTableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    //MARK: @objc Methods
    
    @objc fileprivate func qrButtonDidTap() {
        
    }
    
    @objc fileprivate func noticeButtonDidTap() {
        
    }
}

//MARK: - Chat Table View Dummy Data

extension ChatViewController {
    
    //MARK: - Custom Methods

    func fetchChattingTableViewData() -> [ChattingTableViewModel] {
        let dummy1 = ChattingTableViewModel(id: 1, nickname: "알파고", profile: (UIImage(systemName: "person.crop.circle") ?? UIImage(systemName: "app.fill"))!, address: "삼성동", createdAt: "6달 전", latestMsg: "영수증은 없습니다 ^_^", productImage: (UIImage(systemName: "doc.plaintext") ?? UIImage(systemName: "app.fill"))!)
        let dummy2 = ChattingTableViewModel(id: 1, nickname: "다파라", profile: (UIImage(systemName: "person.crop.circle") ?? UIImage(systemName: "app.fill"))!, address: "삼성동", createdAt: "6달 전", latestMsg: "영수증은 없습니다 ^_^", productImage: (UIImage(systemName: "doc.plaintext") ?? UIImage(systemName: "app.fill"))!)
        let dummy3 = ChattingTableViewModel(id: 1, nickname: "motoro", profile: (UIImage(systemName: "person.crop.circle") ?? UIImage(systemName: "app.fill"))!, address: "삼성동", createdAt: "6달 전", latestMsg: "영수증은 없습니다 ^_^", productImage: (UIImage(systemName: "doc.plaintext") ?? UIImage(systemName: "app.fill"))!)
        let dummy4 = ChattingTableViewModel(id: 1, nickname: "서지", profile: (UIImage(systemName: "person.crop.circle") ?? UIImage(systemName: "app.fill"))!, address: "삼성동", createdAt: "6달 전", latestMsg: "영수증은 없습니다 ^_^", productImage: (UIImage(systemName: "doc.plaintext") ?? UIImage(systemName: "app.fill"))!)
        
        return [dummy1, dummy2, dummy3, dummy4]
    }
}

//MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let productId = homeData[indexPath.row].id
//        let productUserId = homeData[indexPath.row].userId
//        let productController = ProductViewController()
//        productController.homeData = productId
//        productController.homeUserId = productUserId
//
//        productController.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(productController, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.tableViewCell) as! ChattingTableViewCell
        
        let chat = chatData[indexPath.row]
        
        cell.set(chattingTableViewModel: chat)
        return cell
    }
}
