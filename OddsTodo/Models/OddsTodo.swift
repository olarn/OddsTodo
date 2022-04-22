//
//  OddsTodo.swift
//  OddsTodo
//
//  Created by Olarn U. on 21/4/2565 BE.
//

import Foundation

typealias OddsTodo = [Todo]

extension OddsTodo {
    var sortByDueDate: OddsTodo {
        return self.sorted { $0.dueDate < $1.dueDate }
    }
    
    func update(_ todo: Todo) -> OddsTodo {
        var newTodoList = self.filter { $0.id != todo.id }
        newTodoList.append(todo)
        return newTodoList
    }
}
