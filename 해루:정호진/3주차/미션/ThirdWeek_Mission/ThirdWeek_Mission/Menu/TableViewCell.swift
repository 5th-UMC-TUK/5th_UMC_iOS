//
//  TableViewCell.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/09/30.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import SnapKit

final class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    /// MARK:
    private lazy var titleView: TitleUIView = {
        let view = TitleUIView()
        view.backgroundColor = .clear
        return view
    }()
    
    /// MARK:
    private lazy var priceView: PriceUIView = {
        let view = PriceUIView()
        view.backgroundColor = .white
        return view
    }()
    
    /// MARK:
    private lazy var toppingView: ToppingUIView = {
        let view = ToppingUIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var disposeBag = DisposeBag()
    var priceIndexPath: BehaviorRelay<IndexPath> = BehaviorRelay(value: IndexPath(item: 0, section: 0))
    var toppingIndexPaths: BehaviorRelay<Set<IndexPath>> = BehaviorRelay(value: [])
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    /// MARK:
    private func addSubViews_titleView(){
        addSubview(titleView)
        
        constraints_titleView()
    }
    
    /// MARK:
    private func constraints_titleView(){
        titleView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func input_titleView(){
        addSubViews_titleView()
    }
    
    
    
    /// MARK:
    private func addSubViews_priceView(){
        addSubview(priceView)
        
        constraints_priceView()
    }
    
    /// MARK:
    private func constraints_priceView(){
        priceView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func input_priceView(){
        addSubViews_priceView()
        
    }
    
    /// MARK:
    private func addSubViews_toppingView(){
        addSubview(toppingView)
        
        constraints_toppingView()
    }
    
    /// MARK:
    private func constraints_toppingView(){
        toppingView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func input_toppingView(){ addSubViews_toppingView() }
    
    
    
    
    func bind(){
        priceView.selectionIndex
            .bind(to: priceIndexPath)
            .disposed(by: disposeBag)
        
        toppingView.selectionIndex
            .bind(to: toppingIndexPaths)
            .disposed(by: disposeBag)
    }
    
    
    
    func clearCell(){
        titleView.removeFromSuperview()
        priceView.removeFromSuperview()
        toppingView.removeFromSuperview()
    }
}
