//
//  DogListViewModel.swift
//  desafios-iddog
//
//  Created by Carlos Alberto Mota Candreva on 27/08/19.
//  Copyright © 2019 Carlos Alberto Mota Candreva. All rights reserved.
//

import Foundation

/// Delegate to comunicate with controller
protocol DogListViewModelDelegate: class {

    /// Called when the list of dog is updated
    ///
    /// - Parameter viewModel: BeerListViewModel
    func dogListViewModelWasFetch(_ viewModel: DogListViewModel)


    /// Called when some error happen
    ///
    /// - Parameters:
    ///   - viewModel: BeerListViewModel
    ///   - error: Error
    func dogListViewModel(_ viewModel: DogListViewModel, threw error: Error)
}

class DogListViewModel {
    weak var delegate: DogListViewModelDelegate?

    private(set) var beers: [BeerViewModel] = []

    private var page: Int = 0
    private var service: BeerServiceProtocol
    private var fetchCompleted = false
    private var isFetching = false
    private var error = false

    init(beerService: BeerServiceProtocol = BeerService()) {
        self.service = beerService
    }
}

// MARK: - Private
private extension DogListViewModel {
    struct Constants {
        static let pageSize: Int = 8
    }

    func refresh() {
        page = 0
        fetchCompleted = false
    }
}

// MARK: - Auxiliar methods
extension DogListViewModel {

    /// Possible cell types
    ///
    /// - beer: beer cell
    /// - loading: loading cell
    enum CellType {
        case dog(DogListViewModel)
        case loading
    }


    /// Number of items in section
    ///
    /// - Parameter section: section
    /// - Returns: number of itens
    func numberOfItens(in section: Int) -> Int {
        let addLoadingCell = fetchCompleted || error ? 0 : 1
        return dogs.count + addLoadingCell
    }


    /// Cell type at index path
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: Cell type
    func cellType(at indexPath: IndexPath) -> CellType {
        if indexPath.row > beers.count - 1 {
            return .loading
        }
        return .dogs(dogs[indexPath.row])
    }


    /// Fetches beer list
    ///
    /// - Parameter refresh: True if screen is being refreshed
    func fetch(refresh: Bool = false) {
        guard (!fetchCompleted && !isFetching) || !isFetching else {
            return
        }

        if refresh {
            self.refresh()
        }

        error = false
        page += 1
        isFetching = true
        service.getBeerList(page: page, perPage: Constants.pageSize) { [weak self] (callback) in
            guard let weakSelf = self else { return }
            do {

                let beerList = try callback()

                if refresh {
                    weakSelf.beers = []
                }
                if beerList.beers.isEmpty {
                    weakSelf.fetchCompleted = true
                } else {
                    weakSelf.beers.append(contentsOf: beerList.beers.map({ (beer) -> BeerViewModel in
                        BeerViewModel(beer)
                    }))
                }

                weakSelf.delegate?.dogListViewModelWasFetch(weakSelf)
            } catch {
                weakSelf.delegate?.dogListViewModel(weakSelf, threw: error)
                weakSelf.error = true
                weakSelf.page -= 1
                weakSelf.delegate?.dogListViewModelWasFetch(weakSelf)
            }
            weakSelf.isFetching = false
        }
    }
}
