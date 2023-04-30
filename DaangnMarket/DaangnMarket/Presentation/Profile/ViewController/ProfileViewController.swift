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
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = setTableViewHeader()
        return tableView
    }()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setNavigationBar()
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
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
