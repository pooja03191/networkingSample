//
//  EndpointType.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseURL: URL {get}
    var path: String {get}
}
