//
//  Repo.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

// Model to get specific repository data
struct Repo: Codable {
    let name: String
    let description: String
    let owner: User
    let language: String
    let stargazers_count: Int
}
