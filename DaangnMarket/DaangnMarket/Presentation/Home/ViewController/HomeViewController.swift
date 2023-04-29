//
//  HomeViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeTableView = UITableView()
    var homeData: [HomeTableViewModel] = []
    struct Cells {
        static let tableViewCell = "HomeTableViewCell"
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
//        homeNavigationBar()
//        homeData = fetchHomeTableViewData()
//        configureTableView()
    }
}

extension HomeViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func homeNavigationBar() {
        let noticeImage = UIImage(systemName: "bell")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let noticeButton = UIButton()
        noticeButton.setImage(noticeImage, for: .normal)
        noticeButton.addTarget(self, action: #selector(noticeButtonDidTap), for: .touchUpInside)
        let notice = UIBarButtonItem(customView: noticeButton)
                
        let categoryImage = UIImage(systemName: "line.3.horizontal")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let categoryButton = UIButton()
        categoryButton.setImage(categoryImage, for: .normal)
        categoryButton.addTarget(self, action: #selector(categoryButtonDidTap), for: .touchUpInside)
        let category = UIBarButtonItem(customView: categoryButton)
    
        let searchImage = UIImage(systemName: "magnifyingglass")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let searchButton = UIButton()
        searchButton.setImage(searchImage, for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)
        let search = UIBarButtonItem(customView: searchButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16
        
        navigationItem.rightBarButtonItems = [notice, spacer, category, spacer, search]
    }
    
    func configureTableView() {
        view.addSubview(homeTableView)
        setTableViewDelegate()
        homeTableView.rowHeight = 150
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: Cells.tableViewCell)
        homeTableView.pin(to: view)
        
    }
    
    func setTableViewDelegate() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    //MARK: - @objc Methods
    
    @objc fileprivate func searchButtonDidTap() {
        print("goToSearchVC() called")
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc fileprivate func categoryButtonDidTap() {
        print("goToCategoryVC() called")
//        let searchVC = SearchViewController()
//        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc fileprivate func noticeButtonDidTap() {
        print("goToSearchVC() called")
        let searchVC = NoticeViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
}


//MARK: - Home Table View Dummy Data

extension HomeViewController {
    
    //MARK: - Custom Methods
    
    func fetchHomeTableViewData() -> [HomeTableViewModel] {
        let dummyData1 = HomeTableViewModel(image: UIImage(systemName: "1.circle")!, title: "Title 1입니다. 나ㅣ어ㅜㅁ너ㅏ룸나ㅣㄹasdaffwqdsad", location: "포항시 효자동", time: "1시간 전", price: 1000000, likeCount: 3, chattingCount: 4)
        let dummyData2 = HomeTableViewModel(image: UIImage(systemName: "2.circle")!, title: "Title 2", location: "포항시 효자동", time: "1시간 전", price: 10000, likeCount: 3, chattingCount: 4)
        let dummyData3 = HomeTableViewModel(image: UIImage(systemName: "3.circle")!, title: "Title 3", location: "포항시 효자동", time: "1시간 전", price: 230000, likeCount: 3, chattingCount: 4)
        let dummyData4 = HomeTableViewModel(image: UIImage(systemName: "4.circle")!, title: "Title 4", location: "포항시 효자동", time: "1시간 전", price: 30000, likeCount: 3, chattingCount: 4)
        let dummyData5 = HomeTableViewModel(image: UIImage(systemName: "5.circle")!, title: "Title 5", location: "포항시 효자동", time: "1시간 전", price: 5000, likeCount: 3, chattingCount: 4)
        let dummyData6 = HomeTableViewModel(image: UIImage(systemName: "6.circle")!, title: "Title 6", location: "포항시 효자동", time: "1시간 전", price: 1200, likeCount: 3, chattingCount: 4)
        let dummyData7 = HomeTableViewModel(image: UIImage(systemName: "7.circle")!, title: "Title 7", location: "포항시 효자동", time: "1시간 전", price: 10300, likeCount: 3, chattingCount: 4)
        let dummyData8 = HomeTableViewModel(image: UIImage(systemName: "8.circle")!, title: "Title 8", location: "포항시 효자동", time: "1시간 전", price: 1000000, likeCount: 3, chattingCount: 4)
        let dummyData9 = HomeTableViewModel(image: UIImage(systemName: "9.circle")!, title: "Title 9", location: "포항시 효자동", time: "1시간 전", price: 1200000, likeCount: 3, chattingCount: 4)
        let dummyData10 = HomeTableViewModel(image: UIImage(systemName: "10.circle")!, title: "Title 10", location: "포항시 효자동", time: "1시간 전", price: 6000, likeCount: 3, chattingCount: 4)
        
        return [dummyData1, dummyData2, dummyData3, dummyData4, dummyData5, dummyData6, dummyData7, dummyData8, dummyData9, dummyData10]
    }
    
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.tableViewCell) as! HomeTableViewCell
        
        let home = homeData[indexPath.row]
        
        cell.set(homeTableViewModel: home)
        
        return cell
    }
    
    
}
