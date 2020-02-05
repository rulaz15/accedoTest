//
//  RemoteService.swift
//  Test_RATC
//
//  Created by Raúl Torres on 03/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import Foundation

fileprivate let CHARACTERS_PAGE_LIMIT = 10
fileprivate let APIKEY = "ce7ee788e97d280690169aae0bfcde76"

enum Router {
    case characters
    case characterId
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "gateway.marvel.com"
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .characterId:
            return ""
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .characters:
            return [
                URLQueryItem(name: "orderBy", value: "name"),
                URLQueryItem(name: "limit", value: "\(CHARACTERS_PAGE_LIMIT)"),
                URLQueryItem(name: "apiKey", value: APIKEY)
            ]
        case .characterId:
            return []
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}
