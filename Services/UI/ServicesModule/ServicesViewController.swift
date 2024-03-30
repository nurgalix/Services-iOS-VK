//
//  ServicesViewController.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import UIKit
import SnapKit
import SafariServices

final class ServicesViewController: BaseViewController {
    
    // MARK: - Dependencies
    
    private let presenter: IServicesPresenter
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellWithClass: ServiceTableViewCell.self)
        return tableView
    }()
    
    // MARK: - Init
    
    init(presenter: IServicesPresenter) {
        self.presenter = presenter
        super.init()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private
    
    private func setupTitle() {
        title = "Сервисы"
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.edgesToSuperview()
    }
    
    private func openLink(for index: Int) {
        let service = presenter.services[index]
        guard let url = URL(string: service.link) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            let controller = SFSafariViewController(url: url)
            present(controller)
        }
    }
}

// MARK: - UITableViewDataSource

extension ServicesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: ServiceTableViewCell.self, for: indexPath)
        let service = presenter.services[indexPath.row]
        cell.configure(with: service)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ServicesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        openLink(for: indexPath.row)
    }
}

// MARK: - IServicesView

extension ServicesViewController: IServicesView {
    
    func showServices() {
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        let okAction = UIAlertAction(title: "Ок", style: .default)
        let alertController = UIAlertController(
            title: "Ошибка",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alertController.addAction(okAction)
        alertController.preferredAction = okAction
        present(alertController)
    }
}
