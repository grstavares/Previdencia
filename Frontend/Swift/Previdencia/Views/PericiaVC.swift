//
//  PericiaVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class PericiaVC: UIViewController {
    
    static let sbId = "PericiaVC"
    public static func instantiate() -> PericiaVC? {
        
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: sbId) as? PericiaVC {
            return vc
        } else {return nil}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
