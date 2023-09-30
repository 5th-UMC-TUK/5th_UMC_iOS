//
//  TableViewCell.swift
//  week2-mission
//
//  Created by Subeen on 2023/09/28.
//

import UIKit

class TableViewCell: UITableViewCell {
    
//    let image: ImageAsset
//    let title: String
//    let info: String
//    let status: Status
//    let price: String
//    let chat: Int
//    let heart: Int
    
    static let identfier = "TableViewCell"
    
    // MARK: - 대표 이미지
    private lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(.item1)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    // MARK: - 게시글 제목
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        
        return lb
    }()

    // MARK: - 지역, 시간
    private lazy var infoLabel: UILabel = {
        let lb = UILabel()
//        lb.text = "영통구 매탄3동 1일 전"
        lb.font = .systemFont(ofSize: 12, weight: .light)
        lb.textColor = .lightGray
        return lb
    }()

    // MARK: - 판매중/예약중/거래완료
    private lazy var statusImage: UIImageView = {
       let imgView = UIImageView()
        imgView.image = UIImage(.done)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        return imgView
    }()

    // MARK: - 가격 라벨
    private lazy var priceLabel: UILabel = {
        let lb = UILabel()
//        lb.text = "500원"
        lb.font = .systemFont(ofSize: 15, weight: .bold)
        lb.textColor = .black
        return lb
    }()


    // MARK: - 채팅 아이콘
    private lazy var chatImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "message")
        imgView.tintColor = .lightGray
        return imgView
    }()

    // MARK: - 채팅 개수 라벨
    private lazy var chatLabel: UILabel = {
        let lb = UILabel()
//        lb.text = "5"
        lb.textColor = .darkGray
        lb.font = .systemFont(ofSize: 13, weight: .medium)
        return lb
    }()

    // MARK: - 하트 아이콘
    private lazy var heartImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "heart")
        imgView.tintColor = .lightGray
        return imgView
    }()

    // MARK: - 하트 개수 라벨
    private lazy var heartLabel: UILabel = {
        let lb = UILabel()
//        lb.text = "5"
        lb.textColor = .darkGray
        lb.font = .systemFont(ofSize: 13, weight: .medium)
        return lb
    }()

    // MARK: - 글 제목, 지역&시간, 상태&가격 스택
    private lazy var stackView1: UIStackView = {
        let st = UIStackView(arrangedSubviews: [titleLabel, infoLabel, stackView2])
        st.spacing = 5
        st.distribution = .equalSpacing
        
        st.alignment = .leading
        st.axis = .vertical
        return st
    }()

    // MARK: - 상태, 가격 스택
    private lazy var stackView2: UIStackView = {
        let st = UIStackView(arrangedSubviews: [statusImage, priceLabel])
        st.spacing = 5
        st.distribution = .equalSpacing
        st.alignment = .center
        st.axis = .horizontal
        return st
    }()


    // MARK: - 채팅, 하트 스택
    private lazy var stackView3: UIStackView = {
        let st = UIStackView(arrangedSubviews: [chatImage, chatLabel, heartImage, heartLabel])
        st.axis = .horizontal
        return st
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(_ item: Item) {
        self.imgView.image = UIImage(item.image)
        self.titleLabel.text = item.title
        self.infoLabel.text = item.info
        if item.status == .ing {
            statusImage.isHidden = true
        } else {
            self.statusImage.image = UIImage(assetName: item.status.description)
        }
        self.priceLabel.text = item.price
        
        if item.chat == 0 {
            chatImage.isHidden = true
        } else {
            self.chatLabel.text = "\(item.chat)"
        }
        
        if item.heart == 0 {
            heartImage.isHidden = true
        } else {
            self.heartLabel.text = "\(item.heart)"
        }
    }
    

    
    private func setUpUI() {
        
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        statusImage.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        heartLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(stackView1)
        self.contentView.addSubview(stackView3)

        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 5),
            imgView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: -5),
            imgView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
            imgView.heightAnchor.constraint(equalToConstant: 100),
            imgView.widthAnchor.constraint(equalToConstant: 100),
            
            stackView1.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 10),
            stackView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView1.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 5),
            
            stackView3.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor, constant: 0),
            stackView3.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -5),
        ])
    }
}
