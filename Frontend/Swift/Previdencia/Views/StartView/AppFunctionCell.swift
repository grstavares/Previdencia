//
//  StartFunctionCell.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 28/04/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class AppFunctionCell: UITableViewCell {
    
    private static let className: String = "AppFunctionCell"
    public static var reuseId: String {return AppFunctionCell.className}
    
    public static var nib: UINib {
        
        let nib = UINib(nibName: AppFunctionCell.className, bundle: Bundle(for: AppFunctionCell.self))
        return nib
        
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var functionImage: UIImageView!
    @IBOutlet weak var functionName: UILabel!

    public var appFunction: AppCoordinator.Function?
    private var detailView: UIView?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()

        self.functionName.textColor = AppColorPallete.shared.textLayer
        self.functionImage.setCornerRadious()
        self.containerView.setCornerRadious()
        self.containerView.makeShadow()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        return
    }
    
    public func config(_ function: AppCoordinator.Function) {
        
        self.appFunction = function
        self.functionImage.image = function.image
        self.functionName.text = function.label

    }

}
