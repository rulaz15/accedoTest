//
//  RemoteService.swift
//  Test_RATC
//
//  Created by Raúl Torres on 03/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import Foundation

fileprivate let CHARACTERS_PAGE_LIMIT = 10
fileprivate let COMICS_LIMIT = 20

enum Router {
    
    case characters(offset: Int)
    case characterId(id: Int)
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "gateway.marvel.com"
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .characterId(let id):
            return "/v1/public/characters/\(id)/comics"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .characters(let offset):
            return [
                URLQueryItem(name: "orderBy", value: "name"),
                URLQueryItem(name: "offset", value: "\(offset)"),
                URLQueryItem(name: "limit", value: "\(CHARACTERS_PAGE_LIMIT)"),
                URLQueryItem(name: "apikey", value: NetworkConstants.APIKEY),
                URLQueryItem(name: "ts", value: NetworkConstants.TIMESTAMP),
                URLQueryItem(name: "hash", value: NetworkConstants.HASH)
            ]
        case .characterId:
            return [
                URLQueryItem(name: "limit", value: "\(COMICS_LIMIT)"),
                URLQueryItem(name: "apikey", value: NetworkConstants.APIKEY),
                URLQueryItem(name: "ts", value: NetworkConstants.TIMESTAMP),
                URLQueryItem(name: "hash", value: NetworkConstants.HASH)
            ]
        }
    }
    
    var method: HTTPMethod {
        .get
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}
