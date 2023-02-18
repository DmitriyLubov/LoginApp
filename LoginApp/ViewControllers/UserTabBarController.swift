//
//  UserTabBarController.swift
//  LoginApp
//
//  Created by Дмитрий Лубов on 17.02.2023.
//

import UIKit

final class UserTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
