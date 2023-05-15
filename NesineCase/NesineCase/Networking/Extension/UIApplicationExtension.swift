//
//  UIApplicationExtension.swift
//  NesineCase
//
//  Created by Can Kurtur on 14.05.2023.
//

import UIKit

extension UIApplication {

    class func topMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}
