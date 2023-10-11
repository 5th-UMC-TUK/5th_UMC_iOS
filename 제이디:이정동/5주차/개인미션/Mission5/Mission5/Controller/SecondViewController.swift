//
//  SecondViewController.swift
//  Mission5
//
//  Created by 이정동 on 10/11/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    private lazy var textfield: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("검색", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return view
    }()
    
    var musics: MusicData?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addSubviews()
        configureConstraints()
        addTargets()
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        view.addSubview(textfield)
        view.addSubview(button)
        view.addSubview(tableView)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        textfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().inset(50)
            make.trailing.equalTo(button.snp.leading).offset(-50)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp.top)
            make.trailing.equalToSuperview().inset(50)
            make.width.equalTo(50)
            make.bottom.equalTo(textfield.snp.bottom)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp.bottom).offset(30)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func addTargets() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let term = textfield.text ?? ""
        MusicService.shared.requestMusicData(term) { musicData in
            self.musics = musicData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.configureViewData(musics?.results[indexPath.row])
        
        return cell
    }
    
    
}
