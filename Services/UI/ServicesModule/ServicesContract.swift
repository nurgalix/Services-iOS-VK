//
//  ServicesContract.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

protocol IServicesPresenter: AnyObject {
    
    var services: [Service] { get }
    
    func viewDidLoad()
}

protocol IServicesView: AnyObject {
    
    func showServices()
    func showError(_ error: Error)
}
