//
//  ProfileViewController.swift
//  fitness video
//
//  Created by EUGENE on 4/15/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageViewOutlet: UIImageView!
    
    @IBOutlet weak var weightButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCornerLayers()
    }
    

    func setupCornerLayers(){
        
       weightButtonOutlet.layer.borderColor = UIColor.black.cgColor
       weightButtonOutlet.layer.borderWidth = 1
        profileImageViewOutlet.layer.cornerRadius = 60.0
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // END DONT TOUCH
}
