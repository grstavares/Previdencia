//
//  PorIdade.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit
import Charts

class PorIdadeVC: AppVC {

    static let sbId = "PorIdadeVC"
    public static func instantiate(birthDate: Date, monthsNeeded: Int ) -> PorIdadeVC? {
        
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: sbId) as? PorIdadeVC {
            vc.birthDate = birthDate
            vc.monthsNeeded = monthsNeeded
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
    private var monthsNeeded: Int = 0

    var age:Int { return self.calculateAge(from: self.birthDate)}
    var limit:Int {return self.calculateAge(from: self.future) * -1}
    
    var future: Date {
        
        var components = DateComponents()
        components.month = self.monthsNeeded
        let futureDate = Calendar.current.date(byAdding: components, to: self.birthDate)
        return futureDate!
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.applyTheme(AppCoordinator.shared.currentTheme)
        self.configViews()
        self.configGraph()
        
        self.mainLabel.text = "Aposentadoria com base nas determinações da lei..."
        self.detailLabel.text = ""
        self.lowValueLabel.text = "0"
        self.highValueLabel.text = "0"
        
        self.setGraphData()
        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

        self.lowValueLabel.count(from: 0, to: Float(self.age), withDuration: animationTime, animationType: .easeOut, countingType: .int)
        self.highValueLabel.count(from: 0, to: Float(self.limit + self.age + 1), withDuration: animationTime, animationType: .easeOut, countingType: .int)

        let _ = Timer(fire: Date(), interval: animationTime, repeats: false) { (timer) in

            self.detailLabel.text = "Faltam \(self.limit) anos e \("0") meses para sua aposentadoria!"
            timer.invalidate()

        }
        
    }
    
    override func applyTheme(_ theme: AppTheme) {
        
        super.applyTheme(theme)
        self.mainLabel.textColor = theme.textColor
        self.detailLabel.textColor = theme.textColor
        self.lowValueLabel.textColor = theme.textColor
        self.highValueLabel.textColor = theme.textColor
        
    }
    
    func configViews() -> Void {

    }
    
    func configGraph() -> Void {
        
        self.chartView.holeColor = .clear
        self.chartView.transparentCircleColor = NSUIColor.white.withAlphaComponent(0.43)
        self.chartView.holeRadiusPercent = 0.58
        self.chartView.rotationEnabled = false
        self.chartView.highlightPerTapEnabled = true
        self.chartView.legend.enabled = false
        
        self.chartView.maxAngle = 180 // Half chart
        self.chartView.rotationAngle = 180 // Rotate to make the half on the upper side
        self.chartView.centerTextOffset = CGPoint(x: 0, y: -20)
        
        
    }

    func setGraphData() -> Void {
        
        self.chartView.data = self.getChartData()
        self.chartView.setNeedsDisplay()
        
    }
    
    private func getChartData() -> PieChartData {

        let already = PieChartDataEntry(value: Double(self.age), label: "Idade")
        let future = PieChartDataEntry(value: Double(self.limit), label: "Restantes")
        let dataSet = PieChartDataSet(values: [already, future], label: "Tempo de Aposentadoria")
        dataSet.valueFormatter = LegendFormatter()
        dataSet.sliceSpace = 3
        dataSet.selectionShift = 5
        dataSet.colors = [AppColorPallete.shared.firstLayer, AppColorPallete.shared.backgroundColor]
        return PieChartData(dataSet: dataSet)
        
    }

    private func calculateAge(from informed: Date) -> Int {
        
        let components = Calendar.current.dateComponents([.year], from: informed, to: Date())
        return components.year ?? 0

    }
    
}

class LegendFormatter: IValueFormatter {
    
    let formatter:NumberFormatter
    
    init() {
        
        formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        
    }
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return formatter.string(from: NSNumber(floatLiteral: value))!
    }
    
    
}
