//
//  ProfileViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = setTableViewHeader()
        return tableView
    }()
    
    // MARK: - Properties
    
    let categoryNames = ["활동 배지 9개", "판매상품 0개", "받은 매너 평가", "받은 거래 후기 0"]

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setNavigationBar()
        setDelegate()
        register()
    }
}

extension ProfileViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white 
    }
    
    private func setLayout() {
        view.addSubviews(profileTableView)
        
        profileTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setTableViewHeader() -> UIView {
        let header = ProfileHeaderView()
        let width = UIScreen.main.bounds.width
        header.frame = CGRect(x: 0, y: 0, width: width, height: 310)
        return header
    }
    
    private func setNavigationBar() {
        setNavigationBackground()
        
        navigationItem.title = "프로필"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonDidTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: nil)
        
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setDelegate() {
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
    
    private func register() {
        profileTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.cellIdentifier)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.cellIdentifier, for: indexPath) as! ProfileTableViewCell
        cell.setDataBind(categoryNames[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
