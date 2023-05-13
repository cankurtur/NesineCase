//
//  PreviewPresenter.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

// MARK: - PreviewPresenterInterface

protocol PreviewPresenterInterface: PresenterInterface { }

// MARK: - PreviewPresenter

final class PreviewPresenter {
    
    private let router: PreviewRouterInterface
    private let interactor: PreviewInteractorInterface
    private weak var view: PreviewViewInterface?
    private let imageData: Data
    
    init(router: PreviewRouterInterface,
         interactor: PreviewInteractorInterface,
         view: PreviewViewInterface?,
         imageData: Data)
    {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.imageData = imageData
    }
}

// MARK: - PreviewPresenterInterface

extension PreviewPresenter: PreviewPresenterInterface {
    func viewDidLoad() {
        view?.prepareUI(with: imageData)
    }
}

// MARK: - PreviewInteractorOutput

extension PreviewPresenter: PreviewInteractorOutput {
    
}
