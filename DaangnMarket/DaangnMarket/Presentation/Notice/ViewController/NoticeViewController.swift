//
//  NoticeViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/17.
//

import UIKit

class NoticeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var noticeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 124
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = setTableViewHeader()
        return tableView
    }()

    // MARK: - Properties
    
    var notices: [NoticeTableViewModel] {
        NoticeTableViewModel.dummies
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setNavigationBar()
        setLayout()
        setDelegate()
        register()
    }
}

extension NoticeViewController {
    
    // MARK: - Custom Methods
    
    private func setTableViewHeader() -> UIView {
        let header = KeywordHeaderView()
        let width = UIScreen.main.bounds.width
        header.frame = CGRect(x:0, y:0, width: width, height: 50)
        return header
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        let backBarButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(UINavigationController.popViewController(animated:)))

        let editBarButton = UIBarButtonItem(
            title: "편집",
            style: .plain,
            target: self,
            action: #selector(editButtonDidTap))
        editBarButton.tintColor = .black
        
        navigationItem.backBarButtonItem = backBarButton
        navigationItem.title = "알림"
        navigationItem.rightBarButtonItem = editBarButton
    }
    
    private func setLayout() {
        view.addSubviews(noticeTableView)
        
        noticeTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        noticeTableView.dataSource = self
        noticeTableView.delegate = self
    }
    
    private func register() {
        noticeTableView.register(NoticeTableViewCell.self, forCellReuseIdentifier: NoticeTableViewCell.cellIdentifier)
    }
    
    // MARK: - @objc Methods
    @objc private func editButtonDidTap() {
        print("edit button did tap")
    }
}

// MARK: - UITableViewDataSource

extension NoticeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticeTableViewCell.cellIdentifier, for: indexPath) as! NoticeTableViewCell
        cell.setDataBind(notices[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate

extension NoticeViewController: UITableViewDelegate {
    
}
