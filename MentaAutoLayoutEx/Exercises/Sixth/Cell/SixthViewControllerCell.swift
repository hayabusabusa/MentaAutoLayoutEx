//
//  SixthViewControllerCell.swift
//  MentaAutoLayoutEx
//
//  Created by 山田隼也 on 2020/08/19.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

class SixthViewControllerCell: UITableViewCell {

    // MARK: IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Properties
    
    static let reuseIdentifier = "SixthViewControllerCell"
    static let rowHeight: CGFloat = 64
    static var nib: UINib {
        return UINib(nibName: "SixthViewControllerCell", bundle: nil)
    }
    
    // MARK: Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Configure
    
    func configureCell(name: String?, descriptionText: String?) {
        nameLabel.text = name
        descriptionLabel.text = descriptionText
    }
}
