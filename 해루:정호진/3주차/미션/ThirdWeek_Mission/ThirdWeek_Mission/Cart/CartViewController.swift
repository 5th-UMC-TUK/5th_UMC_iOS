//
//  CartViewController.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/10/01.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import SnapKit

final class CartViewController: UIViewController {
    
    /// MARK:
    private lazy var tableView: UITableView = {
        let view = UITableView()
        
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    var menuList: BehaviorRelay<[Menu]> = BehaviorRelay(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubViews()
    }
    
    /// MARK:
    private func addSubViews(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        cell.inputData(menu: menuList.value)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(250 * menuList.value.count)
    }
    
}
