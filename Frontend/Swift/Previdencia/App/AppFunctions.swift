//
//  AppFunctions.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 30/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit
extension AppCoordinator {
    
    enum Function {
        
        case resultados, aposentadoriaPorIdade, aposentadoriaPorContribuicao, extrato, consignados, periciaMedica, procedimentos, documentacao, informacoes
        
        static var allCases: [Function] {return [resultados, aposentadoriaPorIdade, aposentadoriaPorContribuicao, extrato, consignados, periciaMedica, procedimentos, documentacao, informacoes]}
        
        var label: String {
            
            switch self {
            case .resultados: return "Resultados do Fundo"
            case .aposentadoriaPorIdade: return "Aposentaria por Idade"
            case .aposentadoriaPorContribuicao: return "Aposentadoria por Tempo de Contribuição"
            case .extrato: return "Extrato de Contribuições"
            case .consignados: return "Empréstimos Consignados"
            case .periciaMedica: return "Perícia Médica"
            case .procedimentos: return "Solicitações"
            case .documentacao: return "Documentos Legais"
            case .informacoes: return "Informações"
            }
            
        }
        
        
        var image: UIImage? {
            
            switch self {
            case .resultados: return UIImage(named: self.imageName)
            case .aposentadoriaPorIdade: return UIImage(named: self.imageName)
            case .aposentadoriaPorContribuicao: return UIImage(named: self.imageName)
            case .extrato: return UIImage(named: self.imageName)
            case .consignados: return UIImage(named: self.imageName)
            case .periciaMedica: return UIImage(named: self.imageName)
            case .procedimentos: return UIImage(named: self.imageName)
            case .documentacao: return UIImage(named: self.imageName)
            case .informacoes: return UIImage(named: self.imageName)
                
            }
            
        }
        
        private var imageName: String {
            
            switch self {
            case .resultados: return "resultados"
            case .aposentadoriaPorIdade: return "porIdade"
            case .aposentadoriaPorContribuicao: return "porContribuicao"
            case .extrato: return "extrato"
            case .consignados: return "consignado"
            case .periciaMedica: return "pericia"
            case .procedimentos: return "agendamentos"
            case .documentacao: return "pericia"
            case .informacoes: return "agendamentos"
            }
            
        }
        

        func perform(from sender: UIViewController) -> Void {

            switch self {
            case .resultados: return
            case .aposentadoriaPorIdade:

                let idade = AppCoordinator.shared.getLoggedUser()!.birthDate
                guard let vc = PorIdadeVC.instantiate(birthDate: idade, monthsNeeded: 65 * 12) else {return}
                
                if let navigator = sender.navigationController {
                    navigator.pushViewController(vc, animated: true)
                } else {sender.present(vc, animated: true, completion: nil)}
                
            case .aposentadoriaPorContribuicao:
                
                guard let vc = PorContribuicaoVC.instantiate() else {return}
                
                if let navigator = sender.navigationController {navigator.pushViewController(vc, animated: true)
                } else {sender.present(vc, animated: true, completion: nil)}
                
            case .extrato: return
            case .consignados: return
            case .periciaMedica:
                
                guard let vc = PericiaVC.instantiate() else {return}
                
                if let navigator = sender.navigationController {navigator.pushViewController(vc, animated: true)
                } else {sender.present(vc, animated: true, completion: nil)}
                
            case .procedimentos: return
            case .documentacao: return
            case .informacoes: return
            }
            
        }
        
    }
}
