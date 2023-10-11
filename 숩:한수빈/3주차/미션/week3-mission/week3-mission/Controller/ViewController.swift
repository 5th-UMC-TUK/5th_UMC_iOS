//
//  ViewController.swift
//  week3-mission
//
//  Created by Subeen on 2023/09/30.
//

import UIKit


final class ViewController: UIViewController {
    private var name: String = "쿼터"
    private var price: Int = 18500
    private var subtitle: String = "4가지 맛 아이스크림을 선택할 수 있는 쿼터 사이즈"
    
    
    weak var delegate: ItemDelegate?
    
    var item: Item?
    
    private lazy var scrollView: UIScrollView = {
       let sv = UIScrollView()
        
        return sv
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private lazy var itemImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "item")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    


    private lazy var nameLabel: UILabel = {
       let lb = UILabel()
        lb.text = name
        lb.font = .systemFont(ofSize: 22, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    private lazy var subtitleLabel: UILabel = {
       let lb = UILabel()
        lb.text = subtitle
        lb.textColor = .lightGray
        lb.font = .systemFont(ofSize: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var priceLabel: UILabel = {
       let lb = UILabel()
        lb.text = "가격"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var priceLabel2: UILabel = {
       let lb = UILabel()
        lb.text = "\(price)원"
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var favoriteImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "favorite")
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var stackView1: UIStackView = {
       let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillProportionally
        st.spacing = 10
        
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private lazy var stackView2: UIStackView = {
       let st = UIStackView(arrangedSubviews: [favoriteImage, nameLabel])
        st.axis = .horizontal
//        st.alignment = .leading
        st.spacing = 5
//        st.backgroundColor = .blue
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()

    private lazy var stackView3: UIStackView = {
       let st = UIStackView(arrangedSubviews: [priceLabel, priceLabel2])
        st.axis = .horizontal
        st.spacing = 10
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    // MARK: - 하단 담기 버튼
    private lazy var buttonView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var limitLabel1: UILabel = {
       let lb = UILabel()
        lb.text = "배달최소주문금액"
        lb.font = .systemFont(ofSize: 10, weight: .light)
        lb.textColor = .darkGray
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var limitLabel2: UILabel = {
       let lb = UILabel()
        lb.text = "17,000원"
        lb.font = .systemFont(ofSize: 10, weight: .light)
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var addButton: UIButton = {
       let bt = UIButton()
        bt.setTitle("\(price)원 담기", for: .normal)
        bt.titleLabel?.textColor = .white
        bt.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        bt.layer.cornerRadius = 5
        bt.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.7568627451, blue: 0.737254902, alpha: 1)
        bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    private lazy var buttonStackView1: UIStackView = {
       let sv = UIStackView(arrangedSubviews: [limitLabel1, limitLabel2])
        sv.axis = .vertical
        sv.spacing = 3
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var buttonStackView2: UIStackView = {
       let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 5
//        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNav()

        setConstraint()
        setupButtonView()
    }
    
    func setupNav() {
        title = ""
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
//        self.navigationItem.rightBarButtonItem =
    }
    
    func setupButtonView() {
        buttonStackView2.addArrangedSubview(buttonStackView1)
        buttonStackView2.addArrangedSubview(addButton)
        buttonView.addSubview(buttonStackView2)
        
        view.addSubview(buttonView)
        
        NSLayoutConstraint.activate([
            buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            buttonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            buttonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            buttonView.widthAnchor.constraint(equalTo: view.widthAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 80),
            
            buttonStackView2.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 10),
            buttonStackView2.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 10),
            buttonStackView2.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -30),
            buttonStackView2.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -10),
        ])
    }
    
    func setConstraint() {
        stackView1.addArrangedSubview(itemImage)

        
        stackView1.addArrangedSubview(stackView2)
        stackView1.addArrangedSubview(subtitleLabel)
        stackView1.addArrangedSubview(stackView3)
        view.addSubview(stackView1)
        
        
        NSLayoutConstraint.activate([
            itemImage.heightAnchor.constraint(equalToConstant: 300),
            favoriteImage.widthAnchor.constraint(equalToConstant: 30),
            favoriteImage.heightAnchor.constraint(equalToConstant: 30),
            stackView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0),
            stackView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
        ])
    }
    
    @objc func buttonTapped() {
        let secondVC = SecondViewController()
        
        let name = name
        let price = price
        
        var newItem = Item(name: name, price: price)
        
        delegate?.addNewItem(newItem)
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

