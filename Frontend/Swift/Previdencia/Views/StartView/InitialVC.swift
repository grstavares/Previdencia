//
//  InitialVC.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 28/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class InitialVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var iconProfile: UIBarButtonItem!
    
    let kCellHeight: CGFloat = 140

    private var appFunction: [AppCoordinator.Function] = AppCoordinator.shared.getAppFunctions()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.titleView?.backgroundColor = AppColorPallete.shared.backgroundColor
        self.navigationItem.title = AppDelegate.appDisplayName

        tableView.estimatedRowHeight = kCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(AppFunctionCell.nib, forCellReuseIdentifier: AppFunctionCell.reuseId)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    @IBAction func iconProfileClicked(_ sender: Any) {AppCoordinator.shared.performAction(action: .showProfile, sender: self)}
    
}

extension InitialVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appFunction.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: AppFunctionCell.reuseId, for: indexPath) as? AppFunctionCell {

            cell.config(self.appFunction[indexPath.row])
            return cell
            
        } else {return UITableViewCell()}
        
    }

}

extension InitialVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {return kCellHeight - 20}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let function = self.appFunction[indexPath.row]
        function.perform(from: self)
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
    
}

