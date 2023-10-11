//
//  SecondViewController.swift
//  week3-mission
//
//  Created by Subeen on 2023/09/30.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let secondView = SecondView()
    
    var itemListManager = ItemListManager()

    
    override func loadView() {  // 뷰 교체 함수
        view = secondView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = ViewController()
        vc.delegate = self
    }
    
    // MARK: - 삭제 버튼 누름
    @objc func deleteButtonTapped() {
        print("버튼 눌림")

    }
}



extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        

//        cell.menuImageView.image = itemListManager[indexPath.row].itemImage
//        cell.nameLabel.text = itemListManager[indexPath.row].name
//        cell.priceLabel.text = itemListManager[indexPath.row].price
        
        cell.item = itemListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}


extension SecondViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        
//        let array = memberListManager.getMembersList()
//        secondVC.member = array[indexPath.row]
        
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension SecondViewController: ItemDelegate {
    func addNewItem(_ item: Item) {
        itemListManager.makeNewItem(item)
    }
    
    func delete(index: Int, _ item: Item) {
        itemListManager.deleteItem(index: index)
    }
}
