//
//  TableViewCell.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/09/26.
//

import Foundation
import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    static let identfier = "TableViewCell"
    
    /// MARK: 이미지
    private lazy var image: UIImageView = {
        let view = UIImageView(image: UIImage(named: "삼겹살"))
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    /// MARK: 판매 제목
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    /// MARK: 위치 라벨
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
 
    /// MARK: 가격 라벨
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    /// MARK: chat image
    private lazy var chatImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "message")?.withTintColor(.gray, renderingMode: .alwaysOriginal))
        return view
    }()
    
    /// MARK: 채팅 갯수
    private lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    /// MARK: heart image
    private lazy var heartImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "heart")?.withTintColor(.gray, renderingMode: .alwaysOriginal))
        return view
    }()
    
    /// MARK: 하트 갯수
    private lazy var heartLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    /// MARK: stackView (채팅 아이콘, 채팅 갯수, 하트 아이콘, 하트 갯수)
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// MARK: 화살표 이미지
    private lazy var directionImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        return view
    }()
    
    /// MARK: 광고 가로 스크롤
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private var adsProductList: [AdsProduct] = []
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    
    /// MARK: 판매 물건 UI
    private func sellingProductAddSubViews(){
        removeAdsUI()
        addSubview(image)
        addSubview(titleLabel)
        addSubview(locationLabel)
        addSubview(priceLabel)
        addSubview(stackView)
        
        sellingProductConstraints()
    }
    
    /// MARK: 판매 물건 AutoLayout
    private func sellingProductConstraints(){
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.height.equalTo(130)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top)
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(image.snp.trailing).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
            make.leading.equalTo(image.snp.trailing).offset(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
    /// MARK: 제품 정보 입력
    func inputProduct(product: Product){
        sellingProductAddSubViews()
        
        image.image = product.image
        titleLabel.text = product.title ?? ""
        
        location_time(product)
        chat_heart(product)
    }
    
    /// MARK: 광고 UI 제거
    private func removeAdsUI(){
        titleLabel.removeFromSuperview()
        directionImage.removeFromSuperview()
        collectionView.removeFromSuperview()
    }
    
    /// MARK: 위치, 시간 표시
    private func location_time(_ product: Product){
        var fullText = ""
        fullText.append(product.location ?? "")
        if let time = product.time {
            fullText.append(" * \(time)")
        }
        locationLabel.text = fullText
        
        if let price = product.price {
            priceLabel.text = price
        }
    }
    
    /// MARK: 채팅, 하트 갯수 계산
    private func chat_heart(_ product: Product){
        if (product.chat ?? 0) != 0{
            stackView.addArrangedSubview(chatImage)
            stackView.addArrangedSubview(chatLabel)
            chatLabel.text = "\(product.chat ?? 0)"
        }
        
        if (product.heart ?? 0) != 0{
            stackView.addArrangedSubview(heartImage)
            stackView.addArrangedSubview(heartLabel)
            heartLabel.text = "\(product.heart ?? 0)"
        }
    }
    
    
    
    /// MARK: 광고
    private func adsAddSubViews(){
        removeSellingProduct()
        
        addSubview(titleLabel)
        addSubview(directionImage)
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        constraintsCollectionView()
    }
    
    /// MARK: 광고 AutoLayout
    private func constraintsCollectionView(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(directionImage.snp.leading).offset(-5)
        }
        
        directionImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(200)
        }
    }
    
    /// MARK: 판매 제품  UI 제거
    private func removeSellingProduct(){
        image.removeFromSuperview()
        titleLabel.removeFromSuperview()
        locationLabel.removeFromSuperview()
        priceLabel.removeFromSuperview()
        stackView.removeFromSuperview()
    }
    
    /// MARK: 광고 데이터 삽입
    func inputAdsProduct(ads: Ads) {
        adsProductList = ads.list ?? []
        adsAddSubViews()
        collectionView.reloadData()
        titleLabel.text = ads.title ?? ""
        
    }
}

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adsProductList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        print("indexPath.item: \(indexPath.item), cnt: \(adsProductList.count)")
        cell.inputData(product: adsProductList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
}
