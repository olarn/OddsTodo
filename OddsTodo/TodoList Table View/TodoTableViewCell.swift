//
//  TodoTableViewCell.swift
//  OddsTodo
//
//  Created by Olarn U. on 19/4/2565 BE.
//

import UIKit

protocol TodoTableViewCellDelegate: AnyObject {
    func onTodoItemChanged(_ todoItem: Todo?)
}

class TodoTableViewCell: UITableViewCell {
    
    var todoItem: Todo?
    
    weak var delegate: TodoTableViewCellDelegate?

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var doneSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setValueFor(_ todoItem: Todo) {
        self.todoItem = todoItem
        detailsLabel.text = todoItem.details
        dueDateLabel.text = todoItem.dueDate.description
        doneSwitch.isOn = todoItem.isDone
        iconImageView.image = todoItem.icon
    }

    @IBAction func doneSwitchValueChanged(_ sender: Any) {
        todoItem?.isDone = doneSwitch.isOn
        delegate?.onTodoItemChanged(todoItem)
    }
}
