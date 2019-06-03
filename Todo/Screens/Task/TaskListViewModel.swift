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

    init(repository: TodoRepository) {
        self.repository = repository
    }

    func getTasks() -> Observable<[Task]>  {
        return repository.getTasks()
    }
}
