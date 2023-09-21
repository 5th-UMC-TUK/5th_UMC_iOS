//
//  ViewController.swift
//  Mission2
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - UI Property
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tb.register(TableViewCell2.self, forCellReuseIdentifier: "TableViewCell2")
        tb.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return tb
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    
        addSubviews()
        configureConstraints()
        configureNavigationBar()
    }
    
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(plusButton)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.size.equalTo(50)
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: NavigationTitleView())
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: NavigationRightBarButtons())
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TableViewData.list.count * 3 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == TableViewData.list.count * 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as! TableViewCell2
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.data = TableViewData.list[indexPath.row % 3]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = indexPath.row != TableViewData.list.count * 3 ? 140 : 250
        return CGFloat(size)
    }
    
}


