//
//  RepoTableViewCellModel.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

class  RepoTableViewCellModel {
    private let repo: Repo
    
    init(repo: Repo) {
       self.repo = repo
    }
    
    var name: String {
        return repo.name
    }
    
    var description: String {
        return repo.description
    }
    
    var userName: String {
        return repo.owner.login
    }
    
    var desc: String {
        return repo.description
    }
    
    var startCount: String {
        return "\(repo.stargazers_count)"
    }
    
    var language: String {
        return repo.language
    }
}
