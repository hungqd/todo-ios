//
//  TagCoordinator.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 6/3/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit
import RxSwift

class TagCoordinator : BaseCoordinator<Void> {

    private let parentViewContoller: UIViewController

    let viewController: UIViewController

    init(parentViewController: UIViewController) {
        self.parentViewContoller = parentViewController
        let vc = TagListViewController()
        viewController = UINavigationController(rootViewController: vc)
        viewController.tabBarItem = UITabBarItem(title: "Tags", image: UIImage(named: "tag"), selectedImage: nil)
    }

    override func start() -> Observable<Void> {
        parentViewContoller.present(viewController, animated: true, completion: nil)
        return Observable.never()
    }

    deinit {
        print("Deinit TagListCoordinator!")
    }
}
