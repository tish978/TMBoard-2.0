//
//  ViewController.swift
//  TMBoard
//
//  Created by satish bisa on 5/10/21.
//

import UIKit
import AVFoundation

class TMBoard: UIViewController, CAAnimationDelegate {

    /*
     TMG SOUNDS: 2018 highlight video
     - squat 680
     - unconvincing gay guy
     - 6:38 -> "noel miller is 5'8"
     - 9:55 -> buckle your seatbelt
     - 13:45 -> "crash it"
     - ew dude wtf
     - malone brown
     */
    
    var player: AVAudioPlayer?
    var videoPlayer: AVPlayer?
    
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect.zero
        return gradientLayer
    }()
    
    let buttonOne: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textColor = .systemPink
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    let filterBackgroundView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let secondButton: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let thirdButton: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    
    let fourthButton: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let fifthButton: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let sixthButton: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let seventhButton: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    let eighthButton: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 200))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = #colorLiteral(red: 0.9764705882, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        v.layer.borderWidth = 2
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = v.bounds
        v.layer.addSublayer(gradient)
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.isHidden = false
        v.isUserInteractionEnabled = true
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playHomeVideo()
        setupView()
    }
    
    func playHomeVideo(){
        let path = Bundle.main.path(forResource: "homeScreenTMG", ofType: "mp4")
        videoPlayer = AVPlayer(url: URL(fileURLWithPath: path!))
        videoPlayer!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoPlayer!.currentItem)
        videoPlayer!.seek(to: CMTime.zero)
        videoPlayer!.play()
        self.videoPlayer?.isMuted = true
    }
    
    func playBackgroundVideo(){
        playWalkman()
        let path = Bundle.main.path(forResource: "cuttingMeat", ofType: "mp4")
        videoPlayer = AVPlayer(url: URL(fileURLWithPath: path!))
        videoPlayer!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoPlayer!.currentItem)
        videoPlayer!.seek(to: CMTime.zero)
        videoPlayer!.play()
        self.videoPlayer?.isMuted = true
    }
    
    @objc func playerItemDidReachEnd(){
        videoPlayer!.seek(to: CMTime.zero)
    }
    
    func setupView(){
        filterBackgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buckleYourSeatbelt)))
        secondButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iLikeDudesALot)))
        filterBackgroundView.layer.addSublayer(gradientLayer)
        gradientLayer.frame = filterBackgroundView.bounds
        view.addSubview(filterBackgroundView)
        view.addSubview(secondButton)
        filterBackgroundView.addSubview(buttonOne)
        buttonOne.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        buttonOne.center = view.center
        thirdButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(squat680)))
        fourthButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ewDudeWtf)))
        fifthButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imANiceGuy)))
        sixthButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(roastingFan)))
        seventhButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nicLevels)))
        eighthButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callMeSugar)))
        view.addSubview(fourthButton)
        view.addSubview(thirdButton)
        view.addSubview(fifthButton)
        view.addSubview(sixthButton)
        view.addSubview(seventhButton)
        view.addSubview(eighthButton)
        
        
        filterBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        filterBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        filterBackgroundView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        filterBackgroundView.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
        
        secondButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        secondButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
        thirdButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 275).isActive = true
        thirdButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        thirdButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
        fourthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 275).isActive = true
        fourthButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220).isActive = true
        fourthButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fourthButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
        fifthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        fifthButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        fifthButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fifthButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
        sixthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        sixthButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220).isActive = true
        sixthButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        sixthButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
        seventhButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 625).isActive = true
        seventhButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        seventhButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        seventhButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
        eighthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 625).isActive = true
        eighthButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220).isActive = true
        eighthButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        eighthButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        
    }
    
    @objc private func callMeSugar(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "callMeSugar", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            
            } catch {
                print("something went wrong")
            }
        }
        
        print("Attempting to animate stroke")
    }
    
    
    @objc private func nicLevels(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "nicLevels", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            
            } catch {
                print("something went wrong")
            }
        }
        
        print("Attempting to animate stroke")
    }
    
    @objc private func roastingFan(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "roastingFan", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            
            } catch {
                print("something went wrong")
            }
        }
        
        print("Attempting to animate stroke")
    }
    
    @objc private func imANiceGuy(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "imANiceGuy", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            
            } catch {
                print("something went wrong")
            }
        }
        
        print("Attempting to animate stroke")
    }
    
    
    @objc private func playWalkman(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "walkman", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            
            } catch {
                print("something went wrong")
            }
        }
        
        print("Attempting to animate stroke")
    }
    
    @objc private func ewDudeWtf(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "ewDudeWtf", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
                
            } catch {
                print("something went wrong")
            }
        }
        print("Attempting to animate stroke")
    }
    
    @objc private func squat680(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "squat680", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
                
            } catch {
                print("something went wrong")
            }
        }
        print("Attempting to animate stroke")
    }
    
    
    @objc private func buckleYourSeatbelt(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "buckleYourSeatbelt", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
                
            } catch {
                print("something went wrong")
            }
        }
        print("Attempting to animate stroke")
    }
    
    @objc private func iLikeDudesALot(){
        if let player = player, player.isPlaying{
            // stop playback
        } else {
            // setup player and play
            let urlString = Bundle.main.path(forResource: "iLikeDudesAlot", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            
            } catch {
                print("something went wrong")
            }
        }
        
        print("Attempting to animate stroke")
    }
    
}

