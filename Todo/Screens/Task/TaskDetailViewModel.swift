//
//  TaskDetailViewModel.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 6/3/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation
import RxSwift

class TaskDetailViewModel {

    private let repository: TodoRepository

    private let disposeBag = DisposeBag()

    let cancel: AnyObserver<Void>
    let onCancel: Observable<Void>

    let save: AnyObserver<Void>

    private let _onSaved = PublishSubject<Task>()
    let onSaved: Observable<Task>

    init(repository: TodoRepository) {
        self.repository = repository
        let _cancel = PublishSubject<Void>()
        cancel = _cancel.asObserver()
        onCancel = _cancel.asObservable()
        onSaved = _onSaved.asObservable()
        let _save = PublishSubject<Void>()
        save = _save.asObserver()
        _save.asObservable().subscribe(onNext: { [weak self] in
            self?.saveTask()
        }).disposed(by: disposeBag)
    }

    private func saveTask() {
        _onSaved.onNext(Task(name: "Task", description: "Task", createDate: Date()))
    }
}
