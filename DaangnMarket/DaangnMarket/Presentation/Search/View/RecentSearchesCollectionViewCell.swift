//
//  recentSearchesCollectionViewCell.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/02.
//

import UIKit

import SnapKit
import Then

final class RecentSearchesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let searchKeywordLabel = UILabel().then {
        $0.text = "검색어"
    }
    
    private let removeButton = UIButton().then {
        $0.backgroundColor = .clear
        
        var config = UIButton.Configuration.borderless()
        config.image = UIImage(systemName: "multiply")
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 5)
        
        $0.configuration = config
        $0.tintColor = .black
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecentSearchesCollectionViewCell {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        contentView.addSubviews(searchKeywordLabel, removeButton)
        
        searchKeywordLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
        }
        
        removeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-5)
        }
    }
    
    func setDataBind(_ model: RecentSearch) {
        searchKeywordLabel.text = model.content
    }
}
