//
//  PorIdade.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit
import Charts

class PorIdadeVC: UIViewController {

    static let sbId = "PorIdadeVC"
    public static func instantiate(birthDate: Date, monthsNeeded: Int ) -> PorIdadeVC? {
        
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: sbId) as? PorIdadeVC {
            vc.birthDate = birthDate
            vc.totalMonths = monthsNeeded
            return vc
        } else {return nil}
        
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var chartView: PieChartView!
    @IBOutlet weak var lowValueLabel: CounterLabel!
    @IBOutlet weak var highValueLabel: CounterLabel!

    private let animationTime: TimeInterval = 2.0
    private var birthDate: Date = Date()
    private var totalMonths: Int = 0

    var age:Int { return self.calculateAge(from: self.birthDate)}
    var limit:Int {return self.calculateAge(from: self.future) * -1}
    
    var future: Date {
        
        var components = DateComponents()
        components.month = self.totalMonths
        let futureDate = Calendar.current.date(byAdding: components, to: self.birthDate)
        return futureDate!
        
    }
    
    override func viewDidLoad() {
        
//        debugPrint(self.birthDate.description)
//        debugPrint(self.future.description)
//        debugPrint(self.age)
//        debugPrint(self.limit)
        
        super.viewDidLoad()
        self.configViews()
        
        self.mainLabel.text = "Aposentadoria com base nas determinações da lei..."
        self.detailLabel.text = ""
        self.lowValueLabel.text = "0"
        self.highValueLabel.text = "0"
        self.chartView.data = self.getChartData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

        self.lowValueLabel.count(from: 0, to: Float(self.age), withDuration: animationTime, animationType: .easeOut, countingType: .int)
        self.highValueLabel.count(from: 0, to: Float(self.limit + self.age), withDuration: animationTime, animationType: .easeOut, countingType: .int)
        self.chartView.spin(duration: animationTime, fromAngle: 200, toAngle: 180, easingOption: .easeInBounce)
        let _ = Timer(fire: Date(), interval: animationTime, repeats: false) { (timer) in

            self.detailLabel.text = "Faltam \(self.limit) anos e \("0") meses para sua aposentadoria!"
            timer.invalidate()

        }
        
    }
    
    func configViews() -> Void {

        self.chartView.legend.enabled = false
        self.chartView.chartDescription?.text = ""
        self.chartView.maxAngle = 180
        self.chartView.drawEntryLabelsEnabled = false
        self.chartView.drawCenterTextEnabled = false

        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = UIColor.white
        self.mainLabel.textColor = AppColorPallete.shared.textLayer
        self.detailLabel.textColor = AppColorPallete.shared.textLayer
        self.lowValueLabel.textColor = AppColorPallete.shared.textLayer
        self.highValueLabel.textColor = AppColorPallete.shared.textLayer

    }    

    private func getChartData() -> PieChartData {

        let already = PieChartDataEntry(value: Double(self.age), label: "Idade")
        let future = PieChartDataEntry(value: Double(self.limit), label: "Restantes")
        let dataSet = PieChartDataSet(values: [already, future], label: "Tempo de Aposentadoria")
        dataSet.colors = [AppColorPallete.shared.firstLayer, AppColorPallete.shared.backgroundColor]
        return PieChartData(dataSet: dataSet)
        
    }

    private func calculateAge(from informed: Date) -> Int {
        
        let components = Calendar.current.dateComponents([.year], from: informed, to: Date())
        return components.year ?? 0

    }
    
}
