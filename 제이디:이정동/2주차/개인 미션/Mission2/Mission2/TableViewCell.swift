//
//  TableViewCell.swift
//  Mission2
//
//  Created by 이정동 on 2023/09/21.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    private lazy var imgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(resource: .airpodmax)
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "애어팟맥스실버"
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = "서울특별시 양천구 | 6일 전"
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 3
        sv.distribution = .fill
        sv.alignment = .center
        return sv
    }()
    
    private lazy var stateView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.6350322366, blue: 0.263138622, alpha: 1)
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var stateLabel: UILabel = {
        let label = UILabel()
        //label.text = "예약중"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "370,000"
        label.textColor = .black
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 3
        sv.alignment = .center
        sv.distribution = .fill
        return sv
    }()
    
    private lazy var chatImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "message")
        image.tintColor = .darkGray
        return image
    }()
    
    private lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var heartImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.tintColor = .darkGray
        return image
    }()
    
    private lazy var heartLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    var data: TBData? {
        didSet {
            configureUI(self.data)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureConstraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(subLabel)
        addSubview(bottomStackView)
        
        bottomStackView.addArrangedSubview(stateView)
        stateView.addSubview(stateLabel)
        bottomStackView.addArrangedSubview(priceLabel)
        
        addSubview(stackView)
        stackView.addArrangedSubview(chatImage)
        stackView.addArrangedSubview(chatLabel)
        stackView.addArrangedSubview(heartImage)
        stackView.addArrangedSubview(heartLabel)
        
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        imgView.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview().inset(15)
            make.width.equalTo(imgView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.top).offset(2)
            make.leading.equalTo(imgView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        subLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(subLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        
        stateLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(3)
        }
        
        
        stackView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(15)
        }
        
        chatImage.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
        
        heartImage.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
    }
    
    private func configureUI(_ data: TBData?) {
        guard let data = data else { return }
        
        imgView.image = data.image
        titleLabel.text = data.title
        subLabel.text = data.subTitle
        stateView.backgroundColor = data.state?.color
        stateLabel.text = data.state?.text
        priceLabel.text = data.price
        chatLabel.text = "\(data.chatCnt)"
        heartLabel.text = "\(data.heartCnt)"
        
        let isHidden = data.state == nil ? true : false
        
        stateView.isHidden = isHidden
    }
    
}
