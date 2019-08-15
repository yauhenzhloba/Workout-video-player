//
//  ResultsViewController.swift
//  fitness video
//
//  Created by EUGENE on 2/17/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//

import UIKit
import ChartProgressBar

class ResultsViewController: UIViewController, ChartProgressBarDelegate {
    func ChartProgressBar(_ chartProgressBar: ChartProgressBar, didSelectRowAt rowIndex: Int) {
        return
    }
    
    
    
    @IBOutlet weak var chart: ChartProgressBar!
    
    
   // @IBOutlet weak var chart: ChartProgressBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var data: [BarData] = []
        
        data.append(BarData.init(barTitle: "Jan", barValue: 1.4, pinText: "1.4$"))
        data.append(BarData.init(barTitle: "Feb", barValue: 10, pinText: "10$"))
        data.append(BarData.init(barTitle: "Mar", barValue: 3.1, pinText: "3.1$"))
        data.append(BarData.init(barTitle: "Apr", barValue: 4.8, pinText: "4.8$"))
        data.append(BarData.init(barTitle: "May", barValue: 6.6, pinText: "6.6$"))
        data.append(BarData.init(barTitle: "Jun", barValue: 7.4, pinText: "7.4$"))
        data.append(BarData.init(barTitle: "Jul", barValue: 5.5, pinText: "5.5$"))
        
        self.chart.data = data
        chart.barsCanBeClick = true
        chart.maxValue = 10.0
        //chart.barWidth = 15
        chart.barHeight = 200
        //chart.emptyColor = UIColor.init(hexString: "e0e0e0")
        //chart.progressColor = UIColor.init(hexString: "0086FF")
        //chart.progressClickColor = UIColor.init(hexString: "09467D")
        //chart.pinTxtColor = UIColor.white
        //chart.pinBackgroundColor = UIColor.darkGray
        //chart.barRadius = 5
        //chart.barTitleColor = UIColor.init(hexString: "598DBC")
        //chart.barTitleTxtSize = 12
        //chart.barTitleWidth = 30
        //chart.barTitleHeight = 25
        chart.pinTxtSize = 17
        //chart.pinWidth = 30
        //chart.pinHeigh = 30
        chart.build()
//        
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
