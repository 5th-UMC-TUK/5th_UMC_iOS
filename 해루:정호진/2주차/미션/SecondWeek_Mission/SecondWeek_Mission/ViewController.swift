//
//  ViewController.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/09/25.
//

import UIKit
import SnapKit


final class ViewController: UIViewController {

    /// MARK: 네비게이션 왼쪽 UIButton
    private lazy var leftTitle: UIButton  = {
        let btn = UIButton()
        btn.setTitle("송도동 ", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        btn.semanticContentAttribute = .forceRightToLeft
        return btn
    }()
    
    /// MARK: tableView
    private lazy var tableView: UITableView = {
        let view = UITableView()
        
        return view
    }()
    
    /// MARK: 글쓰기 버튼
    private lazy var newWriteButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("글쓰기", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15,weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .orange
        return btn
    }()
    
    /// MARK: 글쓰기 버튼 너비
    private var widthConstraint: Constraint?
    
    /// MARK: 글쓰기 버튼 높이
    private var heightConstraint: Constraint?
    
    /// MARK: 광고 랜덤 인덱스
    private var randomIndex: [Int] = []
    private var adsIndex: Int = 0
    private var productIndex: Int = 0
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        chooseRandomIndex()
        addSubviews()
    }
    
    
    // MARK: - Functions
    
    /// MARK: 광고 넣을 랜덤 숫자 뽑기
    private func chooseRandomIndex(){
        var randomIndex: [Int] = []
        let allCount = List.productList.count + List.adsList.count
        
        while randomIndex.count != List.adsList.count {
            let number = Int.random(in: 0..<allCount)
            
            let overLapNumber = randomIndex.filter{number == $0}
            
            if (overLapNumber.first ?? -1) != number {
                randomIndex.append(number)
            }
        }
        self.randomIndex = randomIndex
        print(randomIndex)
    }
    
    /// MARK: 네비게이션 바 설정
    private func setNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftTitle)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "bell.badge")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: nil, action: nil),
                                              UIBarButtonItem(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: nil, action: nil),
                                              UIBarButtonItem(image: UIImage(systemName: "list.bullet")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: nil, action: nil)]
    }
    
    /// MARK: Add UI
    private func addSubviews(){
        setNavigationBar()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identfier)
        
        view.addSubview(newWriteButton)
        
        constraints()
        setCornerRadius()
    }
    
    /// MARK: set AutoLayout
    private func constraints(){
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        newWriteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            widthConstraint = make.width.equalTo(view.safeAreaLayoutGuide.layoutFrame.width/4).constraint
            heightConstraint = make.height.equalTo(50).constraint
        }
        
    }

    /// MARK: set CornerRadius
    private func setCornerRadius(){
        newWriteButton.layoutIfNeeded()
        newWriteButton.layer.cornerRadius = newWriteButton.frame.height/2
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identfier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        var check: Bool = true
        let _ = randomIndex.filter{$0 == indexPath.row}.map{ _ in
            check = false
            cell.inputAdsProduct(ads: List.adsList[adsIndex])
            if adsIndex < (List.adsList.count - 1) {
                adsIndex += 1
            }
            else {
                adsIndex = 0
            }
        }
        
        if check {
            cell.inputProduct(product: List.productList[productIndex])
            if productIndex < (List.productList.count - 1) {
                productIndex += 1
            }
            else{
                productIndex = 0
            }
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return List.productList.count + List.adsList.count}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var check: Bool = true
        let height = randomIndex.filter{$0 == indexPath.row}.map{ _ in check = false; return 250}
        
        if check {
            return 170
        }
        else {
            return CGFloat(height.first ?? 0)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        
        if position > (tableView.frame.height - scrollView.frame.size.height){
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                guard let self = self else {return}
                
                widthConstraint?.update(offset: 60)
                heightConstraint?.update(offset: 60)
                newWriteButton.layoutSubviews()
                newWriteButton.layer.cornerRadius = newWriteButton.frame.height/2
                newWriteButton.setImage(UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
                newWriteButton.setTitle(nil, for: .normal)
                
                
            })
        }
        
        if position < 30 {
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                guard let self = self else {return}
                
                widthConstraint?.update(offset: view.safeAreaLayoutGuide.layoutFrame.width/4)
                heightConstraint?.update(offset: 50)
                newWriteButton.layoutIfNeeded()
                newWriteButton.setTitle(" 글쓰기", for: .normal)
                newWriteButton.layer.cornerRadius = newWriteButton.frame.height/2
                
            })
        }
        
        
    }
}
