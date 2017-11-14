//
//  ViewController.swift
//  CollectionViewSections
//
//  Created by Tiago Pereira on 13/11/2017.
//  Copyright © 2017 Tiago Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var facesCollectionView: UICollectionView!
    
    let staff = [
        (category: "Director", people: [""]),
        (category: "Management", people: ["","",]),
        (category: "Teachers", people: ["","","","",""])
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facesCollectionView.delegate = self
        facesCollectionView.dataSource = self
    }
    
}

extension ViewController : UICollectionViewDataSource {
    // Number of itens
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return staff[section].people.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return staff.count
    }
    
    // Cell for row at index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "faceIdentifier", for: indexPath)
        
        if let faceCell = cell as? FaceCollectionViewCell {
            faceCell.faceImageView.image = UIImage(named: "")
        }
        
        return cell
    }
}

extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    var collectionViewMargin: UIEdgeInsets{
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    var collectionViewSpacing: (betweenRows: CGFloat, betweenSections: CGFloat) {
        return (CGFloat(20), CGFloat(10))
    }
    
    var collectionViewHeaderSize : CGSize {
        let viewWidth = self.view.frame.size.width
        return CGSize(width: viewWidth, height: 50)
    }
    
    var collectionViewFooterSize : CGSize {
        let viewWidth = self.view.frame.size.width
        return CGSize(width: viewWidth, height: 25)
    }
    
    var numberOfItens: CGFloat {
        var value: CGFloat = 2
        switch UIDevice.current.orientation {
        case .landscapeRight:
            fallthrough
        case .landscapeLeft:
            value = 4
        default:
            value = 2
        }
        
        return value
    }
    
//  Size of itens
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = (collectionViewMargin.left + collectionViewMargin.right) + collectionViewSpacing.betweenRows * numberOfItens
        
        let viewWidth = self.facesCollectionView.frame.size.width
        let itemSize = (viewWidth - paddingSpace) / numberOfItens
        
        return CGSize(width: itemSize, height: itemSize)
    }
    
//  Margins to apply to content in the specified section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionViewMargin
    }
    
// Space between seccessive rows or columns of a section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewSpacing.betweenRows
        
    }
    
//  Space between successive itens in the rows or columns of a section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewSpacing.betweenSections
    }
    
//  Size of the header view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return collectionViewHeaderSize
    }
    
//  Size of the footer view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return collectionViewFooterSize
    }
    
}
