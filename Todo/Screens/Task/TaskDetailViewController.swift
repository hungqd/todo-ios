//
//  TaskDetailViewController.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 6/3/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskDetailViewController: UIViewController {

    private let disposeBag = DisposeBag()

    var viewModel: TaskDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Task"
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        if let viewModel = viewModel {
            backButton.rx.tap.bind(to: viewModel.cancel).disposed(by: disposeBag)
        }
        navigationItem.leftBarButtonItem = backButton

        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        if let viewModel = viewModel {
            saveButton.rx.tap.bind(to: viewModel.save).disposed(by: disposeBag)
        }
        navigationItem.rightBarButtonItem = saveButton
    }
}
