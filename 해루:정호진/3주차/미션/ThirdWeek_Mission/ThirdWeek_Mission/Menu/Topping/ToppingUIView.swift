//
//  ToppingUIView.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/09/30.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxRelay

final class ToppingUIView: UIView {
    
    /// MARK:
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "토핑"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    /// MARK:
    private lazy var need: UILabel = {
        let label = UILabel()
        label.text = "선택"
        label.textColor = .gray
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        return label
    }()
    
    /// MARK:
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        return view
    }()
    
    /// 선택된 Indexpath 저장
    var selectionIndex: BehaviorRelay<Set<IndexPath>> = BehaviorRelay(value: [])
    private let disposeBag = DisposeBag()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// MARK:
    private func addSubviews(){
        addSubview(title)
        addSubview(need)
        addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ToppingTableViewCell.self, forCellReuseIdentifier: ToppingTableViewCell.identifier)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        need.snp.makeConstraints { make in
            make.centerY.equalTo(title.snp.centerY)
            make.trailing.equalToSuperview().offset(-25)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    
}


extension ToppingUIView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToppingTableViewCell.identifier, for: indexPath) as? ToppingTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.inputData(price: DataList.toppingList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataList.toppingList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        var selectedItems = selectionIndex.value
        if selectedItems.contains(indexPath) {
            cell?.isSelected = false
            selectedItems.remove(indexPath)
        }
        else {
            cell?.isSelected = true
            selectedItems.insert(indexPath)
        }
        selectionIndex.accept(selectedItems)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


