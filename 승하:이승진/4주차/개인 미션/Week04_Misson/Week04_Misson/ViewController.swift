//
//  ViewController.swift
//  Week04_Misson
//
//  Created by 이승진 on 2023/10/09.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var floatingButton: UIButton!
    
    let bookImage: [UIImage] = [#imageLiteral(resourceName: "MajorBook"), #imageLiteral(resourceName: "MajorBook2"), #imageLiteral(resourceName: "MajorBook3"), #imageLiteral(resourceName: "MajorBook4"), #imageLiteral(resourceName: "MajorBook5")]
    let bookName = ["컴퓨터 비전과 딥러닝", "Introduction to Algorithm", "컴퓨터 네트워킹 하향식 접근 8판", "모두를 위한 클라우드 컴퓨팅 노서영 제이펍", "쉽게 배우는 Jira Project(지라 프로젝트) 애자일 스크럼"]
    let bookPrice = ["20,000원", "40,000원", "36,000원", "30,000원", "35,000원" ]
    
    let productImage: [UIImage] = [#imageLiteral(resourceName: "AirPodsMaxImage"), #imageLiteral(resourceName: "AirPodsMaxImage"), #imageLiteral(resourceName: "iPadImage"), #imageLiteral(resourceName: "MacbookImage"), #imageLiteral(resourceName: "AppleWatchImage"), #imageLiteral(resourceName: "iPhone15Image") ]
    let productName = ["에어팟맥스 스페이스그레이", "", "아이패드 에어5 스그 64GB", "맥북 프로14 스페이스그레이", "애플워치SE2 44mm 미드나이트", "아이폰15 블랙티타늄 128GB" ]
    let productPlace = ["서울특별시 구로구 - 5시간 전", "", "서울특별시 마포구 - 3시간 전", "서울특별시 강서구 - 11시간 전", "서울특별시 동작구 - 1시간 전", "서울특별시 종로구 - 1일 전"]
    let productPrice = ["600,000원", "", "850,000원", "3,200,000원", "250,000원", "1,400,000원"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floatingButton.layer.cornerRadius = 30
        floatingButton.layer.masksToBounds = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // "VericalTableViewCell" 등록하기
        let verticalNib = UINib(nibName: "VerticalTableViewCell", bundle: nil)
        tableView.register(verticalNib, forCellReuseIdentifier: "VerticalTableViewCell")
        
        // "HorizontalTableViewCell" 등록하기
        let horizontalNib = UINib(nibName: "HorizontalTableViewCell", bundle: nil)
        tableView.register(horizontalNib, forCellReuseIdentifier: "HorizontalTableViewCell")
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 { // 중간 행에 넣기 위해서 1로 설정
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalTableViewCell", for: indexPath) as? HorizontalTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalTableViewCell", for: indexPath) as? VerticalTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            // image와 text 차례대로 넣기
            cell.productImageView.image = productImage[indexPath.row]
            cell.productName.text = productName[indexPath.row]
            cell.productPlace.text = productPlace[indexPath.row]
            cell.productPrice.text = productPrice[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 300
        } else {
            return 160
        }
    }
    
    func tableView(_ tableView:UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard  let tableViewCell = cell as? HorizontalTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as? HorizontalCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bookImageView.image = bookImage[indexPath.row]
        cell.bookNameLabel.text = bookName[indexPath.row]
        cell.bookPriceLabel.text = bookPrice[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250) // CollectionView는 width와 height 설정이 필요함
    }
}
