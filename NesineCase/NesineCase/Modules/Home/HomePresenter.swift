//
//  HomePresenter.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import Foundation

// MARK: - HomePresenterInterface

protocol HomePresenterInterface: PresenterInterface {
    func getNumberOfSections() -> Int
    func getNumberOfItemsInSection(_ section: Int) -> Int
    func didSelectItem(at indexPath: IndexPath)
    func getCellModel(with indexPath: IndexPath) -> Data?
    func getHeaderTitle(with section: Int) -> String
}

// MARK: - HomePresenter

final class HomePresenter {
    
    private let router: HomeRouterInterface
    private let interactor: HomeInteractorInterface
    private weak var view: HomeViewInterface?
    private var groupedImageModel: [GroupedImageModel] = []

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
    
    func getNumberOfSections() -> Int {
        return groupedImageModel.count
    }
    
    func getNumberOfItemsInSection(_ section: Int) -> Int {
        return groupedImageModel[section].images.count
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let imageData = groupedImageModel[indexPath.section].images[indexPath.row]
        router.navigateToPreview(imageData: imageData)
    }
    
    func getCellModel(with indexPath: IndexPath) -> Data? {
        return groupedImageModel[indexPath.section].images[indexPath.row]
    }
    
    func getHeaderTitle(with section: Int) -> String {
        return groupedImageModel[section].size.sectionName
    }
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    
}
