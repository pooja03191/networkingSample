//
//  Repos.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

// Model to get the count and repositories data
struct Repos: Codable {
    //var total_Count: Int
    var items: [Repo]
}
