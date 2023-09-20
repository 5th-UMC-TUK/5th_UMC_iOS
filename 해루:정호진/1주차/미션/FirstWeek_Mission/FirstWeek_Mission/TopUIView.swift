//
//  TopUIView.swift
//  FirstWeek_Mission
//
//  Created by 정호진 on 2023/09/17.
//

import Foundation
import UIKit

final class TopUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// MARK: 주소 버튼
    private lazy var addressBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("우리집 ", for: .normal)
        btn.setImage(UIImage(systemName: "arrowtriangle.down.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.semanticContentAttribute = .forceRightToLeft
        return btn
    }()
    
    /// MARK: 첫번째 버튼
    private lazy var firstBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("a", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    /// MARK: 알림 버튼
    private lazy var secondBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("a", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    /// MARK: 장바구니 버튼
    private lazy var thirdBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("a", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    /// MARK: 검색 버튼
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    // MARK: - Functions
    
    /// MARK: Add UI
    private func addUI(){
        addSubview(addressBtn)
        addSubview(firstBtn)
        addSubview(secondBtn)
        addSubview(thirdBtn)
        addSubview(searchBar)
            
        constraints()
    }
    
    /// MARK: Constraints
    private func constraints() {
        NSLayoutConstraint.activate([
//            addressBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            addressBtn.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            addressBtn.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            addressBtn.bottomAnchor.constraint(equalTo: searchBar.topAnchor,constant: -10),
            
            firstBtn.bottomAnchor.constraint(equalTo: searchBar.topAnchor,constant: -10),
            firstBtn.trailingAnchor.constraint(equalTo: secondBtn.trailingAnchor,constant: -10),
            
            secondBtn.bottomAnchor.constraint(equalTo: searchBar.topAnchor,constant: -10),
            secondBtn.trailingAnchor.constraint(equalTo: thirdBtn.trailingAnchor,constant: -10),
            
            thirdBtn.bottomAnchor.constraint(equalTo: searchBar.topAnchor,constant: -10),
            thirdBtn.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            
            searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    
}
