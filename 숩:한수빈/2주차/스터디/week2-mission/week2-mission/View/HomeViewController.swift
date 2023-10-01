//
//  ViewController.swift
//  week2-mission
//
//  Created by Subeen on 2023/09/25.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: Test items
    private let image: [UIImage] = [
        UIImage(.item1)!,
        UIImage(.item2)!,
        UIImage(.item3)!,
        UIImage(.item4)!,
        UIImage(.item5)!
    ]
    
    
    // MARK: - UI Components
    private lazy var vScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    
    // TODO: - 광고 뷰
//    private lazy var hScrollView: UIScrollView = {
//        let sv = UIScrollView()
//        sv.showsVerticalScrollIndicator = false
//        return sv
//    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [contentView1, contentView2])
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 0
       return sv
    }()
    
    // 전체 스크롤뷰
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.allowsSelection = true
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identfier)
        return tv
    }()
    
    // TODO: - 광고 뷰
    // 광고 가로 스크롤뷰
//    private lazy var tableView2: UITableView = {
//        let tv = UITableView()
//        tv.allowsSelection = false
//        tv.register(TableViewCell2.self, forCellReuseIdentifier: TableViewCell2.identfier)
//        tv.backgroundColor = .blue
//        return tv
//    }()
    
    private lazy var contentView1: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var contentView2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    
    
   
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupUI()
        setNavigationBar()
        setupAutoLayout()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.addSubview(vScrollView)
        
        contentView1.addSubview(tableView)
//        contentView2.addSubview(tableView2)
        
        stackView.addSubview(contentView1)
        stackView.addSubview(contentView2)

        vScrollView.addSubview(stackView)
//        hScrollView.addSubview(contentView2)
    }
    
    
    private func setNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = .black // set tint color
        navigationItem.setRightBarButtonItems(
            [
                UIBarButtonItem(
                    image: UIImage(systemName: "bell"),
                    style: .plain, target: nil, action: nil
                ),
                UIBarButtonItem(
                    image: UIImage(systemName: "magnifyingglass"),
                    style: .plain, target: nil, action: nil
                ),
                UIBarButtonItem(
                    image: UIImage(systemName: "line.3.horizontal"),
                    style: .plain, target: nil, action: nil
                )
            ], animated: true)
    }
    
    // Auto Layout
    private func setupAutoLayout() {
        
        // TODO: - 추석 때 SnapKit 연습하기...!
        vScrollView.translatesAutoresizingMaskIntoConstraints = false
//        hScrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView2.translatesAutoresizingMaskIntoConstraints = false
        contentView1.translatesAutoresizingMaskIntoConstraints = false
        contentView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 전체 스크롤 뷰
            vScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            vScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            vScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            vScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: vScrollView.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: vScrollView.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: vScrollView.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: vScrollView.trailingAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalTo: vScrollView.widthAnchor),
            stackView.heightAnchor.constraint(greaterThanOrEqualTo: vScrollView.heightAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentView1.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView1.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView1.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView1.trailingAnchor, constant: -10),
            
            // TODO: - 광고 뷰
//            hScrollView.topAnchor.constraint(equalTo: contentView2.topAnchor, constant: 0),
//            hScrollView.bottomAnchor.constraint(equalTo: contentView2.bottomAnchor, constant: 0),
//            hScrollView.leadingAnchor.constraint(equalTo: contentView2.leadingAnchor, constant: 0),
//            hScrollView.topAnchor.constraint(equalTo: contentView2.topAnchor, constant: 0),

//            tableView2.topAnchor.constraint(equalTo: contentView2.topAnchor, constant: 0),
//            tableView2.bottomAnchor.constraint(equalTo: contentView2.bottomAnchor, constant: 0),
//            tableView2.leadingAnchor.constraint(equalTo: contentView2.leadingAnchor, constant: 0),
//            tableView2.widthAnchor.constraint(greaterThanOrEqualTo: hScrollView.widthAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return List.itemList.count // 셀의 개수
        
//        if tableView == self.tableView {
//            return List.itemList.count // 셀의 개수
//        } else if tableView == self.tableView2 {
//            return 4
//        }
//        
//        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identfier, for: indexPath) as? TableViewCell else {
            fatalError("The TableView could not dequeue a TableViewCell in HomeViewController.")
        }

        let item = List.itemList[indexPath.row]
        cell.configure(item)


        return cell
        
//        if tableView == self.tableView {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identfier, for: indexPath) as? TableViewCell else {
//                fatalError("The TableView could not dequeue a TableViewCell in HomeViewController.")
//            }
//
//            let item = List.itemList[indexPath.row]
//            cell.configure(item)
//
//            return cell
//        } else {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identfier, for: indexPath) as? TableViewCell2 else {
//                fatalError("The TableView2 could not dequeue a TableViewCell2 in HomeViewController.")
//            }
//
//            let ad = List.adList[indexPath.row]
//            cell.configure(ad)
//
//            return cell
//        }
//
    }
}


