//
//  HomeViewController.swift
//  Week03_Practice
//
//  Created by 이승진 on 2023/10/04.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var writeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let productNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(productNib, forCellReuseIdentifier: "ProductTableViewCell")
        
        writeButton.layer.cornerRadius = 25
        writeButton.clipsToBounds = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
