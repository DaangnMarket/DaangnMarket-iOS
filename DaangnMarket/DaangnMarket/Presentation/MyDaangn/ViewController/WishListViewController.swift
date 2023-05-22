//
//  WishListViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/22.
//

import UIKit

import SnapKit
import Then

final class WishListViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var wishTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setNavigationBar()
        setLayout()
        register()
        setDelegate()
    }
}

extension WishListViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        setNavigationBackground()
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonDidTap))
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "관심목록"
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func setLayout() {
        view.addSubview(wishTableView)
        
        wishTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func register() {
        wishTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
    }
    
    private func setDelegate() {
        wishTableView.dataSource = self
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource

extension WishListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier, for: indexPath) as! HomeTableViewCell
        return cell
    }
}
