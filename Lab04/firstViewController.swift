//
//  firstViewController.swift
//  Lab04
//
//  Created by 변상운 on 2020/10/16.
//  Copyright © 2020 sangun. All rights reserved.
//

import Foundation
import UIKit

class firstViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBAction func goScorePage(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "scoreViewController") as! scoreViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func goNextPage(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        
        
        definesPresentationContext = true
        self.navigationController?.isNavigationBarHidden = true
        
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        tintView.frame = CGRect(x: 0, y: 0, width: backgroundImage.frame.width, height: backgroundImage.frame.height)

        backgroundImage.addSubview(tintView)
        
        
    }
    
    
}

