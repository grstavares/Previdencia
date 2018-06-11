//
//  ResultadosVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 03/05/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit
import Charts

class ResultadosVC: AppVC {
    
    static let sbId = "ResultadosVC"
    static let cellId = "ResultadoCell"

    public static func instantiate() -> ResultadosVC? {
        
        let sb = UIStoryboard(name: "Resultados", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: sbId) as? ResultadosVC {
            return vc
        } else {return nil}
        
    }

    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var tableLines: [(String, Double)] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.applyTheme(AppCoordinator.shared.currentTheme)
        self.configView()

    }
    
    override func applyTheme(_ theme: AppTheme) {
        
        super.applyTheme(theme)
        self.mainLabel.textColor = theme.textColor
        self.monthLabel.textColor = theme.textColor
        self.previousButton.tintColor = theme.textColor
        self.nextButton.tintColor = theme.textColor
        
    }
    
    private func configView() {
        
        if let resultado = AppCoordinator.shared.dataProvider.getResultados(for: ("05", "2018")).first {
            self.tableLines = self.generateCells(resultado)
            self.monthLabel.text = resultado.anoMes.0 + "-" + resultado.anoMes.1
        }
        
        self.tableView.setCornerRadious()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        
    }
    
    private func generateCells(_ resultado: ResultadosMes) -> [(String, Double)] {
        
        var array:[(String, Double)] = []
        array.append(("Saldo Inicial", resultado.saldoInicial))
        array.append(("Receita Previdenciária", resultado.receita))
        array.append(("Despesas Previdenciárias",resultado.despesasPrev))
        array.append(("Despesas Administrativas", resultado.despesasAdm))
        array.append(("Despesas Consignadas", resultado.consignacao))
        array.append(("Retenções", resultado.retencoes))
        array.append(("Rendimentos", resultado.rendimentos))
        array.append(("Saldo Final", resultado.saldoFinal))
        return array
        
    }
    
//    private func conficGraph() {
//
////        chartView.chartDescription?.enabled =  false
////        chartView.pinchZoomEnabled = false
////        chartView.drawBarShadowEnabled = false
////        chartView.rightAxis.enabled = false
//
//
//    }
//
//    private func setGraphData() {
//
//        let groupSpace = 0.08
//        let barSpace = 0.03
//        let barWidth = 0.2
//
//        let months:[Double] = [1, 2, 3]
//
//        let receitas: [Double] = [258406.84, 260456.44, 259071.45]
//        let despesasPrev: [Double] = [243324.08, 247563.77, 244876.55]
//        let despesasAdm: [Double] = [4735.60, 4868.00, 4845.00]
//        let rendimentos: [Double] = [30616.82, 30844.46, 29767.05]
//        let saldos: [Double] = [5271178.24, 5271178.24, 5271178.24]
//
//        let receitasSet = BarChartDataSet(values: receitas.enumerated().map {return BarChartDataEntry(x: months[$0], y: $1)}, label: "Receitas")
//        let despesasPrevSet = BarChartDataSet(values: despesasPrev.enumerated().map {return BarChartDataEntry(x: months[$0], y: $1)}, label: "Despesas Prev")
//        let despesasAdmSet = BarChartDataSet(values: despesasAdm.enumerated().map {return BarChartDataEntry(x: months[$0], y: $1)}, label: "Despesas Adm")
//        let rendimentosSet = BarChartDataSet(values: rendimentos.enumerated().map {return BarChartDataEntry(x: months[$0], y: $1)}, label: "Rendimentos")
////        let saldos: [Double] = [5271178.24, 5271178.24, 5271178.24]
//
//        receitasSet.setColor(UIColor(red: 104/255, green: 241/255, blue: 175/255, alpha: 1))
//        despesasPrevSet.setColor(UIColor(red: 164/255, green: 228/255, blue: 251/255, alpha: 1))
//        despesasAdmSet.setColor(UIColor(red: 242/255, green: 247/255, blue: 158/255, alpha: 1))
//        rendimentosSet.setColor(UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1))
//
//        receitasSet.values.forEach { debugPrint($0.description)}
//        despesasPrevSet.values.forEach { debugPrint($0.description)}
//        despesasAdmSet.values.forEach { debugPrint($0.description)}
//        rendimentosSet.values.forEach { debugPrint($0.description)}
//
//        let data = BarChartData(dataSets: [receitasSet, despesasPrevSet, despesasAdmSet, rendimentosSet])
//        data.setValueFont(.systemFont(ofSize: 10, weight: .light))
//        data.barWidth = barWidth
//        data.groupBars(fromX: months[0], groupSpace: groupSpace, barSpace: barSpace)
//        chartView.data = data
//        chartView.xAxis.axisMinimum = months[0]
//        chartView.xAxis.axisMaximum = months[months.count - 1]
//        chartView.setNeedsDisplay()
//
////        data.setValueFormatter(LargeValueFormatter())
//
//
//    }
    
}

extension ResultadosVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultadosVC.cellId) as? ResultadoCell else {return UITableViewCell()}
        
        let data = self.tableLines[indexPath.row]
        cell.configure(data)
        return cell
        
    }
    
}

extension ResultadosVC: UITableViewDelegate {}

class ResultadoCell: UITableViewCell {
    
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func configure(_ data: (String, Double)) -> Void {
        
        self.lineLabel.text = data.0
        self.valueLabel.text = AppCoordinator.shared.formatCurrency(data.1)
        if data.1 < 0 {self.valueLabel.textColor = UIColor.red} else {self.valueLabel.textColor = UIColor.darkGray}
        
    }
    
}
