//
//  MusicViewController.swift
//  fitness video
//
//  Created by EUGENE on 2/16/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit
import CoreData


class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var conteinerView: UIView!
    
    @IBOutlet weak var conteinerViewCornerLayers: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var musicAppleList :[MusicObject] = []
    var musicSpotifyList :[MusicObject] = []
    var musicType = [Music]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setupCornerLayers()
        self.checkMusicCoreData()
        self.loadAllLinks()
        self.tableView.reloadData()
    }
    
    func checkMusicCoreData(){
        let fetchRequest: NSFetchRequest<Music> = Music.fetchRequest()

        do {
            let mainTitle2 = try PersistenceService.context.fetch(fetchRequest)
            self.musicType = mainTitle2
            //self.animateTable()
        } catch {}
        print(self.musicType.count, " count MusicType")
        print(self.musicType[0].type, " type row")
        
        if self.musicType[0].type == "A" {
            self.segmentSelector.selectedSegmentIndex = 0
        } else {
            self.segmentSelector.selectedSegmentIndex = 1
        }
        
        self.tableView.reloadData()
        
    }
    
    func addMusicType(){
        
        
        switch segmentSelector.selectedSegmentIndex
        {
        case 0:
            if self.musicType.count == 0 {
                let main = Music(context: PersistenceService.context)
                main.type = "A"
                PersistenceService.saveContext()
            } else {
                let contex = PersistenceService.context
                contex.delete(self.musicType[0])
                do {
                    try contex.save()
                } catch {
                    
                }
                
                let main = Music(context: PersistenceService.context)
                main.type = "A"
                PersistenceService.saveContext()
                
            }
    
        case 1:
            if self.musicType.count == 0 {
                let main = Music(context: PersistenceService.context)
                main.type = "S"
                PersistenceService.saveContext()
            } else {
                let contex = PersistenceService.context
                contex.delete(self.musicType[0])
                do {
                    try contex.save()
                } catch {
                    
                }
                
                let main = Music(context: PersistenceService.context)
                main.type = "S"
                PersistenceService.saveContext()
                
            }
            
            
//            let main = Music(context: PersistenceService.context)
//            main.type = "S"
//            PersistenceService.saveContext()
        default:
            break
        }
        
    }
    
    func setupCornerLayers(){
        
        self.conteinerView.layer.shadowColor = UIColor.black.cgColor
        self.conteinerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.conteinerView.layer.shadowOpacity = 0.4
        self.conteinerView.layer.shadowRadius = 4.0
        self.conteinerView.layer.cornerRadius = 8
        self.conteinerViewCornerLayers.layer.cornerRadius = 8
        self.conteinerViewCornerLayers.layer.masksToBounds = true
        
    }
    
    @IBOutlet weak var segmentSelector: UISegmentedControl!
    
    @IBAction func segmentSelectorAction(_ sender: Any) {
        self.addMusicType()
        self.checkMusicCoreData()
    }
    
    
    @IBAction func openSpotifyLink(_ sender: Any) {
        
//        UIApplication.shared.open(URL(string: "spotify:search:pink+floyd")!, options: [:], completionHandler: nil)
        let url = URL(string: "https://open.spotify.com/user/spotify/playlist/37i9dQZF1DX70RN3TfWWJh?si=saLukVAQSjeFWttDpMF60g")!
        UIApplication.shared.open(url, options: [:])
        //[[UIApplication sharedApplication] openURL:url];
        
    }
    
    
    @IBAction func openAppleMusic(_ sender: Any) {
        
        let url = URL(string: "https://itunes.apple.com/us/playlist/pure-workout/pl.ad0ee1557e3e4feba314fd70f7982766")!
        UIApplication.shared.open(url, options: [:])
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentSelector.selectedSegmentIndex == 0 {
            return self.musicAppleList.count
        } else if segmentSelector.selectedSegmentIndex == 1{
            return self.musicSpotifyList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MusicTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MusicTableViewCell
        
        
        if segmentSelector.selectedSegmentIndex == 0 {
            cell.title.text = self.musicAppleList[indexPath.row].title
            cell.musicImage.image = UIImage.init(named: self.musicAppleList[indexPath.row].image!)
        } else if segmentSelector.selectedSegmentIndex == 1{
            cell.title.text = self.musicSpotifyList[indexPath.row].title
            cell.musicImage.image = UIImage.init(named: self.musicSpotifyList[indexPath.row].image!)
        }
        
        
        
        
        cell.musicImage.layer.cornerRadius = 34
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func loadAllLinks(){
        
        self.musicAppleList.removeAll()
        var musicObject = MusicObject()
        musicObject.title = "Title1"
        musicObject.image = "PR1EP1"
        musicObject.type = "Hip-Hop"
        musicObject.app = "A"
        self.musicAppleList.append(musicObject)
        musicObject.title = "Title2"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "A"
        self.musicAppleList.append(musicObject)
        musicObject.title = "Title3"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "A"
        self.musicAppleList.append(musicObject)
        musicObject.title = "Title4"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "A"
        self.musicAppleList.append(musicObject)
        musicObject.title = "Title5"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "A"
        self.musicAppleList.append(musicObject)
        
        
        musicObject.title = "Spotify Title1"
        musicObject.image = "PR1EP1"
        musicObject.type = "Hip-Hop"
        musicObject.app = "S"
        self.musicSpotifyList.append(musicObject)
        musicObject.title = "Spotify Title2"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "S"
        self.musicSpotifyList.append(musicObject)
        musicObject.title = "Spotify Title3"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "S"
        self.musicSpotifyList.append(musicObject)
        musicObject.title = "Spotify Title4"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "S"
        self.musicSpotifyList.append(musicObject)
        musicObject.title = "Spotify Title5"
        musicObject.image = "PR1EP2"
        musicObject.type = "Rock"
        musicObject.app = "S"
        self.musicSpotifyList.append(musicObject)
        print(self.musicAppleList.count, " Apple List Count")
        print(self.musicSpotifyList.count, " Spotify List Count")
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
