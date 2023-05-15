//
//  PreviewPresenterTests.swift
//  NesineCaseTests
//
//  Created by Can Kurtur on 14.05.2023.
//

@testable import NesineCase
import XCTest

final class PreviewPresenterTests: XCTestCase {

    var sut: PreviewPresenter!
    var mockRouter: MockPreviewRouter!
    var mockInteractor: MockPreviewInteractor!
    var mockView: MockPreviewViewController!
    var mockData: Data!

    override func setUp() {
        mockRouter = MockPreviewRouter()
        mockInteractor = MockPreviewInteractor()
        mockView = MockPreviewViewController()
        mockData = Data()
        
        sut = PreviewPresenter(router: mockRouter, interactor: mockInteractor, view: mockView, imageData: mockData)
        mockInteractor.output = sut
    }

    func test_viewDidLoad_success() {
        // Given
        XCTAssertFalse(mockView.isPrepareUICalled)
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertTrue(mockView.isPrepareUICalled)
    }
}
