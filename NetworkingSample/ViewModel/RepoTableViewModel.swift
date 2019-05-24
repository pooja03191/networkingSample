//
//  RepoTableViewModel.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

class RepoTableViewModel {
    
    private let networking = Networking()
    private var repos: Repos?
    
    func getMostPopularRepos(language: String, completion: (() -> Void)?) {
        
        networking.performNetworkTask(endpoint: GitHubAPI.repositories(language: language), type: Repos.self)
        {
            [weak self] (response) in
                self?.repos = response
                completion?()
        }
    }
    
    func cellViewModel(index: Int) -> RepoTableViewCellModel? {
        guard let repos = repos else { return nil }
        let repoTableviewCellModel = RepoTableViewCellModel(repo: repos.items[index])
        return repoTableviewCellModel
    }
    
    func getRepoCount() -> Int {
        return repos?.items.count ?? 0
    }
    
    func getUserName(index: Int) -> String {
        return repos?.items[index].owner.login ?? ""
    }
}
