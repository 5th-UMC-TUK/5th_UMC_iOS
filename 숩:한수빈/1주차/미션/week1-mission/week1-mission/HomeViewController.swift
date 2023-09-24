import UIKit

final class HomeViewController: UIViewController {

    private lazy var searchBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.7568627451, blue: 0.737254902, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.masksToBounds = true
        view.addSubview(searchTextFieldView)
        return view
    }()
    
    // MARK: - 검색창
    
    private lazy var searchTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        view.addSubview(searchTextField)
        view.addSubview(searchInfoLabel)
        return view
    }()
    
    // "찾는 맛집 이름이 뭐예요?" 안내문구
    private let searchInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "찾는 맛집 이름이 뭐예요?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    // 검색창 텍스트 필드
    private lazy var searchTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        //        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    
    // MARK: - 쿠폰 버튼
    private lazy var couponButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("집콕러세요? 30% 쿠폰 드려요!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = false
        //        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    
    // MARK: - 배달 스택뷰
    //    private lazy var deliStackView: UIStackView = {
    //        let stview = UIStackView(
    //    }
    
    private lazy var button1: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 10
        button.setTitle("집콕러세요? 30% 쿠폰 드려요!", for: .normal)
        return button
    }()
    
    
    
    private lazy var mainStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [searchBackgroundView, stackView])
        stview.spacing = 10
        stview.axis = .vertical
        return stview
    }()
    
    // MARK: - 전체 스택뷰에 배치
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [couponButton, deliStackView, menuView, adImageView])
        stview.spacing = 10
        stview.axis = .vertical
        stview.alignment = .fill
        return stview
    }()
    
    
    // MARK: - 배달 버튼 스택 뷰
    
    private lazy var deliImageView1: UIImageView = {
        let image = UIImage(named: "deli1")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var deliImageView2: UIImageView = {
        let image = UIImage(named: "deli2")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var deliImageView3: UIImageView = {
        let image = UIImage(named: "deli3")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    
    
    
    
    private lazy var deliStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [deliImageView1, deliImageView2, deliImageView3])
        stview.axis = .horizontal
        stview.spacing = 10
        stview.distribution = .fillEqually
        return stview
    }()
    
    
    // MARK: - 메뉴 버튼 뷰
    private lazy var menuView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(menuStackView1)
        return view
    }()
    
    
    // MARK: - 메뉴 뷰
    private lazy var menuStackView: UIStackView = {
        let stview = UIStackView()
        
        return stview
    }()
    
    private lazy var menuTitleImageView: UIImageView = {
        let image = UIImage(named: "menuTitle")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    
    private lazy var menuImageView1: UIImageView = {
        let image = UIImage(named: "menu1")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView2: UIImageView = {
        let image = UIImage(named: "menu2")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView3: UIImageView = {
        let image = UIImage(named: "menu3")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView4: UIImageView = {
        let image = UIImage(named: "menu4")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView5: UIImageView = {
        let image = UIImage(named: "menu5")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView6: UIImageView = {
        let image = UIImage(named: "menu6")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView7: UIImageView = {
        let image = UIImage(named: "menu7")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView8: UIImageView = {
        let image = UIImage(named: "menu8")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView9: UIImageView = {
        let image = UIImage(named: "menu9")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var menuImageView10: UIImageView = {
        let image = UIImage(named: "menu10")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    // 메뉴 아이콘 스택
    private lazy var menuStackView1: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [menuTitleImageView, menuStackView2, menuStackView3])
        stview.axis = .vertical
//        stview.spacing = 10
//        stview.spacing = self.view.frame.height / 60
//        stview.distribution = .fillEqually
        return stview
        
    }()
    
    private lazy var menuStackView2: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [menuImageView1, menuImageView2, menuImageView3, menuImageView4, menuImageView5])
        stview.axis = .horizontal
        stview.spacing = 20
        stview.distribution = .fillEqually
        return stview
        
    }()
    
    private lazy var menuStackView3: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [menuImageView6, menuImageView7, menuImageView8, menuImageView9, menuImageView10])
        stview.axis = .horizontal
        stview.spacing = 20
        stview.distribution = .fillEqually
        
        return stview

    }()
    
    
    // MARK: - 광고 배너 뷰
    private lazy var adImageView: UIImageView = {
        let image = UIImage(named: "adImage")
        let imgView = UIImageView(image: image!)
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
       
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 40
    
    
    // 오토레이아웃 향후 변경을 위한 변수(애니메이션)
    lazy var searchInfoLabelCenterYConstraint = searchInfoLabel.centerYAnchor.constraint(equalTo: searchTextFieldView.centerYAnchor)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print()
        configure()
        setupAutoLayout()
        setNavigationBar()
    }
    
    // 세팅
    private func configure() {
        view.backgroundColor = #colorLiteral(red: 0.9312983155, green: 0.9312983155, blue: 0.9312983155, alpha: 1)
        [mainStackView].forEach { view.addSubview($0) }
    }
    
    // Navigation Bar
    private func setNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.7568627451, blue: 0.737254902, alpha: 1)
        navigationController?.navigationBar.tintColor = .white // set tint color
        navigationItem.setRightBarButtonItems(
            [
                UIBarButtonItem(
                    image: UIImage(systemName: "cart"),
                    style: .plain, target: nil, action: nil
                ),
                UIBarButtonItem(
                    image: UIImage(systemName: "bell"),
                    style: .plain, target: nil, action: nil
                ),
                UIBarButtonItem(
                    image: UIImage(systemName: "square.grid.2x2"),
                    style: .plain, target: nil, action: nil
                )
            ], animated: true)
    }
    
    
    // 오토레이아웃
    private func setupAutoLayout() {
        
        searchBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        searchInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextFieldView.translatesAutoresizingMaskIntoConstraints = false
       
        deliStackView.translatesAutoresizingMaskIntoConstraints = false
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuStackView1.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            searchBackgroundView.heightAnchor.constraint(equalToConstant: 60),
            
            searchInfoLabel.leadingAnchor.constraint(equalTo: searchTextFieldView.leadingAnchor, constant: 8),
            searchInfoLabel.trailingAnchor.constraint(equalTo: searchTextFieldView.trailingAnchor, constant: -8),
            

            searchInfoLabelCenterYConstraint,
        
            searchTextField.topAnchor.constraint(equalTo: searchTextFieldView.topAnchor, constant: 15),
            searchTextField.bottomAnchor.constraint(equalTo: searchTextFieldView.bottomAnchor, constant: -2),
            searchTextField.leadingAnchor.constraint(equalTo: searchTextFieldView.leadingAnchor, constant: 8),
            searchTextField.trailingAnchor.constraint(equalTo: searchTextFieldView.trailingAnchor, constant: -8),
            
            searchTextFieldView.bottomAnchor.constraint(equalTo: searchBackgroundView.bottomAnchor, constant: -10),
            searchTextFieldView.leadingAnchor.constraint(equalTo: searchBackgroundView.leadingAnchor, constant: 15),
            searchTextFieldView.trailingAnchor.constraint(equalTo: searchBackgroundView.trailingAnchor, constant: -15),
            
            
            couponButton.heightAnchor.constraint(equalToConstant: 70),
            
            
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
    
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            

            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            deliStackView.heightAnchor.constraint(equalToConstant: 110),
            
            
            menuView.heightAnchor.constraint(equalToConstant: 220),
            
            menuStackView1.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 15),
            menuStackView1.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -15),
          
        ])
    }
}
      


        
        
        
        
        
        
        
        
        
        
        


// 전처리
#if DEBUG

import SwiftUI
@available(iOS 13.0, *)

// UIViewControllerRepresentable을 채택
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    // _ uiViewController: UIViewController로 지정
    func updateUIViewController(_ uiViewController: UIViewController , context: Context) {
        
    }
    // makeui
    func makeUIViewController(context: Context) -> UIViewController {
    // Preview를 보고자 하는 Viewcontroller 이름
    // e.g.)
        return HomeViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        // UIViewControllerRepresentable에 지정된 이름.
        ViewControllerRepresentable()

// 테스트 해보고자 하는 기기
            .previewDevice("iPhone 14 Pro")
    }
}
#endif
