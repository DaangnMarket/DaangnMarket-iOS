//
//  RecentSearches.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/02.
//

import Foundation

struct RecentSearch {
    var content: String
}

extension RecentSearch {
    static var dummies: [RecentSearch] {
        [
            RecentSearch(content: "냉장고"),
            RecentSearch(content: "세탁기"),
            RecentSearch(content: "미니 냉장고"),
            RecentSearch(content: "스캐너"),
            RecentSearch(content: "스탑워치"),
            RecentSearch(content: "매트리스"),
            RecentSearch(content: "안대")
        ]
    }
}
