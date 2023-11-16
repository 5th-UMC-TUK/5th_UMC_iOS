import UIKit
import ViewAnimator

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
//    let contentArray = [ "Hi", "Hello" ]
//
//    var tempArray : [Any] = []
    
    // 아래에서 위로 올라오는 애니메이션 배열
    private let animations = [AnimationType.vector(CGVector(dx: 0, dy: 50)),
                              AnimationType.zoom(scale: 0.8)]
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // "MyTableViewCell" 등록하기
        let tableNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(tableNib, forCellReuseIdentifier: "MyTableViewCell")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            [weak self] in
            guard let self = self else { return }
//            // 테이블뷰와 연결된 데이터 변경
//            self.tempArray = self.contentArray
            
            // 테이블뷰 UI 갱신
            self.tableView.reloadData()
            
            // 애니메이션 돌리기
            UIView.animate(views: self.tableView.visibleCells, animations: self.animations)
        })
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
