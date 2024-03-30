//
//  SceneDelegate.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let controller = buildServicesController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Private
    
    private func buildServicesController() -> UIViewController {
        let networkManager = NetworkManager()
        let presenter = ServicesPresenter(networkManager: networkManager)
        let controller = ServicesViewController(presenter: presenter)
        presenter.view = controller
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }
}
