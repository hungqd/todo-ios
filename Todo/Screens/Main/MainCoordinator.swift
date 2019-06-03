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
    private var taskListCoordinator: TaskListCoordinator!
    private var tagCoordinator: TagCoordinator!

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let mainVC = MainViewController()
        taskListCoordinator = TaskListCoordinator(parentViewController: mainVC)
        tagCoordinator = TagCoordinator(parentViewController: mainVC)
        mainVC.viewControllers = [taskListCoordinator.viewController, tagCoordinator.viewController]
        window.rootViewController = mainVC
        window.makeKeyAndVisible()
        return Observable.never()
    }
}
