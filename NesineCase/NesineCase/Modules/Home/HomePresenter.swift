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
    func getHeaderTitle(with indexPath: IndexPath) -> String
}

// MARK: - HomePresenter

final class HomePresenter {
    
    private let router: HomeRouterInterface
    private let interactor: HomeInteractorInterface
    private weak var view: HomeViewInterface?
    private var imagesByCategory: [ImageSizeCategory: [Data]] = [
        .small: [],
        .medium: [],
        .large: [],
        .xlarge: []
    ]
    
    init(router: HomeRouterInterface,
         interactor: HomeInteractorInterface,
         view: HomeViewInterface?)
    {
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
        return imagesByCategory.count
    }
    
    func getNumberOfItemsInSection(_ section: Int) -> Int {
        let category = ImageSizeCategory.allCases[section]
        return imagesByCategory[category]?.count ?? 0
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let category = ImageSizeCategory.allCases[indexPath.section]
        let imageData = imagesByCategory[category]?[indexPath.row]
        guard let imageData = imageData else { return }
        
        router.navigateToPreview(imageData: imageData)
    }
    
    func getCellModel(with indexPath: IndexPath) -> Data? {
        let category = ImageSizeCategory.allCases[indexPath.section]
        let imageData = imagesByCategory[category]?[indexPath.row]
        return imageData
    }
    
    func getHeaderTitle(with indexPath: IndexPath) -> String {
        let header = ImageSizeCategory.allCases[indexPath.section].rawValue
        return header
    }
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {
    func onSearchResponseReceived(_ result: Result<SearchResponse, APIClientError>) {
        switch result {
        case .success(let response):
            let screenshotUrlsArray = response.results.flatMap { $0.screenshotUrls ?? [] }
            let urls = screenshotUrlsArray.compactMap({ URL(string: $0) })
            interactor.downloadImages(urls: urls)
        case .failure(let error):
            print(error.message)
        }
    }
    
    func onImageDataReceived(_ result: Result<(Data, ImageSizeCategory), ImageDownloadError>) {
        switch result {
        case .success(let response):
            let (data, category) = response
            imagesByCategory[category]?.append(data)

            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                
                self.view?.reloadData()
            }
        case .failure(let error):
            print(error)
        }
    }
}
