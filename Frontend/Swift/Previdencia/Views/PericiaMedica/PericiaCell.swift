//
//  PericiaCell.swift
//  Previdencia
//
//  Created by Gustavo Tavares on 02/05/2018.
//  Copyright © 2018 Plazaz. All rights reserved.
//

import UIKit

class PericiaCell: UITableViewCell {
    
    private static let className: String = "PericiaCell"
    public static var reuseId: String {return PericiaCell.className}
    public static var nib: UINib {
        
        let nib = UINib(nibName: className, bundle: Bundle(for: PericiaCell.self))
        return nib
        
    }
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(date: String, status: String) -> Void {
        self.setCornerRadious()
        self.lblDate.text = date
        self.lblStatus.text = status
    }
    
}
