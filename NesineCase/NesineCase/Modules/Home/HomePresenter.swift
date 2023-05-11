//
//  HomePresenter.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import Foundation

// MARK: - HomePresenterInterface

protocol HomePresenterInterface: PresenterInterface {
    
}

// MARK: - HomePresenter

final class HomePresenter {
    
    private let router: HomeRouterInterface
    private let interactor: HomeInteractorInterface
    private weak var view: HomeViewInterface?
    
    init(router: HomeRouterInterface, interactor: HomeInteractorInterface, view: HomeViewInterface?) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
}

// MARK: - HomePresenterInterface

extension HomePresenter: HomePresenterInterface {
    func viewDidLoad() {
        view?.prepareUI()
    }
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    
}
