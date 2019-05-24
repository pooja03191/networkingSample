//
//  RepoTableViewCell.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var languageOfRepo: UILabel!
    @IBOutlet weak var startCount: UILabel!
    
    var viewModel: RepoTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            repoName.text = viewModel.name
            repoDescription.text = viewModel.description
            languageOfRepo.text = viewModel.language
            startCount.text = viewModel.startCount
        }
    }
    
}
