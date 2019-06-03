//
//  TaskListCoordinator.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 6/3/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit
import RxSwift

class TaskListCoordinator : BaseCoordinator<Void> {

    private let parentViewController: UIViewController

    let viewController: UIViewController

    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        let vc = TaskListViewController()
        vc.repository = TodoRepository(localDataSource: MockTodoDataSource())
        viewController = UINavigationController(rootViewController: vc)
        viewController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(named: "task-list"), selectedImage: nil)
    }

    override func start() -> Observable<Void> {
        parentViewController.present(viewController, animated: true, completion: nil)
        return Observable.never()
    }
}
