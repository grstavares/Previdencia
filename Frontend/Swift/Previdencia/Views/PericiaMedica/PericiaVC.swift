//
//  PericiaVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class PericiaVC: AppVC {
    
    static let sbId = "PericiaVC"
    public static func instantiate() -> PericiaVC? {
        
        let sb = UIStoryboard(name: "Pericia", bundle: Bundle.main)
        if let vc = sb.instantiateViewController(withIdentifier: sbId) as? PericiaVC {
            return vc
        } else {return nil}
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageTapped: UITapGestureRecognizer!
    @IBOutlet weak var buttonAgendarPericia: UIButton!
    @IBOutlet weak var buttonJuntaMedica: UIButton!
    
    var arrayPericia: [(String, String)] = [("14/06/2014", "Realizada"), ("18/09/2016", "Realizada"), ("05/06/2018", "Agendada")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.applyTheme(AppCoordinator.shared.currentTheme)
        self.configView()

    }

    override func applyTheme(_ theme: AppTheme) {
        
        super.applyTheme(theme)
        self.buttonAgendarPericia.tintColor = theme.textColor
        self.buttonJuntaMedica.tintColor = theme.textColor
        
    }
    
    private func configView() {

        self.tableView.setCornerRadious()
        self.tableView.register(PericiaCell.nib, forCellReuseIdentifier: PericiaCell.reuseId)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()

        self.imageTapped.addTarget(self, action: #selector(self.buttonJuntaMedicaClicked(_:)))
        
    }
    
    @IBAction func buttonAgendarPericiaClicked(_ sender: Any) -> Void {debugPrint("Agendar Clicked")}
    @objc @IBAction func buttonJuntaMedicaClicked(_ sender: Any) -> Void {debugPrint("Junta Medica Clicked")}
    
}

extension PericiaVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {return 1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let num = self.arrayPericia.count
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PericiaCell.reuseId) as? PericiaCell {
            
            let item = self.arrayPericia[indexPath.row]
            cell.configure(date: item.0, status: item.1)
            return cell
        } else {return UITableViewCell()}
        
    }
    
}

extension PericiaVC: UITableViewDelegate {
    
}
