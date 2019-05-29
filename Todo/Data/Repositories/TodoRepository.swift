//
//  TodoRepository.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation
import RxSwift

class TodoRepository {

    private let localDataSource: TodoDataSourceProtocol

    init(localDataSource: TodoDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    func getTasks() -> Observable<[Task]> {
        return localDataSource.getTasks()
    }
}
