//
//  SecondViewController.swift
//  Week03_StudyMission
//
//  Created by 이승진 on 2023/10/08.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previousViewController?.myLabel.text = self.textField.text
    }
    

    @IBOutlet weak var textField: UITextField!
    
    var previousViewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        previousViewController?.delegate = self
    }
    

    @IBAction func buttonDismiss(_ sender: UIButton) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    

}
