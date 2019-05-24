//
//  UserViewModel.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

class UserViewModel {
    
    private let networking = Networking()
    private var user: User?
    
    func getUser(login: String, completion: (() -> Void)?) {
        
        networking.performNetworkTask(endpoint: GitHubAPI.user(login: login), type: User.self) {
            [weak self] (response) in
            self?.user = response
            completion?()
        }
    }
    
    var userName: String {
        return user?.login ?? ""
    }
    
    var name: String {
        return user?.name ?? ""
    }
    var avatar_url: URL? {
        return URL(string: user?.avatar_url ?? "")
    }
    
    var bio: String?{
        return user?.bio ?? ""
    }
}
