//
//  CornerRaduis.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/23/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit


@IBDesignable
class CornerRaduis: UIButton {
    
    @IBInspectable var cornerRaduis: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRaduis
        }
    }
    
    override func awakeFromNib() {
        self.ViewSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.ViewSetup()
    }
    
    func ViewSetup() {
        self.layer.cornerRadius = cornerRaduis
    }
}
