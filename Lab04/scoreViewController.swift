//
//  scoreViewController.swift
//  Lab04
//
//  Created by 변상운 on 2020/10/18.
//  Copyright © 2020 sangun. All rights reserved.
//

import Foundation
import UIKit

class scoreViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
    
    var playerNameSent = ""
    var playerLabTimeSent = ""
    var playerScoreSent = ""
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var playerTableView: UITableView!
    
    override func viewDidLoad() {
        
        playerTableView.dataSource = self
        playerTableView.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let players = defaults.array(forKey: "numberOfPlayers") as! [[String]]
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerTableView.dequeueReusableCell(withIdentifier: "playerTableViewCell", for: indexPath) as! playerTableViewCell

        var players = defaults.array(forKey: "numberOfPlayers") as! [[String]]
        
        cell.playerName.text = players[indexPath.row][0]
        cell.playerLabTime.text = players[indexPath.row][1]
        cell.playerScore.text = players[indexPath.row][2]
        
        return cell
    }
    
    
    
    
    
}
