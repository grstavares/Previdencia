//
//  ProfileVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet var modalView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var nascimentoLabel: UILabel!
    @IBOutlet weak var inscLabel: UILabel!
    
    @IBOutlet weak var nomeText: UITextField!
    @IBOutlet weak var nascimentoText: UITextField!
    @IBOutlet weak var inscText: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    private static let className: String = "ProfileVC"

    public static func instantiate() -> ProfileVC? {
        
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle(for: ProfileVC.self))
        let vc = sb.instantiateViewController(withIdentifier: className) as? ProfileVC
        return vc
        
    }
    
    private var modalCenter: CGPoint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.layoutViews()
        
        let logged = AppCoordinator.shared.getLoggedUser()
        self.nomeText.text = logged?.name
        self.nascimentoText.text = logged?.birthDate.onlyDate
        self.inscText.text = logged?.inscricao
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.modalCenter = self.view.center
        if animated {
            self.modalView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            UIView.animate(withDuration: 0.3) {self.modalView.transform = CGAffineTransform.identity}

        }

    }

    func layoutViews() -> Void {
        
        self.modalView.setCornerRadious()
        
    }
    
    @IBAction func buttonOkClicked(_ sender: Any) {
    
//        self.loginView.center = self.modalCenter
//        UIView.transition(from: self.modalView, to: self.loginView, duration: 0.5, options: .transitionFlipFromRight, completion: nil)
        
    }
    
    @IBAction func buttonCancelClicked(_ sender: Any) {self.dismiss(animated: true, completion: nil)}
    
}
