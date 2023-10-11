//
//  ViewController.swift
//  Week03_StudyMission
//
//  Created by 이승진 on 2023/10/08.
//

import UIKit

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

class Person: Flyable, Runnable {
    func run() {
        print("달렸다.")
    }
    
    func fly() {
        print("날았다.")
    }
    
    
}

protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {
    
    let person = Person()
    
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    var delegate : ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person.fly()
        person.run()
    }


    @IBAction func buttonGoNextVC(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        
        present(nextVC, animated: true, completion: nil)
    }
}
