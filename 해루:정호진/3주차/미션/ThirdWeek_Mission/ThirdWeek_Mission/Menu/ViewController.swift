//
//  ViewController.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/09/30.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {

    /// MARK:
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15)
        return view
    }()
    
    /// MARK:
    private lazy var backUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    /// MARK:
    private lazy var minimumLabel: UILabel = {
        let label = UILabel()
        label.text = "배달최소주문금액"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()
    
    /// MARK:
    private lazy var minimumPrice: UILabel = {
        let label = UILabel()
        label.text = "12,000원"
        label.textColor = .black
        
        return label
    }()
    
    /// MARK:
    private lazy var goCart: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.setTitle("담기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private var priceIndex: BehaviorRelay<IndexPath> = BehaviorRelay(value: IndexPath(item: 0, section: 0))
    private var toppingIndex: BehaviorRelay<Set<IndexPath>> = BehaviorRelay(value: [])
    private let disposeBag = DisposeBag()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        addSubViews()
        bind()
    }
    
    /// MARK:
    private func addSubViews(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        view.addSubview(backUIView)
        backUIView.addSubview(goCart)
        backUIView.addSubview(minimumLabel)
        backUIView.addSubview(minimumPrice)
        
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
        }
        
        backUIView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        goCart.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-10)
            make.leading.equalTo(minimumLabel.snp.trailing).offset(20)
            make.height.equalTo(50)
        }
        
        minimumLabel.snp.makeConstraints { make in
            make.top.equalTo(goCart.snp.top).offset(2)
            make.leading.equalToSuperview().offset(20)
        }
        
        minimumPrice.snp.makeConstraints { make in
            make.top.equalTo(minimumLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    /// MARK:
    private func bind(){
        goCart.rx.tap
            .bind { [weak self] _ in
                guard let self = self else { return }
                let nc = CartViewController()
                var list: [Menu] = DataList.selectionMenuList
                var topplingList: [Price] = []
                
                toppingIndex.value.forEach { indexPath in
                    topplingList.append(Price(price: DataList.toppingList[indexPath.row].price,
                                              label: DataList.toppingList[indexPath.row].label))
                }
                
                list.append(Menu(price: Price(price: DataList.priceList[priceIndex.value.row].price,
                                              label: DataList.priceList[priceIndex.value.row].label),
                                 topping: topplingList))
                
                nc.menuList.accept(list)
                DataList.selectionMenuList = list
                navigationController?.pushViewController(nc, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {return UITableViewCell()}
        cell.clearCell()
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.input_titleView()
        case 1:
            cell.input_priceView()
            cell.priceIndexPath
                .bind(to: priceIndex)
                .disposed(by: disposeBag)
        case 2:
            cell.input_toppingView()
            cell.toppingIndexPaths
                .bind(to: toppingIndex)
                .disposed(by: disposeBag)
        default:
            print("범위 초과!")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    
    func numberOfSections(in tableView: UITableView) -> Int { return 3 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(view.safeAreaLayoutGuide.layoutFrame.height/3)
        case 1:
            return CGFloat((DataList.priceList.count + 1) * 60)
        case 2:
            return CGFloat((DataList.toppingList.count + 1) * 60)
        default:
            print("범위 초과!!")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { 
        switch section{
        case 0:
            return ""
        default:
            return " "
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 1 }
    
}
