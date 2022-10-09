//
//  ApiConst.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/13.
//

import Foundation

let SERVER_HOST = "127.0.0.1:8080"
//let SERVER_HOST = "192.168.35.204:8080"
//let SERVER_HOST = "172.30.93.208"

let API_ADDR = "http://\(SERVER_HOST)"

let URL_SEARCH_BOOKALL      = "\(API_ADDR)/searchBookAll"
let URL_SEARCH_BOOKREAD     = "\(API_ADDR)/searchBookRead"
let URL_SEARCH_BOOKREADING  = "\(API_ADDR)/searchBookReading"
let URL_SEARCH_WANNAREAD    = "\(API_ADDR)/searchBookWannaRead"
let URL_BOOKDETAIL          = "\(API_ADDR)/bookDetail"
