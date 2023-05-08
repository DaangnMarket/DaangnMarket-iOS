//
//  RecentSearchesHeaderView.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/02.
//

import UIKit

final class RecentSearchesHeaderView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let title = UILabel().then {
        $0.text = "최근 검색어"
    }
    
    private let deleteAllButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        
        var titleAttr = AttributedString("모두 지우기")
        titleAttr.font = .systemFont(ofSize: UIFont.smallSystemFontSize, weight: .semibold)
        titleAttr.foregroundColor = .lightGray
        
        config.attributedTitle = titleAttr
        
        $0.configuration = config
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecentSearchesHeaderView {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        addSubviews(title, deleteAllButton)
        
        title.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        deleteAllButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
}
