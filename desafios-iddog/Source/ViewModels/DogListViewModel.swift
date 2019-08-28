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
    /// - Parameter viewModel: DogListViewModel
    func dogListViewModelWasFetch(_ viewModel: DogListViewModel)


    /// Called when some error happen
    ///
    /// - Parameters:
    ///   - viewModel: DogListViewModel
    ///   - error: Error
    func dogListViewModel(_ viewModel: DogListViewModel, threw error: Error)
}

class DogListViewModel {
    weak var delegate: DogListViewModelDelegate?

    private(set) var dogs: [DogViewModel] = []

    private var token: String = ""
    private var category: String = ""
    private var service: DogServiceProtocol
    private var fetchCompleted = false
    private var isFetching = false
    private var error = false

    init(dogsService: DogServiceProtocol = DogsService()) {
        self.service = dogsService
    }
}

// MARK: - Private
private extension DogListViewModel {
    func refresh() {
        fetchCompleted = false
    }
}

// MARK: - Auxiliar methods
extension DogListViewModel {

    /// Possible cell types
    ///
    /// - dog: dog cell
    /// - loading: loading cell
    enum CellType {
        case dog(DogViewModel)
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
        if indexPath.row > dogs.count - 1 {
            return .loading
        }
        return .dog(dogs[indexPath.row])
    }


    /// Fetches dog list
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
        isFetching = true
        service.getDogsList(token: token, category: category) { [weak self] (callback) in
            guard let weakSelf = self else { return }
            do {

                let dogList = try callback()

                if refresh {
                    weakSelf.dogs = []
                }
                if dogList.isEmpty {
                    weakSelf.fetchCompleted = true
                } else {
                    weakSelf.dogs = dogList
                }
                weakSelf.delegate?.dogListViewModelWasFetch(weakSelf)
            } catch {
                weakSelf.delegate?.dogListViewModel(weakSelf, threw: error)
                weakSelf.error = true
                weakSelf.delegate?.dogListViewModelWasFetch(weakSelf)
            }
            weakSelf.isFetching = false
        }
    }

    func setToken(token: String) {
        self.token = token
    }

    func setCategory(category: String) {
        self.category = category
    }
}
