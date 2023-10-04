//
//  SecondViewController.swift
//  Mission3
//
//  Created by 이정동 on 10/4/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "자가제빵 선명희피자 광명점"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "[재주문1위] 바싹불고기피자"
        label.textColor = .black
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(resource: .pizza)
        return iv
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private lazy var doughLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var bottomButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7436546683, blue: 0.5554187894, alpha: 1)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    var totalPrice: Int?
    var priceOption: String?
    var price: String?
    var doughOption: String?
    var doughPrice: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        title = "장바구니"
        
        addSubviews()
        configureConstraints()
        updateView()
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        view.addSubview(topLabel)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(priceLabel)
        view.addSubview(doughLabel)
        view.addSubview(totalPriceLabel)
        view.addSubview(bottomButton)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        topLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalTo(titleLabel.snp.leading)
            make.size.equalTo(50)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        
        doughLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.leading.equalTo(priceLabel.snp.leading)
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(doughLabel.snp.bottom).offset(10)
            make.leading.equalTo(doughLabel.snp.leading)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
    }

    private func updateView() {
        bottomButton.setTitle("\(totalPrice!)원 주문하기", for: .normal)
        totalPriceLabel.text = "\(totalPrice!)원"
        priceLabel.text = "가격 : \(priceOption!) (\(price!))"
        doughLabel.text = "도우 : \(doughOption!) (\(doughPrice!))"
    }
}
