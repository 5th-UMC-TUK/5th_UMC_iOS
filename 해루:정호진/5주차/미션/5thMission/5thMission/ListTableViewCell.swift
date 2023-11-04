//
//  TableViewCell.swift
//  5thMission
//
//  Created by 정호진 on 11/2/23.
//

import Foundation
import UIKit
import SnapKit

final class ListTableViewCell: UITableViewCell {
    
    /// MARK:
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    /// MARK:
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    /// MARK:
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    /// MARK:
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// MARK:
    private func addSubViews(){
        addSubview(titleLabel)
        addSubview(addressLabel)
        addSubview(phoneNumberLabel)
        addSubview(descriptionLabel)
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func inputData(body: Body){
        titleLabel.text = body.rstrNm ?? ""
        addressLabel.text = body.roadNmAddr ?? ""
        phoneNumberLabel.text = body.rstrRprsTelno ?? ""
        descriptionLabel.text = body.rstrExplnCN ?? ""
    }
}
