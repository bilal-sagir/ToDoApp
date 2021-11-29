import UIKit


extension ViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.placeholder = nil
        textField.becomeFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        if let newName = textField.text
        {
            textField.text = ""
            textField.placeholder = "Yeni İş Ekle"
            
            for i in 0..<AppData.items.count //adding Dublicates issue. Not Working fix it reminder
            {
            
                if AppData.items[i].name.lowercased() == newName.lowercased()
                {
                    
                    AppData.items[i].status = false
                    tableView.reloadData()
                    return true
                }
            }
            
            let newItem = Item(name: newName, status: false)
            AppData.items.append(newItem)
            ActiveItems.append(newItem)
            
            self.tableView.beginUpdates()
            let newIndexPath = IndexPath(row: ActiveItems.count - 1, section: 0)
            self.tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.right)
            self.tableView.endUpdates()
            
            ReadWrite.write()
            
            return true
        }
        else
        {
            return false
        }

    }
    
}
