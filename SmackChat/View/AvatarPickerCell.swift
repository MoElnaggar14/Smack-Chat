//
//  AvatarPickerCell.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/24/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class AvatarPickerCell: UICollectionViewCell {
    enum avatarColor {
        case dark
        case light
    }
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateCellView()
    }
    
    func ConfigureCell(index: Int, avatarType: avatarColor) {
        if avatarType == .dark {
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    func updateCellView () {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        
    }
    
}
