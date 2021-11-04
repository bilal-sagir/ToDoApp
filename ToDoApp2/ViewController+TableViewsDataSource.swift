import UIKit

extension ViewController
{
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete
        {
            return
        }
        AppData.items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
    }
    
    
    
    
//    
//    override func numberOfSections(in tableView: UITableView) -> Int
//    {
//        return 2
//    }
//    
//    override func tableView(_ tableView: UITableView,
//                            titleForHeaderInSection section: Int) -> String?
//    {
//        let sectionName: String
//        switch section {
//        case 0:
//            sectionName = NSLocalizedString("Yapılacak İşler", comment: "Yapılacak İşler")
//        case 1:
//            sectionName = NSLocalizedString("Bitirilmiş İşler", comment: "Bitirilmiş İşler")
//            
//        default:
//            sectionName = ""
//        }
//        return sectionName
//    }

    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        AppData.items[indexPath.row].status = !AppData.items[indexPath.row].status
        tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AppData.items.count
    }
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let thisItem = AppData.items[indexPath.row]
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: thisItem.name)
        
        if thisItem.status
        {
            cell.backgroundColor = .lightGray
            cell.accessoryType = .checkmark
            
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                         value: 2,
                                         range: NSRange(location: 0,
                                                        length: attributeString.length))
            
        }
        else
        {
            cell.backgroundColor = .white
            cell.accessoryType = .none
            
            attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle,
                                            range: NSRange(location: 0,
                                                           length: attributeString.length))
        
        }

        cell.textLabel?.attributedText = attributeString
        return cell
    }

}

