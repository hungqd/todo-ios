//
//  MockTodoDataSource.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation
import RxSwift

class NotImplementedError: Error {
    var localizedDescription: String {
        get {
            return "Not implemented!"
        }
    }
}

class MockTodoDataSource: TodoDataSourceProtocol {

    private let tasks: [Task]

    init() {
        var task: [Task] = []
        for i in 1...100 {
            task.append(Task(name: "Task \(i)", description: "Task \(i) description", createDate: Date()))
        }
        self.tasks = task
    }

    func getTasks() -> Observable<[Task]> {
        return Observable.just(tasks)
    }

    func addTask(task: Task) -> Single<Int> {
        return Single.error(NotImplementedError())
    }

    func updateTask(task: Task) -> Completable {
        return Completable.error(NotImplementedError())
    }

    func deleteTask(id: Int) -> Completable {
        return Completable.error(NotImplementedError())
    }


}
