//
//  AlertManager.swift
//  NesineCase
//
//  Created by Can Kurtur on 14.05.2023.
//

import UIKit

final class AlertManager {
    
    static let shared: AlertManager = AlertManager()
    
    private init() { }
    
    func showAlertFromTopViewController(
        message: String,
        title: String,
        firstButtonTitle: String = Localizable.generalOk,
        firstButtonAction: (() -> Void)? = nil) {
            
            let alertViewController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert)
            
            alertViewController.addAction(UIAlertAction(
                title: firstButtonTitle,
                style: .default,
                handler: { _ in
                    if let action = firstButtonAction {
                        action()
                    }
                }))
            
            UIApplication.topMostViewController()?.present(alertViewController, animated: true)
        }
    
    func showAlertFromTopViewController(
        message: String,
        title: String,
        firstButtonTitle: String,
        firstButtonAction: (() -> Void)? = nil,
        secondButtonTitle: String,
        secondButtonAction: (() -> Void)? = nil) {
            
            let alertViewController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert)
            
            alertViewController.addAction(UIAlertAction(
                title: firstButtonTitle,
                style: .default,
                handler: { _ in
                    if let action = firstButtonAction {
                        action()
                    }
                }))
            
            alertViewController.addAction(UIAlertAction(
                title: secondButtonTitle,
                style: .default,
                handler: { _ in
                    if let action = secondButtonAction {
                        action()
                    }
                }))
            
            UIApplication.topMostViewController()?.present(alertViewController, animated: true)
        }
}

