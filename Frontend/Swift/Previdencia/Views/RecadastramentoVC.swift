//
//  RecadastramentoVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class RecadastramentoVC: UIViewController {
    
    static let sbId = "RecadastramentoVC"
    public static func instantiate() -> RecadastramentoVC? {
        
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: sbId) as? RecadastramentoVC {
            return vc
        } else {return nil}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
