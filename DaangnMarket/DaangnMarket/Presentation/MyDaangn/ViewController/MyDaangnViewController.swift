//
//  MyDaangnViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

import SnapKit
import Then

class MyDaangnViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var myTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = setTableViewHeader()
        return tableView
    }()
    
    // MARK: - Properties
    
    var myDaangnMenus: [[MyDaangnModel]] = MyDaangnModel.MyDaangnMenus()
    var sectionMenus: [String] = ["나의 거래", "나의 동네생활", "나의 비즈니스", "기타"]

    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setNavigationBar()
        setLayout()
        setDelegate()
        register()
    }
}

extension MyDaangnViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        let settingBarButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingButtonDidTap))
        settingBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = settingBarButton
    }
    
    private func setTabBar() {
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setTableViewHeader() -> UIView {
        let header = MyProfileHeaderView()
        let width = UIScreen.main.bounds.width
        header.frame = CGRect(x: 0, y: 0, width: width, height: 180)
        return header
    }
    
    private func setLayout() {
        view.addSubviews(myTableView)
        
        myTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    private func register() {
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.cellIdentifier)
        myTableView.register(MySectionHeaderView.self, forHeaderFooterViewReuseIdentifier: MySectionHeaderView.reuseIdentifier)
        myTableView.register(MyLineFooterView.self, forHeaderFooterViewReuseIdentifier: MyLineFooterView.reuseIdentifier)
    }
    
    // MARK: - @objc Methods
    
    @objc private func settingButtonDidTap() {
        let settingVC = SettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension MyDaangnViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionMenus.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDaangnMenus[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.cellIdentifier, for: indexPath) as! MyTableViewCell
        cell.setDataBind(myDaangnMenus[indexPath.section][indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MyDaangnViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MySectionHeaderView.reuseIdentifier) as! MySectionHeaderView
        header.setDataBind(sectionMenus[section])
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyLineFooterView.reuseIdentifier)
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == sectionMenus.count - 1 {
            return CGFloat(0)
        } else {
            return CGFloat(5)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}
