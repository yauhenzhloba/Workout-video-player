//
//  StartViewController.swift
//  fitness video
//
//  Created by EUGENE on 2/21/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit
import Hero

class StartViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var programDetails : ProgramDetailsObject?
    var programList: [EpisodeObject] = []
    
    
    
    @IBOutlet weak var titleLabelOutlet: UILabel!
    
    @IBOutlet weak var kcalLabelOutlet: UILabel!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    @IBOutlet weak var startButtonOutlet: UIView!
    
    @IBOutlet weak var conteinerView: UIView!
    
    @IBOutlet weak var clearViewForShadow: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        print(programList.count)
//        print(programList[0].code)
//        print(programList[1].code)
//        print(programList[2].code)
//        print(programList[3].code)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        super.viewDidLoad()
        self.setupCornerLayers()
        self.setupDetails()
        self.collectionView.reloadData()
        
        
    }
    
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    deinit {
        print("START DEINIT")
    }
    
    func setupDetails(){
        
        
        
        let kcalInt = self.programDetails?.kcal
        var kcalString = String(kcalInt!)
        guard kcalString != nil else {
            return
        }
        self.kcalLabelOutlet.text = kcalString + " kcal"
        //self.kcalLabelOutlet.text += " kcal"
        self.titleLabelOutlet.text = programDetails!.title
        
        
    }
    
    func setupCornerLayers(){
        
        self.backButtonOutlet.layer.cornerRadius = 22
        self.startButtonOutlet.layer.cornerRadius = 8
        self.startButtonOutlet.layer.masksToBounds = true
        self.conteinerView.layer.cornerRadius = 22
        
        self.clearViewForShadow.layer.shadowColor = UIColor.black.cgColor
        self.clearViewForShadow.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.clearViewForShadow.layer.shadowOpacity = 1
        self.clearViewForShadow.layer.shadowRadius = 3.0
        //self.clearViewForShadow.layer.cornerRadius = 8
        //self.clearViewForShadow.layer.masksToBounds = true
    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        
        guard let vc: VideoPlayerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "videoPlayerID") as? VideoPlayerViewController else {
            
            print("View controller could not be instantiated")
            return
        }
        
        //let episodeForNextVC = 0
        vc.self.episode = 0
        vc.self.program = programList
        
//        if (indexPath.row == 0) {
//            vc.self.programList = program1List
//            vc.self.programDetails = self.program1[indexPath.row]
//        } else if (indexPath.row == 1){
//            vc.self.programList = program2List
//            vc.self.programDetails = self.program2[indexPath.row]
//
//        } else if (indexPath.row == 2) {
//            vc.self.programList = program3List
//            vc.self.programDetails = self.program3[indexPath.row]
//        }
        
        self.present(vc, animated: false, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //select episode
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.programList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : StartCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! StartCollectionViewCell
        cell.conteinerView.backgroundColor = UIColor.white
        cell.conteinerView.layer.shadowColor = UIColor.black.cgColor
        cell.conteinerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        cell.conteinerView.layer.shadowOpacity = 0.4
        cell.conteinerView.layer.shadowRadius = 4.0
        cell.conteinerView.layer.cornerRadius = 8
        
        cell.conteinerViewCornerRadius.layer.cornerRadius = 8
        cell.conteinerViewCornerRadius.layer.masksToBounds = true
        //let program = "PR1"
        //let totalEpisodes = 4
        //let imageName = program+String(self.episode[indexPath.row])
        cell.image.image = UIImage(named: self.programList[indexPath.row].code!)
        
        cell.title.text = self.programList[indexPath.row].title!
        
        
        
        return cell
        
    }
    
    
    
    
    
    // END

}
