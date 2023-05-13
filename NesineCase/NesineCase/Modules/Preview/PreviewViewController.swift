//
//  PreviewViewController.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import UIKit

// MARK: - Constant

private enum Constant {
    static let backgroundColor: UIColor = .white
}

// MARK: - ViewInterface

protocol PreviewViewInterface: ViewInterface {
    func prepareUI(with imageData: Data)
}

// MARK: - PreviewViewController

final class PreviewViewController: BaseViewController {

    private lazy var previewImageView: UIImageView = {
        let previewImageView = UIImageView(frame: .zero)
        previewImageView.contentMode = .scaleAspectFit
        return previewImageView
    }()
    
    var presenter: PreviewPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}


// MARK: - PreviewViewInterface

extension PreviewViewController: PreviewViewInterface {
    func prepareUI(with imageData: Data) {
        view.backgroundColor = Constant.backgroundColor
        
        setupLayout()
        previewImageView.image = UIImage(data: imageData)
    }
}

// MARK: - Setup

private extension PreviewViewController {
    func setupLayout() {
        view.addSubview(previewImageView)
        previewImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            previewImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            previewImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
