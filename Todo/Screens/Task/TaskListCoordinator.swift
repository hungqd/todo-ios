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
    let repository: TodoRepository
    private let taskListVC:TaskListViewController

    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        repository = TodoRepository(localDataSource: MockTodoDataSource())
        taskListVC = TaskListViewController()
        let viewModel = TaskListViewModel(repository: repository)
        taskListVC.viewModel = viewModel
        viewController = UINavigationController(rootViewController: taskListVC)
        viewController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(named: "task-list"), selectedImage: nil)
        super.init()
        viewModel.onAddTask
            .subscribe(onNext: { [weak self] in self?.addTask() })
            .disposed(by: disposeBag)
    }

    override func start() -> Observable<Void> {
        parentViewController.present(viewController, animated: true, completion: nil)
        return Observable.never()
    }

    func addTask() {
        let taskDetailCoordinator = TaskDetailCoordinator(parentViewController: viewController, repository: repository)
        coordinate(to: taskDetailCoordinator).subscribe(onNext: { (task) in
            print("Saved: \(task)")
        }, onError: { (error) in
            print("Error: \(error)")
        }, onCompleted: {
            print("Task detail completed")
        }) {
            print("Task detail on disposed")
        }.disposed(by: disposeBag)
    }
}
