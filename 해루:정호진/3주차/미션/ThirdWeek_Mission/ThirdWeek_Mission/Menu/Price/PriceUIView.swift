//
//  PriceUIView.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/09/30.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxRelay

final class PriceUIView: UIView {
    
    /// MARK:
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    /// MARK:
    private lazy var need: UILabel = {
        let label = UILabel()
        label.text = "필수"
        label.textColor = .blue
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        return label
    }()
    
    /// MARK:
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.allowsMultipleSelection = false
        view.separatorStyle = .none
        return view
    }()
    
    /// 선택된 Indexpath 저장
    var selectionIndex: BehaviorRelay<IndexPath> = BehaviorRelay(value: IndexPath(item: 0, section: 0))
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
        tableView.register(PriceTableViewCell.self, forCellReuseIdentifier: PriceTableViewCell.identifier)
        
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

extension PriceUIView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PriceTableViewCell.identifier, for: indexPath) as? PriceTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        if selectionIndex.value == indexPath {
            cell.isSelected = true
        }
        cell.inputData(price: DataList.priceList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataList.priceList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        
        if selectionIndex.value != indexPath {
            let beforeCell = tableView.cellForRow(at: selectionIndex.value)
            beforeCell?.isSelected = false
            cell?.isSelected = true
            selectionIndex.accept(indexPath)
        }
        else{
            cell?.isSelected = true
            selectionIndex.accept(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

