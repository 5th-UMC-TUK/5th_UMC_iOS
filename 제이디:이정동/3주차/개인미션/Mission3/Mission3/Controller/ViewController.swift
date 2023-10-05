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
        label.text = Menu.name
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
    
    private lazy var sizeTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tv.tag = 0
        tv.separatorStyle = .none
        tv.allowsMultipleSelection = false
        return tv
    }()
    
    // 도우변경
    private lazy var doughLabel: UILabel = {
        let label = UILabel()
        label.text = "도우"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var doughTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tv.tag = 1
        tv.separatorStyle = .none
        tv.allowsMultipleSelection = false
        return tv
    }()
    
    private lazy var sideLabel: UILabel = {
        let label = UILabel()
        label.text = "사이드"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var sideTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tv.tag = 2
        tv.separatorStyle = .none
        tv.allowsMultipleSelection = true
        return tv
    }()
    
    private lazy var bottomButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7436546683, blue: 0.5554187894, alpha: 1)
        view.setTitle("0원 담기", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    var menuOptions: [Option] = []

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
        containerView.addSubview(sizeTableView)
        
        containerView.addSubview(doughLabel)
        containerView.addSubview(doughTableView)
        
        containerView.addSubview(sideLabel)
        containerView.addSubview(sideTableView)
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
        
        sizeTableView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(60 * Menu.size.count)
        }
        
        doughLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeTableView.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        doughTableView.snp.makeConstraints { make in
            make.top.equalTo(doughLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(60 * Menu.dough.count)
        }
        
        sideLabel.snp.makeConstraints { make in
            make.top.equalTo(doughTableView.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        sideTableView.snp.makeConstraints { make in
            make.top.equalTo(sideLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(60 * Menu.side.count)
            make.bottom.equalToSuperview()
        }
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
    
    }
    
    private func addTargets() {
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
    }
    
    private func updateTotalPrice() {
        Cart.shared.reset()
        
        if let indexPath = sizeTableView.indexPathsForSelectedRows {
            for idx in indexPath {
                Cart.shared.totalPrice += Menu.size[idx.row].price
                Cart.shared.size = Menu.size[idx.row]
            }
        }
        
        if let indexPath = doughTableView.indexPathsForSelectedRows {
            for idx in indexPath {
                Cart.shared.totalPrice += Menu.dough[idx.row].price
                Cart.shared.dough = Menu.dough[idx.row]
            }
        }
        
        if let indexPath = sideTableView.indexPathsForSelectedRows {
            for idx in indexPath {
                Cart.shared.totalPrice += Menu.side[idx.row].price
                Cart.shared.side.append(Menu.side[idx.row])
            }
        }
        
        bottomButton.setTitle("\(Cart.shared.totalPrice)원 담기", for: .normal)
    }
    
    @objc func bottomButtonTapped() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 0: return Menu.size.count
        case 1: return Menu.dough.count
        case 2: return Menu.side.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        switch tableView.tag {
        case 0: cell.updateView(Menu.size[indexPath.row])
        case 1: cell.updateView(Menu.dough[indexPath.row])
        case 2: cell.updateView(Menu.side[indexPath.row])
        default: return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        cell.isSelectedToggle()
        updateTotalPrice()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        cell.isSelectedToggle()
        updateTotalPrice()
    }
}
