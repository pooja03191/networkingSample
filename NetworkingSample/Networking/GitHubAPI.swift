//
//  GitHubAPI.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

enum GitHubAPI {
    case repositories(language: String)
    case user(login: String)
}

extension GitHubAPI: EndpointType {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .repositories(let language):
            return "/search/repositories?q=+language:\(language)&sort=stars&order=desc"
        case .user(let login):
            return "/users/\(login)"
        }
    }
}
