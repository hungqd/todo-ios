//
//  BaseCoordinator.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit
import RxSwift

class BaseCoordinator<R> {

    let identifier = UUID()

    let disposeBag = DisposeBag()

    private var coordinators = [UUID: Any]()

    func store<T>(_ coordinator: BaseCoordinator<T>) {
        coordinators[coordinator.identifier] = coordinator
    }

    func free<T>(_ coordinator: BaseCoordinator<T>) {
        coordinators[coordinator.identifier] = nil
    }

    func coordinate<R>(to coordinator: BaseCoordinator<R>) -> Observable<R> {
        store(coordinator)
        return coordinator.start().do(onCompleted: { [weak self] in
            self?.free(coordinator)
        })
    }

    func start() -> Observable<R> {
        fatalError("Not implemented!")
    }
}
