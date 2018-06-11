//
//  AppVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 03/05/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class AppVC: UIViewController, Themed {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func applyTheme(_ theme: AppTheme) {
        
        let image = UIImage(named: "background")!
        let back = UIImageView(image: image)
        back.frame = self.view.frame
        back.contentMode = .scaleAspectFill
        
        let effect = UIBlurEffect.init(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.view.frame

        view.insertSubview(back, at: 0)
        view.insertSubview(effectView, at: 1)

    }
    
}
