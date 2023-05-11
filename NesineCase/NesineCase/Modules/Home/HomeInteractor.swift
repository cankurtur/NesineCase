//
//  HomeInteractor.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import Foundation

// MARK: - InteractorInterface

protocol HomeInteractorInterface: InteractorInterface {
    
}

// MARK: - InteractorOutput

protocol HomeInteractorOutput: AnyObject {
    
}

// MARK: - HomeInteractor

final class HomeInteractor {
    weak var output: HomeInteractorOutput?
}

// MARK: - HomeInteractorInterface

extension HomeInteractor: HomeInteractorInterface {
    
}
