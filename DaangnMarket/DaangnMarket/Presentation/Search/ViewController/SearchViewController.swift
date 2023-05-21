//
//  SearchViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/17.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Properties
    
    private var recentSearches: [RecentSearch] = RecentSearch.dummies
    
    private var headerIdentifier: String { "RecentSearchesHeaderView" }
    
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

extension SearchViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        // Search Bar
        let searchBar = UISearchBar()
        // TODO: 지금 선택한 동네 알아야함
        searchBar.placeholder = "어느동 근처에서 검색"
        let emptyImage = UIImage()
        searchBar.setImage(emptyImage, for: .search, state: .normal)
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        // navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationItem.titleView = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(
            RecentSearchesCollectionViewCell.self,
            forCellWithReuseIdentifier: RecentSearchesCollectionViewCell.cellIdentifier)
        
        collectionView.register(
            RecentSearchesHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: self.headerIdentifier)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 32
        return CGSize(width: width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: self.headerIdentifier,
                for: indexPath
              ) as? RecentSearchesHeaderView else {return UICollectionReusableView()}
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value: CGFloat = 16.0
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: 최근 검색어 누르면 해당 키워드 검색 결과 띄우기
        print(indexPath)
    }
}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentSearches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecentSearchesCollectionViewCell.cellIdentifier,
            for: indexPath) as! RecentSearchesCollectionViewCell
        cell.setDataBind(recentSearches[indexPath.row])
        return cell
    }
}
