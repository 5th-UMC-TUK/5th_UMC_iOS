//
//  TableViewCell.swift
//  Mission5
//
//  Created by 이정동 on 10/11/23.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        return view
    }()
    
    private lazy var songLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()
    
    private lazy var artistLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()
    
    private lazy var albumLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addSubviews()
    
    private func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(songLabel)
        stackView.addArrangedSubview(artistLabel)
        stackView.addArrangedSubview(albumLabel)
    }
    
    // MARK: - configureConstraints()
    
    private func configureConstraints() {
        stackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
    }
    
    func configureViewData(_ music: Music?) {
        guard let music = music else { return }
        self.songLabel.text = "제목 : \(music.songName)"
        self.artistLabel.text = "가수 : \(music.artistName)"
        self.albumLabel.text = "앨범 : \(music.albumName)"
    }
    
}
