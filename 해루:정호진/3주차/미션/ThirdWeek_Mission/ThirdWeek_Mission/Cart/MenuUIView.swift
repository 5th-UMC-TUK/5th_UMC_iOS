//
//  MenuUIView.swift
//  ThirdWeek_Mission
//
//  Created by 정호진 on 2023/10/01.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

final class MenuUIView: UIView {
    
    /// MARK:
    private lazy var menuImage: UIImageView = {
        let view = UIImageView(image: DataList.image )
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    /// MARK:
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    /// MARK:
    private lazy var information: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    /// MARK:
    private lazy var price: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    /// MARK:
    private lazy var totalPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        return label
    }()
    
    /// MARK:
    private lazy var optionButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("옵션변경", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        btn.layer.cornerRadius = 10
        return btn
    }()
 
    /// MARK:
    private lazy var stepperButton: UIStepper = {
        let step = UIStepper()
        step.value = 1
        step.stepValue = 1
        return step
    }()
    
    /// MARK:
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    /// MARK:
    private lazy var deleteButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "multiply")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        return btn
    }()
    
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// MARK:
    private func addSubViews(){
        addSubview(menuImage)
        addSubview(title)
        addSubview(information)
        addSubview(totalPrice)
        addSubview(lineView)
        addSubview(optionButton)
        addSubview(stepperButton)
        addSubview(deleteButton)
        constraints()
    }
    
    /// MARK:
    private func constraints(){
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        menuImage.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(100)
        }
        
        information.snp.makeConstraints { make in
            make.top.equalTo(menuImage.snp.top)
            make.leading.equalTo(menuImage.snp.trailing).offset(20)
        }
        
        totalPrice.snp.makeConstraints { make in
            make.top.equalTo(information.snp.bottom).offset(10)
            make.leading.equalTo(menuImage.snp.trailing).offset(20)
        }
        
        stepperButton.snp.makeConstraints { make in
            make.bottom.equalTo(lineView.snp.top).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
        
        optionButton.snp.makeConstraints { make in
            make.bottom.equalTo(lineView.snp.top).offset(-20)
            make.trailing.equalTo(stepperButton.snp.leading).offset(-10)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(title.snp.top)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(30)
        }
        
    }
    
    func input(menu: Menu){
        title.text = DataList.title
        
        if let price = menu.price?.price {
            information.addArrangedSubview(self.price)
            self.price.text = "* 가격: (\(price)원)"
        }
        
        var priceCount = menu.price?.price ?? 0
        menu.topping?.forEach({ price in
            let toppingLabel = UILabel()
            toppingLabel.textColor = .lightGray
            
            information.addArrangedSubview(toppingLabel)
            toppingLabel.text = "* \(price.label ?? "") (\(price.price ?? 0)원)"
            priceCount += price.price ?? 0
        })
        
        totalPrice.text = "\(priceCount)원"
    }

}
