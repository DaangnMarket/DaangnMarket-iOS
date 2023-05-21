//
//  NoticeTableViewModel.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/01.
//

import UIKit

struct NoticeTableViewModel {
    var title: String
    var image: String
    var address: String
    var createdAt: String
    
    static var dummies: [Self] {
        let dummyData1 = NoticeTableViewModel(title: "포항시 효자동 ㅁ니아ㅜㅁ니ㅏ룸지라ㅜㄴ미ㅏ루", image: "square.fill", address: "효자동", createdAt: "3시간 전")
        let dummyData2 = NoticeTableViewModel(title: "물건 싸게 팝니당미나움ㄴ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        let dummyData3 = NoticeTableViewModel(title: "ㅁ니ㅏ움니아당미나움ㄴ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        let dummyData4 = NoticeTableViewModel(title: "ㅁ니ㅏ움니아당미나움ㄴ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        let dummyData5 = NoticeTableViewModel(title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        let dummyData6 = NoticeTableViewModel(title: "바ㅓㅈ바주디ㅏ주기ㅏㅜ민라ㅜ민", image: "square.fill", address: "효자동", createdAt: "1시간 전")
        let dummyData7 = NoticeTableViewModel(title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        let dummyData8 = NoticeTableViewModel(title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        let dummyData9 = NoticeTableViewModel(title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        let dummyData10 = NoticeTableViewModel(title: "미나웁지ㅏ비ㅔㄷ쟈ㅜㅈ데ㅑㅜㅎ", image: "square.fill", address: "연일읍", createdAt: "1시간 전")
        
        return [dummyData1, dummyData2, dummyData3, dummyData4, dummyData5, dummyData6, dummyData7, dummyData8, dummyData9, dummyData10]
    }
}
