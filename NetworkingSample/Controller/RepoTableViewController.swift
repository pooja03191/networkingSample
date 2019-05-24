//
//  RepoTableViewController.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import UIKit
import SVProgressHUD

class RepoTableViewController: UITableViewController {

    private let viewModel = RepoTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()
        
        viewModel.getMostPopularRepos(language: "Swift") { [weak self] in
            
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
                self?.tableView.reloadData()
                self?.configureTable()
            }
        }
    }

    func configureTable() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200.0
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.getRepoCount()
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoTableViewCell

        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? UserViewController,
            let selectedIndexPath = tableView.indexPathForSelectedRow {
            
            let userLogin = viewModel.getUserName(index: selectedIndexPath.row)
            destinationVC.userLogin = userLogin
        }
    }
}
