//
//  TasksViewModel.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation
import RxSwift

class TaskListViewModel {

    private let repository: TodoRepository

    let addTask: AnyObserver<Void>
    let onAddTask: Observable<Void>

    init(repository: TodoRepository) {
        self.repository = repository
        let _addTask = PublishSubject<Void>()
        addTask = _addTask.asObserver()
        onAddTask = _addTask.asObservable()
    }

    func getTasks() -> Observable<[Task]>  {
        return repository.getTasks()
    }
}
