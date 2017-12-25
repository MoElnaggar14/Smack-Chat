//
//  AvatarPickerVC.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/24/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionview: UICollectionView!
    
    var avatarColor = AvatarPickerCell.avatarColor.dark
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "avatarPickerCell", for: indexPath) as? AvatarPickerCell {
            cell.ConfigureCell(index: indexPath.item, avatarType: avatarColor)
            return cell
        }
        return AvatarPickerCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numberOfCoulmns : CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numberOfCoulmns = 4
        }
        let spaceBetwwenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numberOfCoulmns - 1) * spaceBetwwenCells) / numberOfCoulmns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarColor == .dark {
            UserDataService.instance.SetAvatarName(avatarName: "dark\(indexPath.item)")
        } else {
        UserDataService.instance.SetAvatarName(avatarName: "light\(indexPath.item)")
        }
            dismiss(animated: true, completion: nil)
    }

    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlPressed(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            avatarColor = .dark
        } else {
            avatarColor = .light
        }
        
        collectionview.reloadData()
    }
}
