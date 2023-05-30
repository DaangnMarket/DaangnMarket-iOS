//
//  WriteUsedViewController.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/06.
//

import UIKit

import SnapKit
import Then

final class WriteUsedViewController: UIViewController {
    
    enum CommonTableViewSetting {
        static let edgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    // MARK: - UI Components
    
    private lazy var writeTableView: UITableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorInset = CommonTableViewSetting.edgeInsets
        $0.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: $0.frame.width, height: 1))
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


extension WriteUsedViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        setNavigationLeftBarButton()
        setNavigationTitle()
        setNavigationRightBarButton()
    }
    
    private func setNavigationLeftBarButton() {
        let backBarButton = UIBarButtonItem(
            image: UIImage(systemName: "multiply"),
            style: .plain,
            target: self,
            action: #selector(closeButtonDidTap))
        backBarButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backBarButton
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "내 물건 팔기"
    }
    
    private func setNavigationRightBarButton() {
        let createBarButton = UIBarButtonItem(
            title: "완료",
            style: .plain,
            target: self,
            action: #selector(createButtonDidTap))
        createBarButton.tintColor = UIColor.daangnOrange
        navigationItem.rightBarButtonItem = createBarButton
    }
    
    private func setLayout() {
        view.addSubview(writeTableView)
        
        writeTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        writeTableView.dataSource = self
        writeTableView.delegate = self
    }
    
    private func register() {
        writeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        writeTableView.register(WriteTitleTextCell.self, forCellReuseIdentifier: WriteTitleTextCell.cellIdentifier)
        writeTableView.register(WritePriceTextCell.self, forCellReuseIdentifier: WritePriceTextCell.cellIdentifier)
    }
    
    // MARK: - @objc Methods
    
    @objc private func closeButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func createButtonDidTap() {
        print("create button did tap")
    }
}

// MARK: - UITableViewDataSource

extension WriteUsedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        switch indexPath.row {
        case 0:
            cell = defaultCell(content: "사진", indexPath: indexPath)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: WriteTitleTextCell.cellIdentifier, for: indexPath) as! WriteTitleTextCell
        case 2:
            cell = defaultCell(content: "카테고리", indexPath: indexPath)
            cell.accessoryType = .checkmark
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: WritePriceTextCell.cellIdentifier, for: indexPath) as! WritePriceTextCell
        case 4:
            cell = defaultCell(content: "설명", indexPath: indexPath)
        default:
            cell = defaultCell(content: "개발중...", indexPath: indexPath)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    private func defaultCell(content: String, indexPath: IndexPath) -> UITableViewCell {
        let cell = writeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = content
        cell.textLabel?.textColor = .lightGray
        return cell
    }
}


// MARK: - UITableViewDelegate

extension WriteUsedViewController: UITableViewDelegate {
}