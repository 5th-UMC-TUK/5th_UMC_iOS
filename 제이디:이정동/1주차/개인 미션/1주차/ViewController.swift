//
//  ViewController.swift
//  1주차
//
//  Created by 이정동 on 2023/09/18.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - UI Property
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    private lazy var bottomDummyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9688159823, green: 0.9688159823, blue: 0.9688159823, alpha: 1)
        return view
    }()
    
    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4304369688, green: 0.7858224511, blue: 0.7814640403, alpha: 1)
        return view
    }()
    
    // 네비게이션 바
    private lazy var navigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4304369688, green: 0.7858224511, blue: 0.7814640403, alpha: 1)
        return view
    }()
    
    private lazy var navigationLabel: UILabel = {
        let label = UILabel()
        label.text = "우리집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private lazy var firstBarButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "rectangle.grid.2x2")
        view.tintColor = .white
        return view
    }()
    
    private lazy var secondBarButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "bell")
        view.tintColor = .white
        return view
    }()
    
    private lazy var thirdBarButton: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "cart")
        view.tintColor = .white
        return view
    }()
    
    // 검색 바
    private lazy var dummyView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4304369688, green: 0.7858224511, blue: 0.7814640403, alpha: 1)
        return view
    }()
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4304369688, green: 0.7858224511, blue: 0.7814640403, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var searchBarImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .searchBar)
        return view
    }()
    
    // 쿠폰 배너
    private lazy var couponBanner: UIImageView = {
        let iv = UIImageView()
        iv.image = .init(resource: .couponBanner)
        iv.layer.cornerRadius = 10
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.lightGray.cgColor
        return iv
    }()
    
    // 배달 버튼
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 10
        return sv
    }()
    
    private lazy var button1: UIImageView = {
        let iv = UIImageView()
        iv.image = .init(resource: .button1)
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    private lazy var button2: UIImageView = {
        let iv = UIImageView()
        iv.image = .init(resource: .button2)
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    private lazy var button3: UIImageView = {
        let iv = UIImageView()
        iv.image = .init(resource: .button3)
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    // 중간 화면
    private lazy var centerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var centerLabel: UIImageView = {
        let iv = UIImageView()
        iv.image = .init(resource: .특가배너)
        return iv
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.isScrollEnabled = false
        return cv
    }()
    
    private lazy var bottomBanner: UIImageView = {
        let iv = UIImageView()
        iv.image = .init(resource: .bottomBanner)
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = #colorLiteral(red: 0.4304369688, green: 0.7858224511, blue: 0.7814640403, alpha: 1)
        
        addSubviews()
        configureConstraints()
        configureCollectionView()
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        view.addSubview(indicatorView)
        view.addSubview(navigationBar)
        view.addSubview(navigationLabel)
        
        view.addSubview(firstBarButton)
        view.addSubview(secondBarButton)
        view.addSubview(thirdBarButton)
        
        
        view.addSubview(bottomDummyView)
        
        view.addSubview(scrollView)
        
        
        scrollView.addSubview(containerView)
        
        containerView.addSubview(dummyView)
        containerView.addSubview(searchView)
        containerView.addSubview(searchBarImage)
        
        containerView.addSubview(couponBanner)
        
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        
        containerView.addSubview(centerView)
        centerView.addSubview(centerLabel)
        centerView.addSubview(collectionView)
        
        containerView.addSubview(bottomBanner)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        
        indicatorView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(indicatorView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
        
        navigationLabel.snp.makeConstraints { make in
            make.leading.equalTo(navigationBar.snp.leading).offset(15)
            make.centerY.equalTo(navigationBar)
        }
        
        thirdBarButton.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.top).offset(12)
            make.bottom.equalTo(navigationBar.snp.bottom).offset(-12)
            make.trailing.equalTo(navigationBar.snp.trailing).offset(-15)
            make.width.equalTo(thirdBarButton.snp.height)
        }
        
        secondBarButton.snp.makeConstraints { make in
            make.trailing.equalTo(thirdBarButton.snp.leading).offset(-15)
            make.top.equalTo(navigationBar.snp.top).offset(12)
            make.bottom.equalTo(navigationBar.snp.bottom).offset(-12)
            make.width.equalTo(secondBarButton.snp.height)
        }
        
        firstBarButton.snp.makeConstraints { make in
            make.trailing.equalTo(secondBarButton.snp.leading).offset(-15)
            make.top.equalTo(navigationBar.snp.top).offset(12)
            make.bottom.equalTo(navigationBar.snp.bottom).offset(-12)
            make.width.equalTo(firstBarButton.snp.height)
        }
        
        bottomDummyView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalToSuperview()
            make.height.equalTo(350)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        dummyView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        searchView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(60)
        }
        
        searchBarImage.snp.makeConstraints { make in
            make.top.equalTo(searchView)
            make.horizontalEdges.bottom.equalTo(searchView).inset(15)
        }
        
        couponBanner.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(couponBanner.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(120)
        }
        
        centerView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(250)
        }
        
        centerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(centerLabel.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalToSuperview().inset(10)
        }
        
        bottomBanner.snp.makeConstraints { make in
            make.top.equalTo(centerView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(120)
            make.bottom.equalToSuperview().inset(10)
        }
        
        
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setupUI(ButtonList.list[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 40) / 5, height: (self.collectionView.frame.height - 10) / 2)
    }
    
}

#Preview {
    let vc = ViewController(nibName: nil, bundle: nil)
    return vc
}
