//
//  DogGalleryViewController.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 25/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import UIKit

class DogGalleryViewController: UICollectionViewController, Storyboarded {
    struct Constants {
        static let cellsPerRow: Int = 2
        static let loadingCellHeight: CGFloat = 50
        static let insets: CGFloat = 16
        static let margins: CGFloat = CGFloat(cellsPerRow + 1) * insets
        static let marginsLoading: CGFloat = 2 * insets
        static let cellImageMargins: CGFloat = 8.0 * 2.0
        static let cellUsedHeight: CGFloat = cellImageMargins + (4.0 * 2.0) + (3.0 * 20.5)
    }

    private var dogListViewModel = DogListViewModel()
    weak var coordinator: MainCoordinator?
    var token: String?
    var category: String?

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(refresh),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = .silver
        return refreshControl
    }()
}

// MARK: - Overrides
extension DogGalleryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        dogListViewModel.delegate = self
        dogListViewModel.setToken(token: self.token ?? "")
        dogListViewModel.setCategory(category: self.category ?? "")
        collectionView?.refreshControl = refreshControl
    }
}

// MARK: - Private methods
private extension DogGalleryViewController {
    @objc private func refresh() {
        dogListViewModel.fetch(refresh: true)
    }
}


// MARK: - Delegate
extension DogGalleryViewController {
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if case .dog = dogListViewModel.cellType(at: indexPath),
            let dogCell = cell as? DogCollectionViewCell {
            dogCell.bannerImage.kf.cancelDownloadTask()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell : UICollectionViewCell? = collectionView.cellForItem(at: indexPath)
        if let dogCell = cell as? DogCollectionViewCell {
            coordinator?.dogDetail(dogViewModel: dogCell.dogViewModel)
        }
    }
}

// MARK: - Datasource
extension DogGalleryViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogListViewModel.numberOfItens(in: section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellType = dogListViewModel.cellType(at: indexPath)
        switch cellType {
        case .dog(let dogViewModel):
            let cell = collectionView.dequeueReusableCell(viewType: DogCollectionViewCell.self, for: indexPath)
            cell.setup(dog: dogViewModel)
            return cell
        case .loading:
            let cell = collectionView.dequeueReusableCell(viewType: DogLoadingCollectionViewCell.self, for: indexPath)
            dogListViewModel.fetch()
            cell.setup()
            return cell
        }
    }
}


// MARK: - DogListViewModelDelegate
extension DogGalleryViewController: DogListViewModelDelegate {
    func dogListViewModelWasFetch(_ viewModel: DogListViewModel) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
        }
    }

    func dogListViewModel(_ viewModel: DogListViewModel, threw error: Error) {
        HandleError.handle(error: error)
    }
}

// MARK: - Flow layout
extension DogGalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellType = dogListViewModel.cellType(at: indexPath)
        switch cellType {
        case .dog:
            let width = (collectionView.frame.width - Constants.margins)/CGFloat(Constants.cellsPerRow)
            let imageSize: CGFloat = width - Constants.cellImageMargins
            let height: CGFloat = Constants.cellUsedHeight + imageSize
            return CGSize(width: width, height: height)
        case .loading:
            let width = (collectionView.frame.width - Constants.marginsLoading)
            return CGSize(width: width, height: Constants.loadingCellHeight)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.insets, left: Constants.insets, bottom: Constants.insets, right: Constants.insets)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.insets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.insets
    }
}
