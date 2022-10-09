//
//  ModelSearchBook.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/22.
//

import Foundation

// MARK: - Welcome
struct ModelSearchBook: Codable {
    let resCode: Int
    let resMsg: String
    let data: [ModelBookInfo]
}

// MARK: - Datum
struct ModelBookInfo: Codable {
    let title: String
    let price: String?
    let writer: String
    let company: String
    let thumb: String
    let start: String?
    let end: String?
    let rate: Int?
    let page: Int
    let readPage: Int?
    let expectation: Int?
    
}

struct ModelBookDetailData: Codable{
    let resCode: Int
    let resMsg: String
    let data: ModelBookDetail
}
struct ModelBookDetail: Codable{
    let title: String
    let writer: String
    let company: String
    let thumb: String
    let page: Int
    let start: String
    let end: String
    let rate: Int
    let ISBN: String
    let intro: String

}
