//
//  ViewController.swift
//  5thMission
//
//  Created by 정호진 on 10/30/23.
//

import UIKit
import RxSwift
import RxCocoa

final class ListViewController: UIViewController {
    private let service = Service()
    private let disposeBag = DisposeBag()
    
    
    /// MARK:
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.layoutIfNeeded()
        view.rowHeight = UITableView.automaticDimension
        return view
    }()
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = name
        addSubViews()
        getList()
    }
    
    
    /// MARK:
    private func addSubViews(){
        view.addSubview(tableView)
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier.rawValue)
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    /// MARK: binding tableiview
    private func bindTableView(url: String){
        service.getList(url: url)
            .bind(to:  tableView.rx.items(cellIdentifier: TableViewCell.identifier.rawValue,
                                          cellType: ListTableViewCell.self))
        { row, element, cell in
            cell.inputData(body: element)
            cell.selectionStyle = .none
        }
        .disposed(by: disposeBag)
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    /// MARK: get List
    private func getList(){
        guard let apikey = Bundle.main.object(forInfoDictionaryKey: "Apikey") as? String else { return }
        let url = "https://incheon.openapi.redtable.global/api/rstr/korean?serviceKey=\(apikey)"
        bindTableView(url: url)
    }

}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}

enum TableViewCell: String {
    case identifier
}
