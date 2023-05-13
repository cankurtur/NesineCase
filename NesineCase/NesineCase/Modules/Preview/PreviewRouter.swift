//
//  PreviewRouter.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import UIKit

// MARK: - RouterInterface

protocol PreviewRouterInterface: RouterInterface { }

// MARK: - PreviewRouter

final class PreviewRouter {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController? = nil, imageData: Data) -> UIViewController {
        let interactor = PreviewInteractor()
        let view = PreviewViewController()
        let navCon = navigationController ?? UINavigationController(rootViewController: view)
        navCon.modalPresentationStyle = .fullScreen
        let router = PreviewRouter(navigationController: navCon)
        let presenter = PreviewPresenter(router: router, interactor: interactor, view: view, imageData: imageData)
        view.presenter = presenter
        interactor.output = presenter
        
        return navigationController == nil ? navCon : view
    }
    
}

// MARK: - PreviewRouterInterface

extension PreviewRouter: PreviewRouterInterface { }
