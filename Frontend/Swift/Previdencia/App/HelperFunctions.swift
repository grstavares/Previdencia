//
//  HelperFunctions.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 03/05/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import Foundation
extension AppCoordinator {
    
    public func formatCurrency(_ number: Double) -> String? {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: number as NSNumber)
        
    }
    
}
