//
//  PreviewInteractor.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

// MARK: - InteractorInterface

protocol PreviewInteractorInterface: InteractorInterface {
    
}

// MARK: - InteractorOutput

protocol PreviewInteractorOutput: AnyObject {
    
}

// MARK: - PreviewInteractor

final class PreviewInteractor {
    weak var output: PreviewInteractorOutput?
}

// MARK: - PreviewInteractorInterface

extension PreviewInteractor: PreviewInteractorInterface {
    
}
