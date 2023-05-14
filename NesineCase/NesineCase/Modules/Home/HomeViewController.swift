//
//  HomeViewController.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

// MARK: - Constant

private enum Constant {
    static let backgroundColor: UIColor = .white
    
    enum SearchBar {
        static let placeholder: String = Localizable.searchBarPlaceholder
    }
    
    enum SearchItemCollectionView {
        static let backgroundColor: UIColor = .clear
        static let minimumLineSpacing: CGFloat = 20
        static let headerHeight: CGFloat = 40
        static let cellWidthDivideConstant: CGFloat = 4
        static let cellHeightMultipleConstant: CGFloat = 2
    }
    
}

// MARK: - ViewInterface

protocol HomeViewInterface: ViewInterface {
    func prepareUI()
    func reloadData()
}

// MARK: - HomeViewController

final class HomeViewController: BaseViewController {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = Constant.SearchBar.placeholder
        return searchBar
    }()
    
    private lazy var searchItemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let searchItemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        searchItemCollectionView.delegate = self
        searchItemCollectionView.dataSource = self
        searchItemCollectionView.allowsMultipleSelection = false
        searchItemCollectionView.allowsSelection = true
        searchItemCollectionView.showsVerticalScrollIndicator = false
        searchItemCollectionView.showsHorizontalScrollIndicator = false
        searchItemCollectionView.backgroundColor = Constant.SearchItemCollectionView.backgroundColor
        searchItemCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        searchItemCollectionView.register(SearchItemHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchItemHeaderCollectionReusableView.identifier)
        return searchItemCollectionView
    }()
    
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: - HomeViewInterface

extension HomeViewController: HomeViewInterface {
    func prepareUI() {
        view.backgroundColor = Constant.backgroundColor
        
        setupLayout()
    }
    
    func reloadData() {
        searchItemCollectionView.reloadData()
    }
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getNumberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellModel = presenter.getCellModel(with: indexPath) else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(with: SearchCollectionViewCell.self, for: indexPath)
        cell.configure(with: cellModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(type: SearchItemHeaderCollectionReusableView.self, ofKind: kind, indexPath: indexPath)
            let headerName = presenter.getHeaderTitle(with: indexPath)
            header.configure(size: headerName)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / Constant.SearchItemCollectionView.cellWidthDivideConstant
        let height = width * Constant.SearchItemCollectionView.cellHeightMultipleConstant
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constant.SearchItemCollectionView.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: Constant.SearchItemCollectionView.headerHeight)
    }
}

// MARK: - Setup

private extension HomeViewController {
    func setupLayout() {
        view.addSubview(searchBar)
        view.addSubview(searchItemCollectionView)
        view.bringSubviewToFront(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchItemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            searchItemCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            searchItemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchItemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchItemCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
