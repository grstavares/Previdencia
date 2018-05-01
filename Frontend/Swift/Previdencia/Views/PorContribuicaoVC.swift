//
//  AposentadoriaPorContribuicao.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class PorContribuicaoVC: UIViewController {
    
    static let sbId = "PorContribuicaoVC"
    public static func instantiate() -> PorContribuicaoVC? {
        
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: sbId) as? PorContribuicaoVC {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
