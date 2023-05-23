//
//  HomeViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/16.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - UI Components
    
    var homeTableView = UITableView()
    var homeData: [HomeTableViewModel] = []
    var homeCityData = HomeCityName(cityName: ["효자동"])
    
    struct Cells {
        static let tableViewCell = "HomeTableViewCell"
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
//        homeNavigationRightBar()
////        homeNavigationLeftBar()
//        homeData = fetchHomeTableViewData()
//        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeNavigationLeftBar()
        
    }
}

extension HomeViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func homeNavigationRightBar() {
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
    
    private func homeNavigationLeftBar() {
        let cityButton = UIButton()
        cityButton.setTitle("\(homeCityData.cityName.first!) ", for: .normal)
        cityButton.setTitleColor(.black, for: .normal)
        cityButton.setImage(UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        // 수동으로 레이아웃 구성
        let imageSize = cityButton.imageView?.image?.size ?? .zero
        let titleSize = cityButton.titleLabel?.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)) ?? .zero
        let spacing: CGFloat = 8
        cityButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width - spacing/2, bottom: 0, right: imageSize.width + spacing/2)
        cityButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: titleSize.width + spacing/2, bottom: 0, right: -titleSize.width - spacing/2)
        
        cityButton.addTarget(self, action: #selector(cityButtonDidTap), for: .touchUpInside)
        
        let city = UIBarButtonItem(customView: cityButton)
        
        navigationItem.leftBarButtonItem = city
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
        let writeUsedVC = WriteUsedViewController()
//        hidesBottomBarWhenPushed = true
        let navigationController = UINavigationController(rootViewController: writeUsedVC)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .coverVertical
        present(navigationController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc fileprivate func noticeButtonDidTap() {
        print("goToSearchVC() called")
        let searchVC = NoticeViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc fileprivate func cityButtonDidTap() {
        print("cityButtonDidTap() called")
        if homeCityData.cityName.count == 1 {
            let myAddressVC = MyAddressViewController()
            let navigationController = UINavigationController(rootViewController: myAddressVC)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .coverVertical
            self.present(navigationController, animated: true, completion: nil)
        } else if homeCityData.cityName.count == 2 {
            print("2222222")
        }
    }
}


//MARK: - Home Table View Dummy Data

extension HomeViewController {
    
    //MARK: - Custom Methods
    
    func fetchHomeTableViewData() -> [HomeTableViewModel] {
        let dummyData1 = HomeTableViewModel(id: 1, title: "포항시 효자동 ㅁ니아ㅜㅁ니ㅏ룸지라ㅜㄴ미ㅏ루", image: (UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill"))!, address: "효자동", createdAt: "3시간 전", price: 100000, likes: 3, numberOfChat: 4, userId: 32)
        let dummyData2 = HomeTableViewModel(id: 2, title: "물건 싸게 팝니당미나움ㄴ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 4, numberOfChat: 12, userId: 52)
        let dummyData3 = HomeTableViewModel(id: 3, title: "ㅁ니ㅏ움니아당미나움ㄴ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 4, numberOfChat: 12, userId: 12565)
        let dummyData4 = HomeTableViewModel(id: 4, title: "ㅁ니ㅏ움니아당미나움ㄴ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 6, numberOfChat: 2, userId: 56)
        let dummyData5 = HomeTableViewModel(id: 5, title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 5, numberOfChat: 2, userId: 5)
        let dummyData6 = HomeTableViewModel(id: 6, title: "바ㅓㅈ바주디ㅏ주기ㅏㅜ민라ㅜ민", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "효자동", createdAt: "1시간 전", price: 20000, likes: 5, numberOfChat: 2, userId: 2532)
        let dummyData7 = HomeTableViewModel(id: 5, title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 5, numberOfChat: 2, userId: 87)
        let dummyData8 = HomeTableViewModel(id: 5, title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 5, numberOfChat: 2, userId: 51)
        let dummyData9 = HomeTableViewModel(id: 5, title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 5, numberOfChat: 2, userId: 23)
        let dummyData10 = HomeTableViewModel(id: 5, title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: UIImage(systemName: "square.fill") ?? UIImage(systemName: "app.fill")!, address: "연일읍", createdAt: "1시간 전", price: 20000, likes: 5, numberOfChat: 2, userId: 7)
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productId = homeData[indexPath.row].id
        let productUserId = homeData[indexPath.row].userId
        let productController = ProductViewController()
        productController.homeData = productId
        productController.homeUserId = productUserId
        
        productController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(productController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.tableViewCell) as! HomeTableViewCell
        
        let home = homeData[indexPath.row]
        
        cell.set(homeTableViewModel: home)
        return cell
    }
}
