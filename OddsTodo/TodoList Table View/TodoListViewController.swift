//
//  ViewController.swift
//  OddsTodo
//
//  Created by Olarn U. on 19/4/2565 BE.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TodoTableViewCellDelegate {
    
    var todoList: OddsTodo {
        get {
            TodoStore.getAll()
        }
        set {
            TodoStore.save(todoList: newValue)
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "todoCell",
                for: indexPath) as? TodoTableViewCell
        else {
            return UITableViewCell()
        }
        
        let todoItem = todoList[indexPath.row]
        cell.setValueFor(todoItem)
        cell.delegate = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoItem = todoList[indexPath.row]
        navigateToTodoItemViewControllerWith(todoItem)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
//        todoList.append(Todo(
//            details: "Test \(todoList.count + 1)",
//            dueDate: Date(),
//            isDone: false,
//            type: .task)
//        )
        navigateToTodoItemViewControllerWith(nil)
    }
    
    func navigateToTodoItemViewControllerWith(_ todoItem: Todo?) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "todoItemScene")
        if let todoItemVC = viewController as? TodoItemTableViewController {
            todoItemVC.todoItem = todoItem
            navigationController?.pushViewController(todoItemVC, animated: true)
        }
    }
    
    func onTodoItemChanged(_ todoItem: Todo?) {
        if let item = todoItem {
            todoList = todoList.update(item)
        }
    }
}

