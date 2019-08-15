//
//  FoodViewController.swift
//  fitness video
//
//  Created by EUGENE on 2/25/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit
import Charts
import CoreData

class FoodViewController: UIViewController {

    var weightList = [WeightList]()
    var userWeight = [UserWeight]()
    
    
    
    @IBOutlet weak var chart: PieChartView!
    var numberOfDataEntries = [PieChartDataEntry]()
    
    var startDataEntry = PieChartDataEntry(value: 0)
    var currentDataEntry = PieChartDataEntry(value: 0)
    var changeDataEntry = PieChartDataEntry(value: 0)
    var targetDataEntry = PieChartDataEntry(value: 0)
    
    
    @IBOutlet weak var targetWeightTextOutlet: UITextField!
    
    @IBOutlet weak var startWeightTextOutlet: UITextField!
    
    @IBOutlet weak var userHeightTextOutlet: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        self.checkUserWeight()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startDataEntry.value = 33.0
        startDataEntry.label = "START"
        
        currentDataEntry.value = 50.0
        currentDataEntry.label = "CURRENT"

        changeDataEntry.value = 15.0
        changeDataEntry.label = "START"

        targetDataEntry.value = 150.0
        targetDataEntry.label = "START"
        //let pie = PieChartDataEntry()
        //pie.value
        
        numberOfDataEntries = [startDataEntry, currentDataEntry, changeDataEntry, targetDataEntry]
        
        self.updateChartData()
        
    }
    
    func checkUserWeight(){
        
        let fetchRequest: NSFetchRequest<UserWeight> = UserWeight.fetchRequest()
        
        do {
            let mainTitle2 = try PersistenceService.context.fetch(fetchRequest)
            self.userWeight = mainTitle2
            //self.animateTable()
        } catch {}
        print(self.userWeight.count, " count UserWeight")
        //print(self.userWeight[0].startWeight, " type row")

        //print(self.userWeight[0])
        
//        if self.userWeight[0] != nil {
//           // show "SET PROPERTIES, WEIGHT, HEIGHT, TARGET"
//        } else{
//            // shoe all options
//        }
        
        
    }
    
    func updateChartData(){
        
        let chartDataSet = PieChartDataSet(values: numberOfDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor.darkGray, UIColor.brown, UIColor.green, UIColor.blue]
        chartDataSet.colors = colors as! [NSUIColor]
        self.chart.data = chartData

        
    }
    

    @IBAction func firstWeightButtonAction(_ sender: Any) {
       // check textFields != 0
        // put FirstData in CoreDaa UserData
        
//        let userHeightDouble: Double = self.userHeightTextOutlet.text as! Double
//        
//        let main = UserWeight(context: PersistenceService.context)
//        main.height = Double(self.userHeightTextOutlet.text)!
//        main.startWeight = Double(self.startWeightTextOutlet.text)!
//        main.targetWeight = Double(self.targetWeightTextOutlet.text)!
//        PersistenceService.saveContext()
        
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
