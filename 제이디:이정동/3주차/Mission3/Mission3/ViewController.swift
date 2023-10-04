//
//  ViewController.swift
//  Mission3
//
//  Created by 이정동 on 10/4/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(resource: .pizza)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "[재주문1위] 바싹불고기피자"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var priceOptionButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .gray
        button.tag = 20000
        return button
    }()
    
    private lazy var priceOptionName1: UILabel = {
        let label = UILabel()
        label.text = "M"
        label.textColor = .black
        return label
    }()
    
    private lazy var priceOptionPrice1: UILabel = {
        let label = UILabel()
        label.text = "20,000원"
        label.textColor = .black
        return label
    }()
    
    private lazy var priceOptionButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .gray
        button.tag = 23000
        return button
    }()
    
    private lazy var priceOptionName2: UILabel = {
        let label = UILabel()
        label.text = "L"
        label.textColor = .black
        return label
    }()
    
    private lazy var priceOptionPrice2: UILabel = {
        let label = UILabel()
        label.text = "23,000원"
        label.textColor = .black
        return label
    }()
    
    // 도우변경
    private lazy var doughLabel: UILabel = {
        let label = UILabel()
        label.text = "도우"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var doughOptionButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .gray
        button.tag = 0
        return button
    }()
    
    private lazy var doughOptionName1: UILabel = {
        let label = UILabel()
        label.text = "기본"
        label.textColor = .black
        return label
    }()
    
    private lazy var doughOptionPrice1: UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.textColor = .black
        return label
    }()
    
    private lazy var doughOptionButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .gray
        button.tag = 4500
        return button
    }()
    
    private lazy var doughOptionName2: UILabel = {
        let label = UILabel()
        label.text = "크림리치골드 크러스트"
        label.textColor = .black
        return label
    }()
    
    private lazy var doughOptionPrice2: UILabel = {
        let label = UILabel()
        label.text = "4,000원"
        label.textColor = .black
        return label
    }()
    
    private lazy var bottomButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7436546683, blue: 0.5554187894, alpha: 1)
        view.setTitle("0원 담기", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    private var isSelectedPriceButton: UIButton?
    private var isSelectedDoughButton: UIButton?
    
    private var isSelectedPriceOption: String?
    private var isSelectedPricePrice: String?
    
    private var isSelectedDoughOption: String?
    private var isSelectedDoughPrice: String?
    
    private var totalPrice = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        addSubviews()
        configureConstraints()
        addTargets()
    }

    // MARK: - addSubviews()
    
    private func addSubviews() {
        view.addSubview(scrollView)
        view.addSubview(bottomButton)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        containerView.addSubview(priceLabel)
        containerView.addSubview(priceOptionButton1)
        containerView.addSubview(priceOptionName1)
        containerView.addSubview(priceOptionPrice1)
        containerView.addSubview(priceOptionButton2)
        containerView.addSubview(priceOptionName2)
        containerView.addSubview(priceOptionPrice2)
        
        containerView.addSubview(doughLabel)
        containerView.addSubview(doughOptionButton1)
        containerView.addSubview(doughOptionName1)
        containerView.addSubview(doughOptionPrice1)
        containerView.addSubview(doughOptionButton2)
        containerView.addSubview(doughOptionName2)
        containerView.addSubview(doughOptionPrice2)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(bottomButton.snp.top)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(imageView.snp.width).multipliedBy(0.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        priceOptionButton1.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.leading.equalTo(priceLabel.snp.leading)
            make.size.equalTo(30)
        }
        
        priceOptionName1.snp.makeConstraints { make in
            make.leading.equalTo(priceOptionButton1.snp.trailing).offset(10)
            make.centerY.equalTo(priceOptionButton1.snp.centerY)
        }
        
        priceOptionPrice1.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(priceOptionName1.snp.centerY)
        }
        
        priceOptionButton2.snp.makeConstraints { make in
            make.top.equalTo(priceOptionButton1.snp.bottom).offset(20)
            make.leading.equalTo(priceLabel.snp.leading)
            make.size.equalTo(30)
        }
        
        priceOptionName2.snp.makeConstraints { make in
            make.leading.equalTo(priceOptionButton2.snp.trailing).offset(10)
            make.centerY.equalTo(priceOptionButton2.snp.centerY)
        }
        
        priceOptionPrice2.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(priceOptionName2.snp.centerY)
        }
        
        doughLabel.snp.makeConstraints { make in
            make.top.equalTo(priceOptionPrice2.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        doughOptionButton1.snp.makeConstraints { make in
            make.top.equalTo(doughLabel.snp.bottom).offset(20)
            make.leading.equalTo(doughLabel.snp.leading)
            make.size.equalTo(30)
        }
        
        doughOptionName1.snp.makeConstraints { make in
            make.leading.equalTo(doughOptionButton1.snp.trailing).offset(10)
            make.centerY.equalTo(doughOptionButton1.snp.centerY)
        }
        
        doughOptionPrice1.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(doughOptionName1.snp.centerY)
        }
        
        doughOptionButton2.snp.makeConstraints { make in
            make.top.equalTo(doughOptionButton1.snp.bottom).offset(20)
            make.leading.equalTo(doughLabel.snp.leading)
            make.size.equalTo(30)
        }
        
        doughOptionName2.snp.makeConstraints { make in
            make.leading.equalTo(doughOptionButton2.snp.trailing).offset(10)
            make.centerY.equalTo(doughOptionButton2.snp.centerY)
        }
        
        doughOptionPrice2.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(doughOptionName2.snp.centerY)
            make.bottom.equalToSuperview()  // 임시 스크롤 뷰 영역
        }
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
    
    }
    
    private func addTargets() {
        priceOptionButton1.addTarget(self, action: #selector(priceButtonTapped(_:)), for: .touchUpInside)
        priceOptionButton2.addTarget(self, action: #selector(priceButtonTapped(_:)), for: .touchUpInside)
        
        doughOptionButton1.addTarget(self, action: #selector(doughButtonTapped(_:)), for: .touchUpInside)
        doughOptionButton2.addTarget(self, action: #selector(doughButtonTapped(_:)), for: .touchUpInside)
        
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
    }
    
    @objc func priceButtonTapped(_ sender: UIButton) {
        isSelectedPriceButton?.setImage(UIImage(systemName: "circle"), for: .normal)
        isSelectedPriceButton?.tintColor = .gray
        
        sender.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        sender.tintColor = #colorLiteral(red: 0, green: 0.7436546683, blue: 0.5554187894, alpha: 1)
        
        isSelectedPriceButton = sender
        
        isSelectedPricePrice = "\(sender.tag)원"
        isSelectedPriceOption = sender.tag == 20000 ? "M" : "L"
        totalPrice = (isSelectedDoughButton?.tag ?? 0) + (isSelectedPriceButton?.tag ?? 0)
        bottomButton.setTitle("\(totalPrice)원 담기", for: .normal)
    }
    
    @objc func doughButtonTapped(_ sender: UIButton) {
        isSelectedDoughButton?.setImage(UIImage(systemName: "circle"), for: .normal)
        isSelectedDoughButton?.tintColor = .gray
        
        sender.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        sender.tintColor = #colorLiteral(red: 0, green: 0.7436546683, blue: 0.5554187894, alpha: 1)
        isSelectedDoughButton = sender
        
        isSelectedDoughPrice = "\(sender.tag)원"
        isSelectedDoughOption = sender.tag == 0 ? "없음" : "크림리치골드 크러스트"
        totalPrice = (isSelectedDoughButton?.tag ?? 0) + (isSelectedPriceButton?.tag ?? 0)
        bottomButton.setTitle("\(totalPrice)원 담기", for: .normal)
    }
    
    @objc func bottomButtonTapped() {
        let vc = SecondViewController()
        vc.doughOption = isSelectedDoughOption
        vc.doughPrice = isSelectedDoughPrice
        vc.priceOption = isSelectedPriceOption
        vc.price = isSelectedPricePrice
        vc.totalPrice = totalPrice
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

