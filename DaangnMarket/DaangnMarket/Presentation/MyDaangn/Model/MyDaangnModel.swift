//
//  MyDaangnModel.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/04/20.
//

import Foundation

struct MyDaangnModel {
    var menuImageName: String
    var menuName: String
    
    static func MyDaangnMenus() -> [[MyDaangnModel]] {
        return [
            [MyDaangnModel(menuImageName: "heart", menuName: "관심목록"),
            MyDaangnModel(menuImageName: "newspaper", menuName: "판매내역"),
            MyDaangnModel(menuImageName: "handbag", menuName: "구매내역"),
            MyDaangnModel(menuImageName: "text.book.closed", menuName: "중고거래 가계부")],
            [MyDaangnModel(menuImageName: "square.and.pencil", menuName: "동네 생활 글/댓글")],
            [MyDaangnModel(menuImageName: "house", menuName: "비즈프로필 관리"),
             MyDaangnModel(menuImageName: "megaphone", menuName: "광고"),
             MyDaangnModel(menuImageName: "list.bullet.rectangle.portrait", menuName: "동네홍보 글")],
            [MyDaangnModel(menuImageName: "pin", menuName: "내 동네 설정"),
             MyDaangnModel(menuImageName: "location.viewfinder", menuName: "동네 인증하기"),
             MyDaangnModel(menuImageName: "slider.horizontal.3", menuName: "중고거래 카테고리 설정"),
             MyDaangnModel(menuImageName: "tag", menuName: "알림 키워드 설정"),
             MyDaangnModel(menuImageName: "headphones", menuName: "자주 묻는 질문"),
             MyDaangnModel(menuImageName: "envelope", menuName: "친구초대")]
        ]
    }
}

