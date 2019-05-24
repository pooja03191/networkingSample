//
//  User.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

// Model to get user's data
struct User: Codable {
    let login: String
    let url: String
    let name: String?
    let avatar_url: String?
    let bio: String?
}
