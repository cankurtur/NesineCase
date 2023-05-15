//
//  PreviewViewController.swift
//  NesineCaseTests
//
//  Created by Can Kurtur on 14.05.2023.
//

@testable import NesineCase
import UIKit

final class MockPreviewViewController: PreviewViewInterface {

    var isPrepareUICalled: Bool = false
  
    func prepareUI(with imageData: Data) {
        isPrepareUICalled = true
    }
    
}
