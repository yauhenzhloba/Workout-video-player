//
//  ProgramViewController.swift
//  fitness video
//
//  Created by EUGENE on 2/14/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit
import  Hero
//import ChameleonFramework

class ProgramViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var program1CollectionView: UICollectionView!
    @IBOutlet weak var program2CollectionView: UICollectionView!
    
    @IBOutlet weak var program3CollectionView: UICollectionView!
    
    @IBOutlet weak var mainProgramImage: UIImage!
    
    @IBOutlet weak var mainProgramViewCornerLayer: UIView!
    @IBOutlet weak var mainProgramView: UIView!
    @IBOutlet weak var statusBarView: UIView!
    
     var programDetails: [ProgramDetailsObject] = []
//    var program1: [ProgramDetailsObject] = []
//    var program2: [ProgramDetailsObject] = []
//    var program3: [ProgramDetailsObject] = []
//    var program = ""
//    var episode = ["EP1","EP2","EP3","EP4","EP5","EP6","EP7","EP8","EP9"]
//    var level = 0
//    var nameOfProgram = ""
    
    var program1List: [EpisodeObject] = []
    var program2List: [EpisodeObject] = []
    var program3List: [EpisodeObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        self.setupCornerLayersAndShadow()
        self.program1CollectionView.delegate = self
        self.program1CollectionView.dataSource = self
        self.program2CollectionView.delegate = self
        self.program2CollectionView.dataSource = self
        self.program3CollectionView.delegate = self
        self.program3CollectionView.dataSource = self
        
        self.createProgramsArray()
        self.program1CollectionView.reloadData()
        self.program2CollectionView.reloadData()
        self.program3CollectionView.reloadData()
        
    }
    
    

    func setupCornerLayersAndShadow(){
        

        
        //statusBarView.backgroundColor = UIColor.white
        self.statusBarView.layer.shadowColor = UIColor.black.cgColor
        self.statusBarView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.statusBarView.layer.shadowOpacity = 0.5
        statusBarView.layer.shadowRadius = 4.0
        statusBarView.layer.cornerRadius = 8
        
        //mainProgramView.backgroundColor = UIColor.white
        mainProgramView.layer.shadowColor = UIColor.black.cgColor
        mainProgramView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        mainProgramView.layer.shadowOpacity = 0.4
        mainProgramView.layer.shadowRadius = 8.0
        mainProgramView.layer.cornerRadius = 8.0
        mainProgramViewCornerLayer.layer.cornerRadius = 8.0
        mainProgramViewCornerLayer.layer.masksToBounds = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.program1CollectionView {
            // CV1
            
            
            guard let vc: StartViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "startVCID") as? StartViewController else {

                print("View controller could not be instantiated")
                return
                }
        
                //let episodeForNextVC = indexPath.row
            
            //if (indexPath.row == 0) {
                vc.self.programList = program1List
                vc.self.programDetails = self.programDetails[0]
//            } else if (indexPath.row == 1){
//                vc.self.programList = program2List
//                vc.self.programDetails = self.program2[indexPath.row]
//
//            } else if (indexPath.row == 2) {
//                vc.self.programList = program3List
//                vc.self.programDetails = self.program3[indexPath.row]
//            }

            self.present(vc, animated: true, completion: nil)
            
//            vc.hero.modalAnimationType = .slide(direction: .left)
//            hero.replaceViewController(with: vc)
            
            
            
                //vc.self.episode = episodeForNextVC
                //vc.self.program = program1
            
                //self.present(vc, animated: true, completion: nil)
                //hero.replaceViewController(with: vc)
            
            // ROOT ViEW CONTROLLER SHOW/PRESENT
            
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            //show window
//            let snapshot:UIView = (appDelegate.window!.snapshotView(afterScreenUpdates: true))!
//            vc.view.addSubview(snapshot)
//
//            appDelegate.window?.rootViewController = vc
//
//
//            UIView.animate(withDuration: 0.3, animations: {() in
//                snapshot.layer.opacity = 0;
//                snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
//            }, completion: {
//                (value: Bool) in
//                snapshot.removeFromSuperview();
//            })
            
            
            
        }else{
            if collectionView == self.program2CollectionView{
                guard let vc: StartViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "startVCID") as? StartViewController else {
                    
                    print("View controller could not be instantiated")
                    return
                }

                vc.self.programList = program2List
                vc.self.programDetails = self.programDetails[1]
                
                self.present(vc, animated: true, completion: nil)
//                guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "startVCID") as? StartViewController else {
//
//                    print("View controller could not be instantiated")
//                    return
//                }
//
//                let episodeForNextVC = indexPath.row
//                //print(episodeForNextVC)
//                vc.self.episode = episodeForNextVC
//                //vc.self.program = program2
//                print(episodeForNextVC, " edisodeFromProgramVC")
//                //self.present(vc, animated: true, completion: nil)
//                //hero.replaceViewController(with: vc)
//
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                //show window
//                let snapshot:UIView = (appDelegate.window!.snapshotView(afterScreenUpdates: true))!
//                vc.view.addSubview(snapshot)
//
//                appDelegate.window?.rootViewController = vc
//
//
//                UIView.animate(withDuration: 0.3, animations: {() in
//                    snapshot.layer.opacity = 0;
//                    snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
//                }, completion: {
//                    (value: Bool) in
//                    snapshot.removeFromSuperview();
 //               })
                
            }else{
                guard let vc: StartViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "startVCID") as? StartViewController else {
                    
                    print("View controller could not be instantiated")
                    return
                }
                
                vc.self.programList = program3List
                vc.self.programDetails = self.programDetails[2]
                
                self.present(vc, animated: true, completion: nil)
                //CV3
            }
            
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.program1CollectionView {
            return program1List.count
        }else{
            if collectionView == self.program2CollectionView{
                return program2List.count
                
            }else{
                return program3List.count
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        if collectionView == self.program1CollectionView {
            let cell : Program1CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "program1Cell", for: indexPath) as! Program1CollectionViewCell
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
            cell.image.image = UIImage(named: program1List[indexPath.row].code!)
            return cell
            
        }else{
            
            if collectionView == self.program2CollectionView {
            let cell : Program2CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "program2Cell", for: indexPath) as! Program2CollectionViewCell
            cell.conteinerView.backgroundColor = UIColor.white
            cell.conteinerView.layer.shadowColor = UIColor.black.cgColor
            cell.conteinerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            cell.conteinerView.layer.shadowOpacity = 0.4
            cell.conteinerView.layer.shadowRadius = 4.0
            cell.conteinerView.layer.cornerRadius = 8
            cell.conteinerViewCornerRadius.layer.cornerRadius = 8
            cell.conteinerViewCornerRadius.layer.masksToBounds = true
            
            cell.image.image = UIImage(named: program2List[indexPath.row].code!)
            
                return cell
                
            }else{
                let cell : Program3CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "program3Cell", for: indexPath) as! Program3CollectionViewCell
                cell.conteinerView.backgroundColor = UIColor.white
                cell.conteinerView.layer.shadowColor = UIColor.black.cgColor
                cell.conteinerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
                cell.conteinerView.layer.shadowOpacity = 0.4
                cell.conteinerView.layer.shadowRadius = 4.0
                cell.conteinerView.layer.cornerRadius = 8
                cell.conteinerViewCornerRadius.layer.cornerRadius = 8
                cell.conteinerViewCornerRadius.layer.masksToBounds = true
                
                cell.image.image = UIImage(named: program3List[indexPath.row].code!)
                
                return cell
            }
            
        }
        
       
    }
    
    
    
    
    
    
    
    func createProgramsArray(){
        self.program1List.removeAll()
        self.program2List.removeAll()
        self.program3List.removeAll()
        // PROGRAM 1
        var episodeObject = EpisodeObject()
        
        guard episodeObject != nil else {
            return
        }
        
        episodeObject.code = "PR1EP1"
        episodeObject.title = "Title1"
        episodeObject.sets = 2
        episodeObject.seconds = 6
        episodeObject.kcal = 990
        self.program1List.append(episodeObject)
        episodeObject.code = "PR1EP2"
        episodeObject.title = "Title2"
        episodeObject.sets = 1
        episodeObject.seconds = 15
        episodeObject.kcal = 780
        self.program1List.append(episodeObject)
        episodeObject.code = "PR1EP3"
        episodeObject.title = "Title3"
        episodeObject.sets = 3
        episodeObject.seconds = 5
        episodeObject.kcal = 1100
        self.program1List.append(episodeObject)
        episodeObject.code = "PR1EP4"
        episodeObject.title = "Title4"
        episodeObject.sets = 1
        episodeObject.seconds = 7
        episodeObject.kcal = 350
        self.program1List.append(episodeObject)
        print(self.program1List.count, " PROGRAM 1  COUNT")
        // PROGRAM 2
        episodeObject.code = "PR2EP1"
        episodeObject.title = "Program 2 Title1"
        episodeObject.sets = 3
        episodeObject.seconds = 30
        episodeObject.kcal = 990
        self.program2List.append(episodeObject)
        episodeObject.code = "PR2EP2"
        episodeObject.title = "Program 2 Title2"
        episodeObject.sets = 1
        episodeObject.seconds = 30
        episodeObject.kcal = 780
        self.program2List.append(episodeObject)
        episodeObject.code = "PR2EP3"
        episodeObject.title = "Program 2 Title3"
        episodeObject.sets = 2
        episodeObject.seconds = 15
        episodeObject.kcal = 1100
        self.program2List.append(episodeObject)
        episodeObject.code = "PR2EP4"
        episodeObject.title = "Program 2 Title4"
        episodeObject.sets = 2
        episodeObject.seconds = 15
        episodeObject.kcal = 1100
        self.program2List.append(episodeObject)
        episodeObject.code = "PR2EP5"
        episodeObject.title = "Program 2 Title5"
        episodeObject.sets = 2
        episodeObject.seconds = 15
        episodeObject.kcal = 1100
        self.program2List.append(episodeObject)
        print(self.program2List.count, " PROGRAM 2  COUNT")
        // PROGRAM 3
        episodeObject.code = "PR3EP1"
        episodeObject.title = "Program 3 Title1"
        episodeObject.sets = 3
        episodeObject.seconds = 30
        episodeObject.kcal = 990
        self.program3List.append(episodeObject)
        episodeObject.code = "PR3EP2"
        episodeObject.title = "Program 3 Title2"
        episodeObject.sets = 1
        episodeObject.seconds = 30
        episodeObject.kcal = 780
        self.program3List.append(episodeObject)
        episodeObject.code = "PR3EP3"
        episodeObject.title = "Program 3 Title3"
        episodeObject.sets = 2
        episodeObject.seconds = 15
        episodeObject.kcal = 1100
        self.program3List.append(episodeObject)
        episodeObject.code = "PR3EP4"
        episodeObject.title = "Program 3 Title4"
        episodeObject.sets = 2
        episodeObject.seconds = 15
        episodeObject.kcal = 1100
        self.program3List.append(episodeObject)
        episodeObject.code = "PR3EP5"
        episodeObject.title = "Program 3 Title5"
        episodeObject.sets = 2
        episodeObject.seconds = 15
        episodeObject.kcal = 1100
        self.program3List.append(episodeObject)
        print(self.program3List.count, " PROGRAM 3  COUNT")

        
        self.programDetails.removeAll()
//        self.program2.removeAll()
//        self.program3.removeAll()
        
        var programDetailsList = ProgramDetailsObject()
        
        guard programDetailsList != nil else {
            return
        }
        
        programDetailsList.title = "TITLE PROGRAM 1"
        programDetailsList.code = "PR1"
        programDetailsList.type = "BASE"
        programDetailsList.kcal = 111
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        
        programDetailsList.title = "TITLE PROGRAM 2"
        programDetailsList.code = "PR2"
        programDetailsList.type = "BASE"
        programDetailsList.kcal = 222
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        programDetailsList.title = "TITLE PROGRAM 3"
        programDetailsList.code = "PR3"
        programDetailsList.type = "PRO"
        programDetailsList.kcal = 333
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        print(self.programDetails.count, " PR 1 LIST COUNT")
        
        
//        programDetailsList.title = "PR1EP2"
//        programDetailsList.code = "PR3"
//        programDetailsList.type = "BASE"
//        programDetailsList.kcal = 111
//        programDetailsList.time = 80
//        self.program2.append(programDetailsList)
//        programDetailsList.title = "PR1EP2"
//        programDetailsList.code = "PR4"
//        programDetailsList.type = "BASE"
//        programDetailsList.kcal = 222
//        programDetailsList.time = 80
//        self.program2.append(programDetailsList)
//        programDetailsList.title = "PR1EP2"
//        programDetailsList.code = "PR5"
//        programDetailsList.type = "PRO"
//        programDetailsList.kcal = 333
//        programDetailsList.time = 80
//        self.program2.append(programDetailsList)
//        print(self.program2.count, " PR 2 LIST COUNT")
//        programDetailsList.title = "PR1EP3"
//        programDetailsList.code = "PR5"
//        programDetailsList.type = "BASE"
//        programDetailsList.kcal = 111
//        programDetailsList.time = 80
//        self.program3.append( programDetailsList)
//
//        programDetailsList.title = "PR1EP3"
//        programDetailsList.code = "PR6"
//        programDetailsList.type = "BASE"
//        programDetailsList.kcal = 222
//        programDetailsList.time = 80
//        self.program3.append(programDetailsList)
//        programDetailsList.title = "PR1EP3"
//        programDetailsList.code = "PR1"
//        programDetailsList.type = "PRO"
//        programDetailsList.kcal = 333
//        programDetailsList.time = 80
//        self.program3.append(programDetailsList)
//        print(self.program3.count, " PR 3 LIST COUNT")
        
//        print(self.program1[0].code, " TITLE 0")
//        print(self.program1[1].code, " TITLE 1")
//        print(self.program1[2].code, " TITLE 2")
//      print(self.program2[0].code, " TITLE 0")
//        print(self.program2[1].code, " TITLE 1")
//        print(self.program2[2].code, " TITLE 2")
//        print(self.program3[0].code, " TITLE 0")
//        print(self.program3[1].code, " TITLE 1")
//        print(self.program3[2].code, " TITLE 2")
//        
//        print(self.program1List[0].title, " title")
//        print(self.program1List[1].title, " title")
//        print(self.program1List[2].title, " title")
//        print(self.program1List[3].title, " title")
//        print(self.program1List[4].title, " title")
//       // print(self.program1List[5].title, " title")
//        print(self.program3[3].title, " TITLE 2")
        
        
        
    }
    
    // END

}
