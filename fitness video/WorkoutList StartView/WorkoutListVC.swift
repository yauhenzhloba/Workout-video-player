//
//  WorkoutListVC.swift
//  fitness video
//
//  Created by EUGENE on 5/11/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit

class WorkoutListVC: UIViewController {

    @IBOutlet weak var tabBarBackground: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    var programDetails: [ProgramDetailsObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createProgramsArray()
        // Do any additional setup after loading the view.
        settings()
    }
    
    
    func settings(){
        
        self.tabBarBackground.layer.cornerRadius = 4
        self.tabBarBackground.layer.shadowColor = UIColor.black.cgColor
        self.tabBarBackground.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.tabBarBackground.layer.shadowOpacity = 0.6
        self.tabBarBackground.layer.shadowRadius = 4.0
        
    }
    
    
    
    
    
    
    
    // CREATE ARRAYS
    
    func createProgramsArray(){
        
        self.programDetails.removeAll()
        
        var programDetailsList = ProgramDetailsObject()
        
        guard programDetailsList != nil else {
            return
        }
        
        programDetailsList.title = "Abs - Base workout"
        programDetailsList.code = "PR1"
        programDetailsList.type = "BASE"
        programDetailsList.kcal = 111
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        
        programDetailsList.title = "Arms - quick base"
        programDetailsList.code = "PR2"
        programDetailsList.type = "BASE"
        programDetailsList.kcal = 222
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        programDetailsList.title = "Energy"
        programDetailsList.code = "PR3"
        programDetailsList.type = "PRO"
        programDetailsList.kcal = 333
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        programDetailsList.title = "Stratch"
        programDetailsList.code = "PR4"
        programDetailsList.type = "PRO"
        programDetailsList.kcal = 333
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        programDetailsList.title = "Bonus workout"
        programDetailsList.code = "PR5"
        programDetailsList.type = "PRO"
        programDetailsList.kcal = 333
        programDetailsList.time = 80
        self.programDetails.append(programDetailsList)
        print(self.programDetails.count, " PR 1 LIST COUNT")
        
        
       
        
        
        
    }
    
    // FINISH ARRAYS
    
    
    // END
}

    extension WorkoutListVC: UITableViewDataSource, UITableViewDelegate{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdForWorklist", for: indexPath) as! WorkoutListTableViewCell
            
            cell.mainView.backgroundColor = UIColor.white
            cell.mainView.layer.shadowColor = UIColor.black.cgColor
            cell.mainView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            cell.mainView.layer.shadowOpacity = 0.4
            cell.mainView.layer.shadowRadius = 4.0
            cell.mainView.layer.cornerRadius = 8
            
            cell.viewCornerLayers.layer.cornerRadius = 8
            cell.viewCornerLayers.layer.masksToBounds = true

            cell.viewImage.image = UIImage(named: programDetails[indexPath.row].code!)
            cell.mainLabel.text = programDetails[indexPath.row].title!
//            cell.totalLabelOutlet.text = NSLocalizedString("total_text", comment: "")
//            cell.showAllOutlet.text = NSLocalizedString("show_all_text", comment: "")
//            cell.title.text = mainTitle[indexPath.row].nameTitle
//            cell.total.text = "999"
//            cell.whiteViewForTableView.layer.shadowColor = UIColor.black.cgColor
//            cell.whiteViewForTableView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//            cell.whiteViewForTableView.layer.shadowOpacity = 0.3
//            cell.whiteViewForTableView.layer.shadowRadius = 4.0
//            cell.whiteViewForTableView.layer.cornerRadius = 6
            
            
            
            return cell
        }
        
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 208
        }
        
        
        
        
        
    }


