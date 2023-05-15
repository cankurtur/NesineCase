//
//  UICollectionViewExtension.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T else {
            fatalError()
        }
        
        return cell
        
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(type: T.Type, ofKind: String, indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: type.identifier, for: indexPath) as? T else {
            fatalError()
        }
        return view
    }
}
