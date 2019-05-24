//
//  UserViewController.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import UIKit
import SVProgressHUD

class UserViewController: UIViewController {

    var userLogin: String?
    var viewModel = UserViewModel()
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var loginID: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let login = userLogin else { return }
        
        SVProgressHUD.show()
        viewModel.getUser(login: login) {
            [weak self] in
            
            if let url = self?.viewModel.avatar_url {
                do{
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        self?.avatarImage.image = image
                    }
                } catch {
                    print("Cannot recognise data in the url \(error)")
                }
                
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    self?.userName.text = self?.viewModel.name
                    self?.loginID.text = self?.viewModel.userName
                    self?.bioLabel.text = self?.viewModel.bio
                }
            }
        }
    }
    
}
