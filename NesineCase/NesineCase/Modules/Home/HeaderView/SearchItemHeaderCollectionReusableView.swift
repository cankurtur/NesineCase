//
//  SearchItemHeaderCollectionReusableView.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

// MARK: - Constant

private enum Constant {
    static let backgroundColor: UIColor = .lightGray
    
    enum SizeLabel {
        static let textColor: UIColor = .black
        static let font: UIFont = .systemFont(ofSize: 16, weight: .semibold)
        static let leadingConstraintConstant: CGFloat = 15
        static let trailingConstraintConstant: CGFloat = -15
    }
}

// MARK: - SearchItemHeaderCollectionReusableView

final class SearchItemHeaderCollectionReusableView: UICollectionReusableView {

    private lazy var sizeLabel: UILabel = {
        let sizeLabel = UILabel()
        sizeLabel.textColor = Constant.SizeLabel.textColor
        sizeLabel.font = Constant.SizeLabel.font
        return sizeLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(size: String) {
        sizeLabel.text = size
    }
}

// MARK: - Prepares

private extension SearchItemHeaderCollectionReusableView {
    func prepareUI() {
        backgroundColor = Constant.backgroundColor
        
        setupLayout()
    }
}

// MARK: - Setup

private extension SearchItemHeaderCollectionReusableView {
    func setupLayout() {
        addSubview(sizeLabel)
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            sizeLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            sizeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constant.SizeLabel.leadingConstraintConstant),
            sizeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constant.SizeLabel.trailingConstraintConstant)
        ])
    }
}
