//
//  TodoDataSourceProtocol.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation
import RxSwift

protocol TodoDataSourceProtocol {
    func getTasks() -> Observable<[Task]>
    func addTask(task: Task) -> Single<Int>
    func updateTask(task: Task) -> Completable
    func deleteTask(id: Int) -> Completable
}
