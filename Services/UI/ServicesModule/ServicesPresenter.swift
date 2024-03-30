//
//  ServicesPresenter.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

final class ServicesPresenter {
    
    // MARK: - Dependencies
    
    private let networkManager: INetworkManager
    
    weak var view: IServicesView?
    
    // MARK: - Properties
    
    private(set) var services: [Service] = []
    
    // MARK: - Init
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
}

// MARK: - IServicesPresenter

extension ServicesPresenter: IServicesPresenter {
    
    func viewDidLoad() {
        networkManager.fetchServices { [weak self] result in
            switch result {
            case .success(let apps):
                self?.services = apps.body.services
                self?.view?.showServices()
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
}
