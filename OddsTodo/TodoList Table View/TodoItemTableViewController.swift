//
//  TodoItemTableViewController.swift
//  OddsTodo
//
//  Created by Olarn U. on 21/4/2565 BE.
//

import UIKit

protocol TodoItemCreatDelegate: AnyObject {
    func onTodoItemCreated(_ todoItem: Todo?)
}

class TodoItemTableViewController: UITableViewController {
    
    var todoItem: Todo?
    
    weak var delegate: TodoItemCreatDelegate?

    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var isDoneSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        //TODO: create or update todo item
        
        delegate?.onTodoItemCreated(todoItem)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
