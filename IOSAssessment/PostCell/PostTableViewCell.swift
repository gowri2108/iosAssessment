//
//  PostTableViewCell.swift
//  IOSAssessment
//
//  Created by Gowri Karthik on 29/05/24.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOffset = CGSizeZero
        outerView.layer.shadowOpacity = 0.5
        outerView.layer.shadowRadius = 3
        outerView.layer.cornerRadius = 10.0
    }
    
}
