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
}

// MARK: - InteractorOutput

protocol HomeInteractorOutput: AnyObject {
    func onSearchResponseReceived(_ result: Result<SearchResponse, APIClientError>)
}

// MARK: - HomeInteractor

final class HomeInteractor {
    weak var output: HomeInteractorOutput?
    private var networkManager: NetworkManager<SearchEndpointItem>
    
    init() {
        networkManager = NetworkManager<SearchEndpointItem>()
    }
}

// MARK: - HomeInteractorInterface

extension HomeInteractor: HomeInteractorInterface {
    func search(key: String) {
        networkManager.request(endpoint: .search(searchKey: key), responseType: SearchResponse.self) { [weak self] result in
            guard let self else { return }
            
            self.output?.onSearchResponseReceived(result)
        }
    }
}
