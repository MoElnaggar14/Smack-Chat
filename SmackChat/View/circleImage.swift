//
//  circleImage.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/25/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

@IBDesignable
class circleImage: UIImageView {
    
    override func awakeFromNib() {
        setView()
    }
    
    func setView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setView()
    }
    
}
