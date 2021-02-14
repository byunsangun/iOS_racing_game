//
//  popUpViewController.swift
//  Lab04
//
//  Created by 변상운 on 2020/10/16.
//  Copyright © 2020 sangun. All rights reserved.
//



import Foundation
import UIKit

class popUpViewController: UIViewController {
    
    @IBOutlet weak var labTime: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var storeButton: UIButton!
    
    var playTime: String!
    var playScore: Int!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.labTime.text = playTime
        self.scoreLabel.text = String(playScore)
        
        // 키보드 올라올 시 화면 이동
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
   
    
    @IBAction func goHomeButton(_ sender: Any) {
        
        let presentingVC = self.presentingViewController
        self.dismiss(animated: true) {
            presentingVC?.navigationController?.popToRootViewController(animated: false)
        }
    }
       
    
    @IBAction func tapStoreButton(_ sender: Any) {
        
        if(playerName.text == "") {
            let alert = UIAlertController(title: "오류", message: "이름을 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)
            alert.addAction(defaultAction)
            present(alert,animated: false, completion: nil)
        }
        else {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let scoreViewController = storyboard.instantiateViewController(withIdentifier: "scoreViewController") as! scoreViewController
        scoreViewController.modalTransitionStyle = .coverVertical
    
        var players : [[String]] = defaults.array(forKey: "numberOfPlayers") as! [[String]]
        
        // 플레이어 점수 저장
        players.append([playerName.text!, labTime.text!, scoreLabel.text!])
        defaults.set(players, forKey: "numberOfPlayers")
        
        self.present(scoreViewController, animated: true, completion: nil)
            
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
}
