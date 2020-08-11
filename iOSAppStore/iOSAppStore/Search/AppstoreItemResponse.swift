//
//  AppstoreItemResponse.swift
//  iOSAppStore
//
//  Created by choiminjung on 2020/08/10.
//  Copyright © 2020 Jercy. All rights reserved.
//

import Foundation

typealias AppstoreItems = [AppstoreItem]

struct AppstoreItemResponse: Codable {
    let resultCount : Int
    let results : AppstoreItems
}

struct AppstoreItem: Codable {
    let artworkUrl512: String
    let trackViewUrl: String
    let trackId: Int
    let trackName: String
    let artistName: String
    let description: String
}
