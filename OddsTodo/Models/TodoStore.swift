//
//  TodoStore.swift
//  OddsTodo
//
//  Created by Olarn U. on 20/4/2565 BE.
//

import Foundation

class TodoStore {
    private static var todoList: OddsTodo = []
    
    static func getAll() -> OddsTodo {
        return todoList.sortByDueDate
    }
    
    static func save(todoList: OddsTodo) {
        self.todoList = todoList
    }
}
