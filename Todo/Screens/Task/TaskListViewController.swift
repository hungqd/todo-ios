//
//  TaskViewController.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit
import RxSwift

class TaskListViewController: UITableViewController {

    private let disposeBag = DisposeBag()

    var viewModel: TaskListViewModel?

    private var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Tasks"

        let addItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addItem

        viewModel?.getTasks().subscribe(onNext: { (tasks) in
            self.tasks.removeAll()
            self.tasks.append(contentsOf: tasks)
            self.tableView.reloadData()
        }, onError: { (error) in
            print("Error getting all task: \(error)")
            self.tasks.removeAll()
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TaskTableViewCell")
        let task = tasks[indexPath.row]
        cell.accessoryType = .checkmark
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.description
        return cell
    }

    @objc func addTapped() {
        print("Add button tapped")
    }
}
