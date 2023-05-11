//
//  HomeViewController.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

// MARK: - Constant

private enum Constant { }

// MARK: - ViewInterface

protocol HomeViewInterface: ViewInterface {
    func prepareUI()
}

// MARK: - HomeViewController

final class HomeViewController: BaseViewController {
    
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        view.backgroundColor = .red
    }

}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {
    func prepareUI() {
        
    }
}
