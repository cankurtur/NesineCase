//
//  NSObjectExtension.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import Foundation

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String(describing: self)
    }
}
