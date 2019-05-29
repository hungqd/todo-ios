//
//  Task.swift
//  Todo
//
//  Created by Đặng Quang Hưng on 5/18/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation

class Task {
    var id: Int?
    var name: String
    var description: String
    var createDate: Date

    init(name: String, description: String, createDate: Date) {
        self.name = name
        self.description = description
        self.createDate = createDate
    }
}
