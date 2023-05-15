//
//  HomeRouter.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

// MARK: - RouterInterface

protocol HomeRouterInterface: RouterInterface {
    func navigateToPreview(imageData: Data)
}

// MARK: - HomeRouter

final class HomeRouter {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UINavigationController {
        let interactor = HomeInteractor()
        let view = HomeViewController()
        let navCon = UINavigationController(rootViewController: view)
        navCon.modalPresentationStyle = .fullScreen
        let router = HomeRouter(navigationController: navCon)
        let presenter = HomePresenter(router: router, interactor: interactor, view: view)
        view.presenter = presenter
        interactor.output = presenter
        
        return navCon
    }
    
}

// MARK: - HomeRouterInterface

extension HomeRouter: HomeRouterInterface {
    func navigateToPreview(imageData: Data) {
        let view = PreviewRouter.createModule(navigationController: navigationController, imageData: imageData)
        navigationController?.present(view, animated: true)
    }
}
