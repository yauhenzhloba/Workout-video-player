//
//  VideoPlayerViewController.swift
//  fitness video
//
//  Created by EUGENE on 2/15/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var navController = UINavigationController()
    @IBOutlet weak var pauseMenuView: UIView!
    
    @IBOutlet weak var programOutlet: UILabel!
    
    @IBOutlet weak var episodeOutlet: UILabel!
    
    
    @IBOutlet weak var statusOutlet: UILabel!
    
    @IBOutlet weak var secondsOutlet: UILabel!
    
    @IBOutlet weak var doneView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var videoBackgraundView: UIView!
    

    var path = Bundle.main.path(forResource: "", ofType: "mp4")
    var videoPlayer = AVPlayer(url: URL(fileURLWithPath: ""))
    var videoLayer = AVPlayerLayer()
    var seconds = 0
    var sets = 0
    var timeForSetup = 4
    var timeForWork = 6
    var timeForRest = 3
    var timeForRestSets = 4
    var timer = Timer()
//    var timerWork = Timer()
//    var timerRest = Timer()
    var resumeTaped = false
    var isTimerRunning = false
    var timerStatus = ""
    
    var numberVideo = 1
    
    var program: [EpisodeObject] = []
    var episode = 0
    
    
    override func viewDidLoad() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        super.viewDidLoad()
        self.videoPlayer.isMuted = true
        self.pauseMenuView.alpha = 0
        self.doneView.alpha = 0
        self.tabBarController?.tabBar.isHidden = true
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        
//        if isTimerRunning == false {
//            prepareTimerSetup()
//        }else{
//            //
//        }
    }
    

    
    func changePath(){
        print(self.episode)
        if episode == 0 {
            self.path = Bundle.main.path(forResource: self.program[0].code!, ofType: "mp4")
        } else {
            //let customEpisode = episode-1
            self.path = Bundle.main.path(forResource: self.program[episode].code!, ofType: "mp4")
        }
        
    }

    
    func playAndPauseVideo(){
        
        if self.resumeTaped == false {
            self.timer.invalidate()
            self.videoPlayer.pause()
            self.resumeTaped = true
            self.pauseMenuView.alpha = 1
            //self.isTimerRunning = false
        }else{
            runTimer()
            self.videoPlayer.play()
            self.resumeTaped = false
            self.pauseMenuView.alpha = 0
            //self.isTimerRunning = true
        }
        
    }
    
    @IBAction func pauseButtonAction(_ sender: Any) {
        
        self.playAndPauseVideo()
        self.pauseMenuView.alpha = 1
        
    }
    
    @IBAction func resumeButtonAction(_ sender: Any) {
        
        self.playAndPauseVideo()
        
    }
    
    
    
    
    @IBAction func playButtonAction(_ sender: Any) {
        //super.viewDidAppear(animated)
        self.nextVideoPlay()
    }
    
    var voiceString = ""
    
    func voice()
    {
        let string = self.voiceString
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }

    
    func prepareTimerSetup(){
        self.changePath()
        self.startVideoPlay()
        self.seconds = self.timeForSetup
        self.timerStatus = "setup"
        self.statusOutlet.text = "Ready..."
        self.secondsOutlet.text = String(self.seconds)
        self.sets = 1
        self.episodeOutlet.text = self.program[episode].code
        self.voiceString = "Ready 4 seconds"
        
        
        self.runTimer()
        self.voice()
    }
    
    func prepareTimerWork(){
        
        //self.seconds = self.timeForWork
        self.timerStatus = "work"
        self.statusOutlet.text = "Work!"
        
        self.voiceString = "Work"
        self.seconds = self.program[episode].seconds!
        self.sets = 1
        self.secondsOutlet.text = String(self.seconds)
        self.statusOutlet.text = String(self.sets) + "/" + String(self.program[episode].sets!)
        self.voice()
        self.runTimer()
    }
    func prepareTimerRest(){
        self.episode += 1
        if (self.episode < self.program.count) {
            self.episodeOutlet.text = self.program[episode].code
            self.changePath()
            self.nextVideoPlay()
            self.seconds = self.timeForRest
            self.sets = 1
            self.timerStatus = "rest"
            self.statusOutlet.text = "Rest"
            self.secondsOutlet.text = String(self.seconds)
            self.voiceString = "Rest 3 seconds"
            self.voice()
            self.runTimer()
        } else {
            self.videoPlayer.pause()
            self.timer.invalidate()
            self.timerStatus = "done"
            self.statusOutlet.text = "DONE"
            self.voiceString = "Workout done, you are spent 1100 calories"
            self.voice()
            self.doneView.alpha = 1
            
        }
        
    }
    
    func prepareTimerRestForSets(){
        self.seconds = self.timeForRestSets
        self.timerStatus = "restSets"
        self.statusOutlet.text = "Rest..."
        self.secondsOutlet.text = String(self.seconds)
        self.voiceString = "Rest 4 seconds"
        self.voice()
        self.runTimer()
    }
    
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        self.isTimerRunning = true
    }
    
    @objc func updateTimer(){
        
        if self.seconds <= 0 {
            
            
            
            self.timer.invalidate()
            self.isTimerRunning = false
            
            if timerStatus == "setup"{
                self.isTimerRunning = true
                self.timerStatus = "work"
                self.prepareTimerWork()
            } else
            if timerStatus == "work"{
                
                if (self.sets >= self.program[episode].sets!) {
                    self.prepareTimerRest()
                    self.isTimerRunning = true
                    self.timerStatus = "rest"
                }else {
                    self.sets += 1
                    self.prepareTimerRestForSets()
                    self.statusOutlet.text = String(self.sets) + "/" + String(self.program[episode].sets!)
                }
            } else
            if timerStatus == "rest"{
                self.isTimerRunning = true
                self.timerStatus = "work"
                self.prepareTimerWork()
            }else if timerStatus == "done" {
                print(" UPDATE TIMER IF status == DONE ")
            } else if timerStatus == "restSets"{
                self.timerStatus = "work"
                self.voiceString = "Next set"
                self.voice()
                self.seconds = self.program[episode].seconds!
                self.secondsOutlet.text = String(self.seconds)
                self.runTimer()
            }
            
            
            
            
        }else{
            self.seconds -= 1
            self.secondsOutlet.text = String(self.seconds)
            
        }
        

        
    }
    

    
    func startVideoPlay(){
//        self.videoPlayer.isMuted = true
//        //        self.videoPlayer.replaceCurrentItem(with: videoPlayer.currentItem)
//        self.videoPlayer.pause()
//        self.videoLayer.removeFromSuperlayer()
//
//        self.path = Bundle.main.path(forResource: "PR4EP1", ofType: "m4v")
        
        
        //guard let videoURL = URL(fileURLWithPath:(Bundle.main.path(forResource: "PR1EP1", ofType: "mov"))!) else {
//            print("NOT FOUND")
//            return
//        }
        
        
//    guard let videoURL = URL(fileURLWithPath: self.path!) else {
//    print("NOT FOUND")
//    return
//    }
        
        if self.path=="" {
            print("no good")
        } else {
            print("GOOD")
            print(self.path)
        }
        
                self.videoPlayer = AVPlayer(url: URL(fileURLWithPath: self.path!))
        self.videoLayer = AVPlayerLayer(player: self.videoPlayer)
        self.videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoLayer.player = self.videoPlayer
        self.videoBackgraundView.layer.insertSublayer(self.videoLayer, at: 0)
        self.videoLayer.frame = self.videoBackgraundView.bounds
        self.videoPlayer.isMuted = true
        self.videoPlayer.play()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.videoPlayer.currentItem, queue: .main) { [weak self] _ in
            self?.videoPlayer.seek(to: CMTime.zero)
            self?.videoPlayer.play()
            }
//        self.videoLayer.removeFromSuperlayer()
//        self.videoPlayer.isMuted = true
//        self.videoLayer.removeFromSuperlayer()
//        self.videoPlayer = AVPlayer(url: URL(fileURLWithPath: self.path!))
//        self.videoLayer = AVPlayerLayer(player: self.videoPlayer)
//
//        self.videoLayer.player = self.videoPlayer
//        self.videoBackgraundView.layer.insertSublayer(self.videoLayer, at: 0)
//        self.videoLayer.frame = self.videoBackgraundView.bounds
//        self.videoPlayer.isMuted = true
//        self.videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        self.videoPlayer.play()
//        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.videoPlayer.currentItem, queue: .main) { [weak self] _ in
//            self?.videoPlayer.seek(to: CMTime.zero)
//            self?.videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//            self?.videoPlayer.play()
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isTimerRunning == false {
            prepareTimerSetup()
        }else{
            //
        }
    }
    
    func nextVideoPlay(){
        self.videoPlayer.isMuted = true
//        self.videoPlayer.replaceCurrentItem(with: videoPlayer.currentItem)
        self.videoPlayer.pause()
        self.videoLayer.removeFromSuperlayer()
        
                //self.path = Bundle.main.path(forResource: "PR1EP2", ofType: "mov")
        self.videoPlayer = AVPlayer(url: URL(fileURLWithPath: self.path!))
        self.videoLayer = AVPlayerLayer(player: self.videoPlayer)
        self.videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoLayer.player = self.videoPlayer
        self.videoBackgraundView.layer.insertSublayer(self.videoLayer, at: 0)
        self.videoLayer.frame = self.videoBackgraundView.bounds
        self.videoPlayer.isMuted = true
        self.videoPlayer.play()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.videoPlayer.currentItem, queue: .main) { [weak self] _ in
            self?.videoPlayer.seek(to: CMTime.zero)
            self?.videoPlayer.play()
        }
        
    }
    
    @IBAction func repeatButtonDoneViewAction(_ sender: Any) {
    
        //repeatWorkout
        self.episode = 0
        self.prepareTimerSetup()
    
    }
    
    
    deinit{
        print("view deinit")
    }
    
    func dismissPlayerView(){
        
        self.dismiss(animated: false, completion: nil)
        
        
//        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarID") as? CustomTabBar else {
//            //tabBarID
//            print("View controller could not be instantiated")
//            return
//        }
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let snapshot:UIView = (appDelegate.window!.snapshotView(afterScreenUpdates: true))!
//        vc.view.addSubview(snapshot)
//
//        appDelegate.window?.rootViewController = vc
//
//
//        UIView.animate(withDuration: 0.3, animations: {() in
//            snapshot.layer.opacity = 0;
//            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
//        }, completion: {
//            (value: Bool) in
//            snapshot.removeFromSuperview();
//        })
        
    }
    
    @IBAction func backButtonDoneViewAction(_ sender: Any) {
        
        self.dismissPlayerView()
        
    }
    
    @IBAction func backButtonPauseViewAction(_ sender: Any) {
    
        self.dismissPlayerView()
    
    }
    
    @IBAction func nextButtonPauseViewAction(_ sender: Any) {
        
        if (self.episode != program.count-1){
            self.episode += 1
            prepareTimerSetup()
            print("NEXT")
        }else{
            print("CANT")
        }
        
    
    }
    
    @IBAction func previousButtonPauseViewAction(_ sender: Any) {
   
        if (self.episode != 0){
            self.episode -= 1
            prepareTimerSetup()
            print("PREVIOUS")
        }else{
            print("CANT")
        }
    
    
    }
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.program.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            let cell : PlayerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PlayerCollectionViewCell
            cell.conteinerView.backgroundColor = UIColor.white
            cell.conteinerView.layer.shadowColor = UIColor.black.cgColor
            cell.conteinerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            cell.conteinerView.layer.shadowOpacity = 0.4
            cell.conteinerView.layer.shadowRadius = 4.0
            cell.conteinerView.layer.cornerRadius = 8
        
            cell.conteinerViewCornerRadius.layer.cornerRadius = 8
            cell.conteinerViewCornerRadius.layer.masksToBounds = true
            cell.image.image = UIImage(named: program[indexPath.row].code!)
            cell.titleLabelOutlet.text = String(program[indexPath.row].title!)
            return cell
        
        
        
        
        
        
    }
    

    //END DONT TOUCH

}
