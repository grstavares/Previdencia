//
//  AppCoordinator.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 28/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit
class AppCoordinator {
    
    public static let shared = AppCoordinator()
    private init() {
        
        let name = "Carlos Henrique Siqueira Gomes"
        let birth = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current, era: nil, year: 1978, month: 10, day: 31, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        let insc = "123.456-78"
        let user = PlazazPerson(name: name, birthDate: birth.date!, inscricao: insc)
        self._user = user
        
    }

    private var _user: PlazazPerson?
    
    public func getAppFunctions() -> [Function] {return Function.allCases}
    public func getLoggedUser() -> PlazazPerson? {return self._user}
    
    public func performAction(action: Action, sender: UIViewController) -> Void {
        
        switch action {
        case .showProfile: self.showProfileVC(sender: sender)
        case .showDetail: self.showDetail()
        case .openVC( _): return}
        
    }
    
    private func showProfileVC(sender: UIViewController) -> Void {
        
        if let profileVC = ProfileVC.instantiate() {
            profileVC.modalPresentationStyle = .overCurrentContext
            profileVC.modalTransitionStyle = .crossDissolve
            sender.present(profileVC, animated: true, completion: nil)
        }

    }
    
    private func showDetail() -> Void {}
    
    enum Action {case showProfile, showDetail, openVC(UIViewController.Type)}
    
}
