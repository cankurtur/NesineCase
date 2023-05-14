//
//  HomeInteractor.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import Foundation

// MARK: - InteractorInterface

protocol HomeInteractorInterface: InteractorInterface {
    func search(key: String)
    func downloadImages(urls: [URL])
}

// MARK: - InteractorOutput

protocol HomeInteractorOutput: AnyObject {
    func onSearchResponseReceived(_ result: Result<SearchResponse, APIClientError>)
    func onImageDataReceived(_ result: Result<(Data, ImageSizeCategory), ImageDownloadError>)
}

// MARK: - HomeInteractor

final class HomeInteractor {
    weak var output: HomeInteractorOutput?
    private var networkManager: NetworkManager<SearchEndpointItem>
    private var imageDownloadManager: ImageDownloadManagerInterface?

    init() {
        networkManager = NetworkManager<SearchEndpointItem>()
    }
}

// MARK: - HomeInteractorInterface

extension HomeInteractor: HomeInteractorInterface {
    func search(key: String) {
        networkManager.request(endpoint: .search(searchKey: key), responseType: SearchResponse.self) { [weak self] result in
            guard let self = self else { return }
            
            self.output?.onSearchResponseReceived(result)
        }
    }
    
    func downloadImages(urls: [URL]) {
        imageDownloadManager = ImageDownloadManager(urls: urls)
        startDownloadingImages()
    }
}

// MARK: - Helper

private extension HomeInteractor {
    func startDownloadingImages() {
        Task {
            await self.imageDownloadManager?.downloadAndCategorizeImages { [weak self] result in
                DispatchQueue.main.async {[weak self] in
                    guard let self else { return }
                    
                    self.output?.onImageDataReceived(result)
                }
            }
        }
    }
}
