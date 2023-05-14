//
//  ViewInterface.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

public protocol ViewInterface: AnyObject {
    func showAlertWithAPIClientError(error: APIClientError)
    func showAlertWithImageDownloadError(error: ImageDownloadError)
}

extension ViewInterface {
    func showAlertWithAPIClientError(error: APIClientError) {
        AlertManager.shared.showAlertFromTopViewController(
            message: error.message,
            title: Localizable.generalErrorTitle,
            firstButtonTitle: Localizable.generalOk,
            firstButtonAction: nil)
    }
    func showAlertWithImageDownloadError(error: ImageDownloadError) {
        AlertManager.shared.showAlertFromTopViewController(
            message: error.message,
            title: Localizable.generalErrorTitle,
            firstButtonTitle: Localizable.generalOk,
            firstButtonAction: nil)
    }
}
