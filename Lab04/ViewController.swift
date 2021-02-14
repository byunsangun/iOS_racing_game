//
//  ViewController.swift
//  Lab04
//
//  Created by 변상운 on 2020/10/14.
//  Copyright © 2020 sangun. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet weak var gameTimer: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var carImage: UIImageView!
    
    @IBOutlet weak var otherCarImage1: UIImageView!
    @IBOutlet weak var otherCarImage2: UIImageView!
    @IBOutlet weak var otherCarImage3: UIImageView!
    @IBOutlet weak var otherCarImage4: UIImageView!
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinImage2: UIImageView!
    @IBOutlet weak var coinImage3: UIImageView!
    @IBOutlet weak var coinImage4: UIImageView!
    
    @IBOutlet weak var warningImage4: UIImageView!
    @IBOutlet weak var warningImage3: UIImageView!
    @IBOutlet weak var warningImage2: UIImageView!
    @IBOutlet weak var warningImage: UIImageView!
    
    @IBOutlet weak var restrictImage: UIImageView!
    @IBOutlet weak var restrictImage2: UIImageView!
    @IBOutlet weak var restrictImage3: UIImageView!
    @IBOutlet weak var restrictImage4: UIImageView!
    
    @IBOutlet weak var coinCountLabel: UILabel!
    @IBOutlet weak var thirdHeart: UIImageView!
    @IBOutlet weak var secondHeart: UIImageView!
    @IBOutlet weak var firstHeart: UIImageView!
    @IBOutlet weak var countdownImage: UIImageView!
    @IBOutlet weak var countdownLabel: UILabel!
    
    @IBOutlet weak var roadLineImage2: UIImageView!
    @IBOutlet weak var roadLineImage: UIImageView!
    @IBOutlet weak var collisionImage: UIImageView!
    @IBOutlet weak var screenForGameOver: UIImageView!
    
    @IBOutlet weak var coinCountImage: UIImageView!
    
    var timer = Timer()
    var animationTimer = Timer()
    var playTimer = Timer()
    var coinTimer = Timer()
    var warningTimer = Timer()
    var count = 3
    var lifeCount = 3
    
    var animator: UIViewPropertyAnimator?
    var reset: Bool = false
    var gameFinish = false
    
    var playTime = 0
    var sentTime: String = ""
    
    var warningCollisionCount = 0
    var coinCollisionCount = 0
    var collisionCount = 0
    
    var coinCount = 0
    
    var coinHidden1 = false
    var coinHidden2 = false
    var coinHidden3 = false
    var coinHidden4 = false
    
    
    var collision : Bool = false
    var coinCollision : Bool = false
    var warningCollision : Bool = false
    
    var elseCount = 0
    var elseCoinCount = 0
    var elseWarningCount = 0
    
    
    let firstLine = CGRect(x: 47, y: -100, width: 50, height: 100)
    let secondLine = CGRect(x: 122, y: -100, width: 50, height: 100)
    let thirdLine = CGRect(x: 197, y: -100, width: 50, height: 100)
    let fourthLine = CGRect(x: 272, y: -100, width: 50, height: 100)
    
    
    func animateBackground() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            self.roadLineImage.frame = self.roadLineImage.frame.offsetBy(dx: 0.0, dy: 1 * self.roadLineImage.frame.size.height)
        }, completion: nil)

    }
    
    func animateBackground2() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            self.roadLineImage2.frame = self.roadLineImage2.frame.offsetBy(dx: 0.0, dy: 1 * self.roadLineImage2.frame.size.height)
        }, completion: nil)

    }
    
    
    @IBAction func moveLeftButton(_ sender: UIButton) {
        
        if(carImage.frame.origin.x != 47.0) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
            self.carImage.center.x -= 75
        }, completion: nil)
        print(carImage.frame.origin.x)
        }
    }
    @IBAction func moveRightButton(_ sender: UIButton) {
        if(carImage.frame.origin.x !=  272.0){
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
            self.carImage.center.x += 75
        }, completion: nil)
        print(carImage.frame.origin.x)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        self.navigationController?.isNavigationBarHidden = true
        let car: UIImage? = UIImage(named: "sportCar")
        //let blueCar: UIImage? = UIImage(named: "blue")
        //let pinkCar: UIImage? = UIImage(named: "pink")
        let yellowCar: UIImage? = UIImage(named: "yellow")
        //let orangeCar: UIImage? = UIImage(named: "orange")
        let warning: UIImage? = UIImage(named: "warning")
        let restrict: UIImage? = UIImage(named: "restrict")
        let heart: UIImage? = UIImage(named: "heart")
        
        
        let coin: UIImage? = UIImage(named: "coin")
        let highway: UIImage? = UIImage(named: "highway")
        
        
        backgroundImage.image = highway
        
        firstHeart.image = heart
        secondHeart.image = heart
        thirdHeart.image = heart
        
        carImage.image = car
        carImage.frame = CGRect(x: 122, y: 570, width: 50, height: 100)
        
        otherCarImage1.image = yellowCar
        otherCarImage1.frame = firstLine
        otherCarImage2.image = yellowCar
        otherCarImage2.frame = secondLine
        otherCarImage3.image = yellowCar
        otherCarImage3.frame = thirdLine
        otherCarImage4.image = yellowCar
        otherCarImage4.frame = fourthLine
        
        coinImage.image = coin
        coinImage.frame = firstLine
        coinImage2.image = coin
        coinImage2.frame = secondLine
        coinImage3.image = coin
        coinImage3.frame = thirdLine
        coinImage4.image = coin
        coinImage4.frame = fourthLine
        
        warningImage.image = warning
        warningImage.frame = firstLine
        warningImage2.image = warning
        warningImage2.frame = secondLine
        warningImage3.image = warning
        warningImage3.frame = thirdLine
        warningImage4.image = warning
        warningImage4.frame = fourthLine
        
        coinCountImage.image = coin

        restrictImage.image = restrict
        restrictImage.frame = firstLine
        restrictImage2.image = restrict
        restrictImage2.frame = secondLine
        restrictImage3.image = restrict
        restrictImage3.frame = thirdLine
        restrictImage4.image = restrict
        restrictImage4.frame = fourthLine
        
        startTimer()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.layoutIfNeeded()
        
    }
    
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update(_ tiemr: Timer) {
        
        if(count > 0) {
            countdownLabel.text! = String(count)
            count = count - 1
            backgroundImage.alpha = 0.9
            
        } else if(count == 0) {
            countdownLabel.isHidden = true
            countdownImage.isHidden = true
            let highway_background: UIImage? = UIImage(named: "highway_background")
            backgroundImage.image = highway_background
            backgroundImage.alpha = 1
            startGameTimer()
            gameStart()
            
            // background animation
            let roadLine: UIImage? = UIImage(named: "highway_line")
            roadLineImage.image = roadLine
            roadLineImage.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
            roadLineImage2.image = roadLine
            roadLineImage2.frame = CGRect(x: 0, y: -812, width: 375, height: 812)
            animateBackground()
            animateBackground2()
            
            timer.invalidate()
        }
    }
    
    
    func gameStart() {
            
        let randomSpeed1 : Int = Int(arc4random_uniform(5) + 7)
        let randomSpeed2 : Int = Int(arc4random_uniform(5) + 6)
        let randomSpeed3 : Int = Int(arc4random_uniform(5) + 5)
        let randomSpeed4 : Int = Int(arc4random_uniform(5) + 4)
        
        let coinSpeed1 : Int = Int(arc4random_uniform(5) + 3)
        let coinSpeed2 : Int = Int(arc4random_uniform(5) + 7)
        let coinSpeed3 : Int = Int(arc4random_uniform(5) + 5)
        let coinSpeed4 : Int = Int(arc4random_uniform(5) + 4)
        
        let warningSpeed1 : Int = Int(arc4random_uniform(5) + 5)
        let warningSpeed2 : Int = Int(arc4random_uniform(5) + 7)
        let warningSpeed3 : Int = Int(arc4random_uniform(5) + 6)
        let warningSpeed4 : Int = Int(arc4random_uniform(5) + 8)
        
        let restrictRandomSpeed1 : Int = Int(arc4random_uniform(4) + 5)
        let restrictRandomSpeed2 : Int = Int(arc4random_uniform(4) + 4)
        let restrictRandomSpeed3 : Int = Int(arc4random_uniform(4) + 6)
        let restrictRandomSpeed4 : Int = Int(arc4random_uniform(4) + 5)
        
        // START car animation------------------------------------------------------------------------
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.downCarAnimation(self.otherCarImage1, timeDuration: randomSpeed1)
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
               DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                   self.downCarAnimation(self.otherCarImage2, timeDuration: randomSpeed2)
                }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.downCarAnimation(self.otherCarImage3, timeDuration: randomSpeed3)
                        }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.downCarAnimation(self.otherCarImage4, timeDuration: randomSpeed4)
                }
        }
        // -------------------------------------------------------------------------------------------
        
        
    
        // START coin animation------------------------------------------------------------------------
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    self.downCoinAnimation(self.coinImage, timeDuration: coinSpeed1)
                }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                    self.downCoinAnimation(self.coinImage2, timeDuration: coinSpeed2)
                }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
                    self.downCoinAnimation(self.coinImage3, timeDuration: coinSpeed3)
                }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                    self.downCoinAnimation(self.coinImage4, timeDuration: coinSpeed4)
                }
        }
        // -------------------------------------------------------------------------------------------
        
        
        
        // START warning or restrict animation---------------------------------------------------------
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.downWarningAnimation(self.warningImage, timeDuration: warningSpeed1)
                }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
                    self.downWarningAnimation(self.warningImage2, timeDuration: warningSpeed2)
                }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 13) {
                    self.downWarningAnimation(self.warningImage3, timeDuration: warningSpeed3)
                }
        }
        DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.asyncAfter(deadline: .now() + 19) {
                    self.downWarningAnimation(self.warningImage4, timeDuration: warningSpeed4)
                }
        }
        // -------------------------------------------------------------------------------------------

       
            // START car animation------------------------------------------------------------------------
               DispatchQueue.global(qos: .userInitiated).async {
                   DispatchQueue.main.asyncAfter(deadline: .now() + 18) {
                       self.downRestrictAnimation(self.restrictImage, timeDuration: restrictRandomSpeed1)
                   }
               }
               DispatchQueue.global(qos: .userInitiated).async {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                          self.downRestrictAnimation(self.restrictImage2, timeDuration: restrictRandomSpeed2)
                       }
               }
               DispatchQueue.global(qos: .userInitiated).async {
                       DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                           self.downRestrictAnimation(self.restrictImage3, timeDuration: restrictRandomSpeed3)
                               }
               }
               DispatchQueue.global(qos: .userInitiated).async {
                       DispatchQueue.main.asyncAfter(deadline: .now() + 17) {
                           self.downRestrictAnimation(self.restrictImage4, timeDuration: restrictRandomSpeed4)
                       }
               }
               // -------------------------------------------------------------------------------------------
               
        
        
    }
    
    
    
    
    
    func downCarAnimation(_ sender: UIImageView, timeDuration: Int) {
        UIView.animate(withDuration: TimeInterval(timeDuration), delay: 1, options: [.repeat], animations: {
            sender.transform = CGAffineTransform(translationX: 0, y: 1000)
            self.animationTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateForDetectCollision), userInfo: nil, repeats: true)
        } , completion: nil)
        
    }
    
    func downCoinAnimation(_ sender: UIImageView, timeDuration: Int) {
        UIView.animate(withDuration: TimeInterval(timeDuration), delay: 1, options: [.repeat], animations: {
            sender.transform = CGAffineTransform(translationX: 0, y: 1000)
            self.coinTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateForCoinDetectCollision), userInfo: nil, repeats: true)
        } , completion: nil)
        
    }
    
    func downWarningAnimation(_ sender: UIImageView, timeDuration: Int) {
        UIView.animate(withDuration: TimeInterval(timeDuration), delay: 1, options: [.repeat], animations: {
            sender.transform = CGAffineTransform(translationX: 0, y: 1000)
            self.warningTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateForWarningDetectCollision), userInfo: nil, repeats: true)
        } , completion: nil)
    }
    
    func downRestrictAnimation(_ sender: UIImageView, timeDuration: Int) {
        UIView.animate(withDuration: TimeInterval(timeDuration), delay: 1, options: [.repeat], animations: {
            sender.transform = CGAffineTransform(translationX: 0, y: 1000)
            self.animationTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateRestrictForDetectCollision), userInfo: nil, repeats: true)
        } , completion: nil)
        
    }
    
    
    
    
    @objc func updateForDetectCollision(_ timer: Timer){
        detectCollision(otherCarImage1)
        detectCollision(otherCarImage2)
        detectCollision(otherCarImage3)
        detectCollision(otherCarImage4)
        
    }
    @objc func updateForCoinDetectCollision(_ timer: Timer){
        detectCoinCollision(coinImage)
        detectCoinCollision(coinImage2)
        detectCoinCollision(coinImage3)
        detectCoinCollision(coinImage4)
    }
    
    @objc func updateForWarningDetectCollision(_ timer: Timer){
        detectWarningCollision(warningImage)
        detectWarningCollision(warningImage2)
        detectWarningCollision(warningImage3)
        detectWarningCollision(warningImage4)
    }
    
    @objc func updateRestrictForDetectCollision(_ timer: Timer){
        detectCollision(restrictImage)
        detectCollision(restrictImage2)
        detectCollision(restrictImage3)
        detectCollision(restrictImage4)
    }
    

    
    @objc func detectCollision(_ otherCar: UIImageView) {
        
            if ( abs(carImage.frame.origin.y - otherCar.layer.presentation()!.frame.origin.y) < 3 ) && ( abs(carImage.frame.origin.x - otherCar.layer.presentation()!.frame.origin.x) < 10) {
                self.collisionCount = self.collisionCount + 1
                
                if(self.collisionCount == 1) {
                    self.collision = true
                    collisionAnimation()
                    self.lifeCount = self.lifeCount - 1
                }
                
                if(self.lifeCount == 2) {
                    firstHeart.image = nil
                } else if(self.lifeCount == 1){
                    firstHeart.image = nil
                    secondHeart.image = nil
                } else if(self.lifeCount == 0){
                    firstHeart.image = nil
                    secondHeart.image = nil
                    thirdHeart.image = nil
                    
                    
                    playTimer.invalidate()
                    coinTimer.invalidate()
                    warningTimer.invalidate()
                    animationTimer.invalidate()
                    
                    stopAnimation()
                    popUp()
                }
        }
                
        else {
            if(self.collision == true) {
                self.elseCount = self.elseCount + 1
            }
            if(self.elseCount > 100) {
                self.elseCount = 0
                self.collisionCount = 0
                self.collision = false
            }
        }
    }
    
    
    @objc func detectCoinCollision(_ coin: UIImageView) {
        
        var coinHidden : Bool? = false
        
        if(coin == coinImage) {
            coinHidden = coinHidden1
        } else if(coin == coinImage2) {
            coinHidden = coinHidden2
        } else if(coin == coinImage3) {
            coinHidden = coinHidden3
        } else if(coin == coinImage4) {
            coinHidden = coinHidden4
        }
        
        if(coinHidden == true) {
            coin.isHidden = true
        } else {
            coin.isHidden = false
        }
        
        if ( abs(carImage.frame.origin.y - coin.layer.presentation()!.frame.origin.y) < 3 ) && ( abs(carImage.frame.origin.x - coin.layer.presentation()!.frame.origin.x) < 10) {
            
                self.coinCollisionCount = self.coinCollisionCount + 1
                
                if(self.coinCollisionCount == 1) {
                    self.coinCollision = true
                    self.coinCount = self.coinCount + 10
                    gettingCoinAnimation()
                    coinHidden = true

                    
                    coinCountLabel.text = String(self.coinCount)
                }
        }
            
        else {
            
            if(self.coinCollision == true) {
                self.elseCoinCount = self.elseCoinCount + 1
            }
            if(self.elseCoinCount > 100) {
                self.elseCoinCount = 0
                self.coinCollisionCount = 0
                self.coinCollision = false
            }

            
        }
        
        if(Int((coin.layer.presentation()?.frame.origin.y)!) > 880 ) {
            coinHidden = false
        }
        
        if(coin == coinImage) {
            coinHidden1 = coinHidden!
        } else if(coin == coinImage2) {
            coinHidden2 = coinHidden!
        } else if(coin == coinImage3) {
            coinHidden3 = coinHidden!
        } else if(coin == coinImage4) {
            coinHidden4 = coinHidden!
        }
        
    }
    
    
    @objc func detectWarningCollision(_ warning: UIImageView) {
        
            if ( abs(carImage.frame.origin.y - warning.layer.presentation()!.frame.origin.y) < 3 ) && ( abs(carImage.frame.origin.x - warning.layer.presentation()!.frame.origin.x) < 10) {
                self.warningCollisionCount = self.warningCollisionCount + 1
                
                if(self.warningCollisionCount == 1) {
                    self.warningCollision = true
                    collisionAnimation()
                    self.lifeCount = self.lifeCount - 1
                }
                
                if(self.lifeCount == 2) {
                    firstHeart.image = nil
                } else if(self.lifeCount == 1){
                    firstHeart.image = nil
                    secondHeart.image = nil
                } else if(self.lifeCount == 0){
                    firstHeart.image = nil
                    secondHeart.image = nil
                    thirdHeart.image = nil
                    
                    playTimer.invalidate()
                    coinTimer.invalidate()
                    warningTimer.invalidate()
                    animationTimer.invalidate()
                    
                    stopAnimation()
                    
                    popUp()
                }
        }
                
        else {
            if(self.warningCollision == true) {
                self.elseWarningCount = self.elseWarningCount + 1
            }
            if(self.elseWarningCount > 100) {
                self.elseWarningCount = 0
                self.warningCollisionCount = 0
                self.warningCollision = false
            }
        }
    }
    
    
    
    
    
    func popUp() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "popUpViewController") as! popUpViewController
        vc.playTime = self.sentTime
        vc.playScore = self.coinCount
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    func startGameTimer() {
        self.playTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateGameTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateGameTimer() {
        
        var parsedMilisecond: String = ""
        var parsedSecond: String = ""
        var parsedMinute: String = ""
        
        let milisecond = self.playTime % 100
        if(milisecond < 10) {
            parsedMilisecond = "0\(milisecond)"
        } else {
            parsedMilisecond = "\(milisecond)"
        }
        
        let second = Int(self.playTime / 100) % 60
        if(second < 10) {
            parsedSecond = "0\(second)"
        } else {
            parsedSecond = "\(second)"
        }
        
        let minute = Int(self.playTime / 6000)
        if(minute < 10) {
            parsedMinute = "0\(minute)"
        } else {
            parsedMinute = "\(minute)"
        }
        
        sentTime = parsedMinute + " : " + parsedSecond + " : " + parsedMilisecond
        gameTimer.text = sentTime
        self.playTime = self.playTime + 1
    }
        
    
    func stopAnimation() {
        roadLineImage.layer.removeAllAnimations()
        roadLineImage2.layer.removeAllAnimations()
        otherCarImage1.layer.removeAllAnimations()
        otherCarImage2.layer.removeAllAnimations()
        otherCarImage3.layer.removeAllAnimations()
        otherCarImage4.layer.removeAllAnimations()
        coinImage.layer.removeAllAnimations()
        coinImage2.layer.removeAllAnimations()
        coinImage3.layer.removeAllAnimations()
        coinImage4.layer.removeAllAnimations()
        warningImage.layer.removeAllAnimations()
        warningImage2.layer.removeAllAnimations()
        warningImage3.layer.removeAllAnimations()
        warningImage4.layer.removeAllAnimations()
        restrictImage.layer.removeAllAnimations()
        restrictImage2.layer.removeAllAnimations()
        restrictImage3.layer.removeAllAnimations()
        restrictImage4.layer.removeAllAnimations()
        
        let highway: UIImage? = UIImage(named: "highway")
        screenForGameOver.image = highway
        screenForGameOver.frame = CGRect(x: 0, y: 0, width: 375, height: 812)

    }
    
    func collisionAnimation() {
        
        UIView.animate(withDuration: 0.05, delay: 1, options: [.curveLinear], animations: {
            self.collisionImage.backgroundColor = UIColor.red.withAlphaComponent(0.4)
            self.collisionImage.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        } , completion: nil)
        
        UIView.animate(withDuration: 0.05, delay: 1, options: [.curveLinear], animations: {
            self.collisionImage.backgroundColor = UIColor.red.withAlphaComponent(0)
            self.collisionImage.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        } , completion: nil)
        
        
        
    }
    
    func gettingCoinAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.coinCountLabel.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        } , completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.coinCountLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } , completion: nil)
    }
    
}


