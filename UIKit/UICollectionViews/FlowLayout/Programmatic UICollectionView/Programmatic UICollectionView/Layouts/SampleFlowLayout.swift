//
//  SampleFlowLayout.swift
//  Programmatic UICollectionView
//
//  Created by Jason Dhindsa on 2021-08-04.
//

import UIKit

class SampleFlowLayout: UICollectionViewFlowLayout {    
    override init() {
        super.init()
        
        sectionInset = UIEdgeInsets(top: 50, left: 30, bottom: 50, right: 30)
        itemSize = CGSize(width: 70, height: 70)
        /*
         If the delegate does not implement the collectionView:layout:referenceSizeForHeaderInSection: method, the flow layout object uses the default header sizes set in this property.
         */
        headerReferenceSize = CGSize(width: collectionView?.superview?.bounds.width ?? 0, height: 75)
        /*
         If the delegate does not implement the collectionView:layout:referenceSizeForFooterInSection: method, the flow layout object uses the default footer sizes set for this property.
         */
        footerReferenceSize = CGSize(width: collectionView?.superview?.bounds.width ?? 0, height: 75)
        minimumInteritemSpacing = 30
        minimumLineSpacing = 55
        sectionHeadersPinToVisibleBounds = false
        sectionFootersPinToVisibleBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
