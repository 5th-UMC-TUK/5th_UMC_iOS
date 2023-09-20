//
//  ViewController.swift
//  FirstWeek_Mission
//
//  Created by 정호진 on 2023/09/17.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    /// MARK:
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.3)
        return view
    }()

    /// MARK:
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    /// MARK: 위에 녹색 부분 UIView
    private lazy var topUIView: TopUIView = {
        let view = TopUIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 20
        return view
    }()
    
    /// MARK:
    private lazy var firstBannerUIView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    /// MARK:
    private lazy var firstBanner: UIImageView = {
        let view = UIImageView(image: UIImage(named: "1"))
        view.backgroundColor = .white
        return view
    }()
    
    /// MARK:
    private lazy var deliverImage1: UIImageView = {
        let view = UIImageView(image: UIImage(named: "3")?.resize(newWidth: 80, newHeight: 80).withAlignmentRectInsets(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)))
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        return view
    }()
    
    /// MARK:
    private lazy var deliverImage2: UIImageView = {
        let view = UIImageView(image: UIImage(named: "2")?.resize(newWidth: 80, newHeight: 80).withAlignmentRectInsets(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)))
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }()
    
    /// MARK:
    private lazy var deliverImage3: UIImageView = {
        let view = UIImageView(image: UIImage(named: "4")?.resize(newWidth: 80, newHeight: 80).withAlignmentRectInsets(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)))
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }()
    
    
    /// MARK:
    private lazy var stackView1: UIStackView = {
        let view = UIStackView(arrangedSubviews: [deliverImage1,deliverImage2,deliverImage3])
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// MARK: 중간에 선택 리스트 있는 뷰
    private lazy var middleUIView: MiddleUIView = {
        let view = MiddleUIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    /// MARK:
    private lazy var adsImg: UIImageView = {
        let view = UIImageView(image: UIImage(named: "5"))
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    
    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.9)
        addUI()
    }
    
    
    // MARK: - Functions
    
    /// MARK: Add UI
    private func addUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(topUIView)
        
        contentView.addSubview(firstBannerUIView)
        firstBannerUIView.addSubview(firstBanner)
        
        contentView.addSubview(stackView1)
        contentView.addSubview(middleUIView)
        
        contentView.addSubview(adsImg)
        constraints()
    }
    
    /// MARK: Constraints
    private func constraints(){
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
        
        topUIView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.height/5)
        }
        
        firstBannerUIView.snp.makeConstraints { make in
            make.top.equalTo(topUIView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(70)
        }
        
        firstBanner.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(view.safeAreaLayoutGuide.layoutFrame.width*2/3)
            make.bottom.equalToSuperview()
        }
        
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(firstBannerUIView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(120)
        }
        
        middleUIView.snp.makeConstraints { make in
            make.top.equalTo(stackView1.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(220)
        }
        middleUIView.input()
        
        adsImg.snp.makeConstraints { make in
            make.top.equalTo(middleUIView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(150)
            make.bottom.equalToSuperview()
        }
        
        
    }

}
