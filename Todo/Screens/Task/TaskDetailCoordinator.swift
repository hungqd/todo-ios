//
//  TaskDetailCoordinator.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 6/3/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit
import RxSwift

class TaskDetailCoordinator : BaseCoordinator<Task> {

    private let parentViewController: UIViewController
    private let repository: TodoRepository

    init(parentViewController: UIViewController, repository: TodoRepository) {
        self.parentViewController = parentViewController
        self.repository = repository
    }

    override func start() -> Observable<Task> {
        let vc = TaskDetailViewController()
        let viewModel = TaskDetailViewModel(repository: repository)
        vc.viewModel = viewModel
        parentViewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        return Observable.merge(viewModel.onSaved, viewModel.onCancel.flatMap({ _ in Observable.error(CancelledError()) }))
            .take(1)
            .do(onDispose: { [weak self] in
                self?.parentViewController.dismiss(animated: true, completion: nil)
            })
    }
}
