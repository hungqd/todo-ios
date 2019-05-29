//
//  MainCoordinator.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit
import RxSwift

class MainCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let taskListVC = TaskListViewController()
        taskListVC.navigationItem.title = "Tasks"
        taskListVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: nil, action: nil)
        taskListVC.repository = TodoRepository(localDataSource: MockTodoDataSource())
        let taskListNC = UINavigationController(rootViewController: taskListVC)
        taskListNC.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(named: "task-list"), selectedImage: nil)

        let tagListVC = TagListViewController()
        tagListVC.navigationItem.title = "Tags"
        let tagListNC = UINavigationController(rootViewController: tagListVC)
        tagListNC.tabBarItem = UITabBarItem(title: "Tags", image: UIImage(named: "tag"), selectedImage: nil)

        let mainVC = MainViewController()
        mainVC.viewControllers = [taskListNC, tagListNC]
        window.rootViewController = mainVC
        window.makeKeyAndVisible()
        return Observable.never()
    }
}
