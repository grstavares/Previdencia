//
//  NavigatorVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 28/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class NavigatorVC: UINavigationController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationBar.barStyle = .blackTranslucent
        self.navigationBar.backgroundColor = AppColorPallete.shared.backgroundColor
        self.navigationItem.largeTitleDisplayMode = .automatic

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
