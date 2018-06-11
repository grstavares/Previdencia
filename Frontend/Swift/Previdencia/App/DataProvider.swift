//
//  DataProvider.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 03/05/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import Foundation
class DataProvider {
    
    public typealias MonthYear = (String, String)
    
    public static let shared = DataProvider()
    private init() {}
    
    public func getResultados(for monthYear: MonthYear) -> [ResultadosMes] {
        
        let resultado = ResultadosMes(anoMes: (monthYear.0, monthYear.1), saldoInicial: 5254033.17, receita: 258406.84, despesasAdm: -4735.60, despesasPrev: -243324.08, consignacao: -25357.99,retencoes: 1539.08, rendimentos: 30616.82, saldoFinal: 5271178.24)
        return [resultado]
    }
    
}
